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

import java.util.*;
import java.io.*;
import java.net.*;

/**
 * Class responsible for sending events Every event sent is tagged with an epoch
 * number and a sequence number
 * 
 * @author Nalini Belaramani
 * @version
 */
public class EventSender {
  private NetAddr myAddr;
  @SuppressWarnings("unchecked")
  private Hashtable<ID, Marshaller> marshallers;
  private int currEpoch;
  private Hashtable<NetAddr, SeqNum> seqNums = new Hashtable<NetAddr, SeqNum>();
  private Hashtable<NetAddr, DataOutputStream> outgoingStreams = new Hashtable<NetAddr, DataOutputStream>();
  // private static boolean dbg = true;
  private static boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  @SuppressWarnings("unchecked")
  public EventSender(NetAddr myAddr, Hashtable<ID, Marshaller> marshallers,
      int currEpoch) {
    this.myAddr = myAddr;
    this.marshallers = marshallers;
    this.currEpoch = currEpoch;
  }

  /**
   * send - sends the epoch number, sequence number - then sends the tuple via
   * its marshaller
   */
  @SuppressWarnings("unchecked")
  public void send(Tuple t) {
    boolean sent = false;
    if (dbg) {
      System.out.println("Event Sender:: need to send " + t);
    }
    NetAddr netAddr = t.getTerm(0);
    if (netAddr.equals(myAddr)) {
      System.out.println("Error:: EventSender cannot send tuple " + t
          + "  to myself.");
      return;
    }
    DataOutputStream dos = outgoingStreams.get(netAddr);
    while (!sent) {
      try {
        if (dos == null) {
          // let's initialize a connection to the receiver
          Socket s = new Socket(netAddr.getHost(), netAddr.getPort());
          dos = new DataOutputStream(new BufferedOutputStream(s
              .getOutputStream()));
          outgoingStreams.put(netAddr, dos);
          // send my netAddr over the stream
          if (dbg)
            System.out.println("EventSender:: Sending my addr");
          netAddr.writeToStream(myAddr, dos);
          dos.flush();
        }
        SeqNum seqNum = seqNums.get(netAddr);
        if (seqNum == null) {
          seqNum = new SeqNum(currEpoch);
          seqNums.put(netAddr, seqNum);
        }
        // send the sequence number
        if (dbg)
          System.out.println("EventSender:: Writing seq num " + seqNum);
        seqNum.writeToStream(seqNum, dos);
        dos.flush();
        // send the tuple
        if (dbg)
          System.out.println("EventSender:: Writing tuple" + t);
        marshallers.get(t.getId()).writeToStream(t, dos);
        dos.flush();
        sent = true;
        // update the sequence number
        seqNum.increment();
      } catch (SocketException se) {
        // for broken pipe exception just reset the socket and send again
        if (se.getMessage().equalsIgnoreCase("Broken pipe")
            || se.getMessage().equalsIgnoreCase("Socket closed")) {
          if (dbg) {
            System.out.println(" exception" + se.getMessage()
                + ", retrying again!");
          }
          try {
            dos.close();
          } catch (Exception ec) {
          }
          ; // ignore exception
          outgoingStreams.remove(netAddr);
          dos = null;
        } else {
          System.out.println("Error sending tuple" + t + "to " + netAddr + ":"
              + se.getMessage());
          if (dbg) {
            se.printStackTrace();
          }
          sent = true;
        }
      } catch (Exception e) {
        // for other exceptions, break out of while loop
        System.out.println("Error sending tuple" + t + " to " + netAddr + ":"
            + e.getMessage());
        if (dbg) {
          e.printStackTrace();
        }
        if (dos != null) {
          try {
            dos.close();
          } catch (Exception ec) {
          }
          ; // ignore exception
          outgoingStreams.remove(netAddr);
        }
        sent = true;
      }
    }// while
  }

  /**
   * shutdown - close all outgoing streams
   */
  public void shutdown() {
    Iterator<DataOutputStream> i = outgoingStreams.values().iterator();
    while (i.hasNext()) {
      DataOutputStream dos = i.next();
      try {
        dos.close();
      } catch (Exception e) {
        // we can ignore this exception
      }
    }
    outgoingStreams.clear();
  }
}
