/*
 * OverlogRuntime - A Java Runtime for Overlog
 * Copyright (C) 2008 The University of Texas at Austin
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 * USA.
 */
package xtc.lang.overlog.runtime;

import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.Thread;

/**
 * Receives tuples from a stream
 * 
 * @author Nalini Belaramani
 * @version
 */
public class IncomingConnection extends Thread {
  @SuppressWarnings("unchecked")
  private Hashtable<ID, Marshaller> marshallers;
  private EventReceiver eReceiver;
  private Socket s;
  private NetAddr sendAddr;
  private DataInputStream dis;
  private boolean shutdown = false;
  private static boolean dbg = OLG.dbg;

  /**
   * constructor
   */
  @SuppressWarnings("unchecked")
  public IncomingConnection(Hashtable<ID, Marshaller> marshallers,
      EventReceiver eReceiver, Socket s) {
    this.marshallers = marshallers;
    this.eReceiver = eReceiver;
    this.s = s;
  }

  /**
   * shutdown
   */
  public void shutdown() {
    if (!shutdown) {
      if (dbg)
        System.out.println("IncommingConnection:: shutting down");
      shutdown = true;
      try {
        if (dis != null)
          dis.close();
        s.close();
      } catch (Exception e) {
      } // can be ignored
    }
  }

  /**
   * run -- reads sequence numbers and the tuples
   */
  @Override
  @SuppressWarnings("unchecked")
  public void run() {
    // instances of netAddr and Id for marshalling
    NetAddr n = new NetAddr();
    SeqNum sq = new SeqNum();
    ID i = new ID();
    try {
      if (dbg)
        System.out.println("IncomingConnection:: connection initiated");
      dis = new DataInputStream(new BufferedInputStream(s.getInputStream()));
      // read the address of the sender
      sendAddr = n.readFromStream(dis);
      if (dbg)
        System.out.println("IncomingConnection:: established from " + sendAddr);
      while (!shutdown) {
        SeqNum currSeq = sq.readFromStream(dis);
        // peeks into the data stream for the ID
        dis.mark(4); // to mark the current position in the stream
        ID id = i.readFromStream(dis);
        dis.reset(); // reset to the mark
        Marshaller m = marshallers.get(id);
        if (m == null) {
          System.out
              .println("OverlogRuntime Error: Could not find marshaller for received tuple with seqNum="
                  + currSeq);
        }
        Tuple t = (Tuple) m.readFromStream(dis);
        if (dbg)
          System.out.println("IncommingConnection received: " + t);
        // pass it on to eReceiver to filter it and put it in queue
        eReceiver.filterMsg(sendAddr, currSeq, t);
      }
    } catch (Exception e) {
      if (dbg)
        e.printStackTrace();
      if (!shutdown) {
        shutdown();
        // remove the connection from the eReceiver
        eReceiver.removeConnection(this);
      }
    }
  }

  @Override
  public String toString() {
    return "IncomingConnection from sender " + sendAddr;
  }
}
