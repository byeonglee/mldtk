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

import java.lang.Thread;
import java.util.*;
import java.net.*;

/**
 * Listen on the port for incomming connections
 * 
 * @author Nalini Belaramani
 * @version
 */
public class EventReceiver extends Thread {
  private NetAddr myAddr;
  private EventQueue eQueue;
  @SuppressWarnings("unchecked")
  private Hashtable<ID, Marshaller> marshallers;
  private int port;
  private ServerSocket ss;
  // list of incoming connections
  LinkedList<IncomingConnection> incomingConnections = new LinkedList<IncomingConnection>();
  // stores last sequence number received from every sender
  Hashtable<NetAddr, SeqNum> receivedSeqNum = new Hashtable<NetAddr, SeqNum>();
  private boolean shutdown = false;
  public static boolean dbg = OLG.dbg;

  /**
   * constructor
   */
  @SuppressWarnings("unchecked")
  public EventReceiver(NetAddr myAddr, EventQueue eQueue,
      Hashtable<ID, Marshaller> marshallers) {
    this.myAddr = myAddr;
    this.eQueue = eQueue;
    this.marshallers = marshallers;
    this.port = myAddr.getPort();
  }

  /**
   * shutdown
   */
  public void shutdown() {
    if (!shutdown) {
      if (dbg)
        System.out.println("EventReceiver: shutting down");
      try {
        shutdown = true;
        // shutdonw all incoming connections
        if (dbg)
          System.out.println("EventReceiver: incomming connection"
              + incomingConnections);
        Iterator<IncomingConnection> i = incomingConnections.iterator();
        while (i.hasNext()) {
          IncomingConnection conn = i.next();
          try {
            if (dbg)
              System.out.println("EventReceiver: shutting down " + conn);
            conn.shutdown();
          } catch (Exception e) {
            if (dbg)
              e.printStackTrace();
          } // ignore exception
        }
        ss.close();
        incomingConnections.clear();
      } catch (Exception e) {
        // ignore exception
      }
      if (dbg)
        System.out.println("EventReceiver: shut");
    }
  }

  /**
   * run
   */
  @Override
  public void run() {
    try {
      ss = new ServerSocket(port);
      Socket s;
      while (!shutdown) {
        s = ss.accept();
        IncomingConnection ic = new IncomingConnection(marshallers, this, s);
        incomingConnections.add(ic);
        ic.start();
      }
    } catch (SocketException se) {
      // socket closed
      shutdown();
    } catch (Exception e) {
      System.out.println("Error in receiver");
      e.printStackTrace();
      shutdown();
    }
  }

  /**
   * remove connections. caled by incoming connection whnever it sees an
   * exception
   */
  public void removeConnection(IncomingConnection ic) {
    incomingConnections.remove(ic);
  }

  /**
   * FilterMsg - filters out msgs that have older seq number TOD: should we
   * throw an exception or just print out if we miss a message
   */
  public void filterMsg(NetAddr senderAddr, SeqNum currSeq, Tuple t) {
    if (dbg) {
      System.out.println("EventReciever:: received from " + senderAddr
          + " with seqNum=" + currSeq + "tuple = " + t);
    }
    if (currSeq.getEpoch() <= 0) {
      // we don't need to do any checking, we just
      // add the tuple to the queue
      eQueue.add(t);
      return;
    }
    SeqNum lastReceivedSeqNum = receivedSeqNum.get(senderAddr);
    if (lastReceivedSeqNum != null) {
      if (currSeq.compareTo(lastReceivedSeqNum) > 0) {
        // ignore old or duplicate msgs
        // is it the next in the list?
        // if it is
        if (currSeq.getEpoch() == lastReceivedSeqNum.getEpoch()
            && currSeq.getValue() > lastReceivedSeqNum.getValue() + 1) {
          // check if this msg is the next in the sequence
          // we throw a msg only if the epoch number is the same, and the
          // sequence number is not last received +1
          if (dbg) {
            System.out.println("EventReceiver:: tuple not in sequence");
          }
          Tuple msgDropped = new MsgDroppedTuple(myAddr, senderAddr);
          eQueue.add(msgDropped);
          // store the sequence number.
          receivedSeqNum.put(senderAddr, currSeq);
          return;
        }
      }
    }
    // great now we can put the tuple in the queue
    if (dbg) {
      System.out.println("EventReceiver:: tuple added to queue");
    }
    eQueue.add(t);
    // and add the sequence number to the table
    receivedSeqNum.put(senderAddr, currSeq);
  }
}
