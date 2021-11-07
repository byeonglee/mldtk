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

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Hashtable;

/**
 * EventQueue - puts local events in a blocked queue - transmits remote events
 * via the communication module - implements the fixed-point semantics
 * 
 * Note: currently: - adding of remote table updates not quite supported
 * (Because tuples are demarshed as tuples and not table updates) - handlers for
 * table updates not supported
 * 
 * @author Nalini Belaramani
 * @version
 */
public class EventQueue {
  // a simple producer consumer queue for events
  private BlockedQueue<Event> localQueue = new BlockedQueue<Event>();
  // a simple producer consumer queue for internal fix-point events
  private BlockedQueue<Event> internalQueue = new BlockedQueue<Event>();
  // set of events that are subscribed
  private SubscribedEvents subscribedEvents = new SubscribedEvents();
  private LinkedList<TableUpdate> bufferedTableUpdates = new LinkedList<TableUpdate>();
  private LinkedList<Tuple> bufferedLocalTuples = new LinkedList<Tuple>();
  private LinkedList<Tuple> bufferedRemoteTuples = new LinkedList<Tuple>();
  private NetAddr myAddr;
  private Hashtable<ID, Table> tables;
  private CommunicationModule cMod;
  private boolean waitTillEmpty = false;
  private static boolean dbg = OLG.dbg;

  /**
   * constructor
   */
  public EventQueue(NetAddr netAddr, Hashtable<ID, Table> tables) {
    this.myAddr = netAddr;
    this.tables = tables;
  }

  /**
   * set communication module
   */
  public void setCommunicationModule(CommunicationModule cMod) {
    this.cMod = cMod;
  }

  /**
   * subscribe for tuples
   */
  public void subscribe(ID id, Subscriber subscriber) {
    subscribedEvents.subscribe(id, subscriber);
  }

  /**
   * Add event to queue -- called by communcation module or external insert. We
   * put it in the external queue. or send it across immediately. if it is a
   * table update, it is buffered so that it can be applied at the end of the
   * fixed point.
   */
  public void add(Event e) {
    if (dbg)
      System.out.println("EventQueue: Received Event:" + e);
    // do not add any event if we are waiting for it to be empty
    if (waitTillEmpty)
      return;
    if (e instanceof Tuple) {
      Tuple t = (Tuple) e;
      // check location
      if (myAddr.equals(t.getTerm(0))) {
        if (dbg)
          System.out.println("EventQueue: Adding tuple:" + t
              + " to local queue");
        // if local add it to queue
        localQueue.add(e);
        subscribedEvents.add(t);
      } else {
        // send it across via communication module
        if (dbg)
          System.out.println("EventQueue: Sending tuple:" + t);
        if (cMod != null) {
          cMod.send(t);
        } else {
          if (dbg)
            System.out.println("cMod is null");
        }
      }
    } else if (e instanceof TableUpdate) {
      if (dbg)
        System.out.println("EventQueue: Buffering table update"
            + ((TableUpdate) e).getTuple());
      bufferedTableUpdates.add((TableUpdate) e);
    }
  }

  /**
   * Adds a list of events to teh queue
   * 
   */
  private void addToInternal(LinkedList<Tuple> llist) {
    if (waitTillEmpty)
      return;
    Iterator<Tuple> i = llist.iterator();
    while (i.hasNext()) {
      Event e = i.next();
      if (dbg)
        System.out.println("Adding to internal Queue:" + e);
      internalQueue.add(e);
    }
  }

  /**
   * gets next event, gets from internal queue first, if local queue is empty,
   * commit all buffered external to external queue and then get from external
   * queue
   */
  public Event getNext() {
    if (internalQueue.size() != 0) {
      return internalQueue.getNext();
    } else {
      // end of fix point, can commit buffered events
      commitTableUpdates();
      commitRemoteTuples();
      return localQueue.getNext();
    }
  }

  /**
   * commits buffered table updates - carries out table updates first - then
   * sends the remote events
   */
  private void commitTableUpdates() {
    for (TableUpdate tu : bufferedTableUpdates) {
      if (dbg)
        System.out.println("EventQueue: Committing TableUpdate:" + tu);
      // check location
      if (myAddr.equals(tu.getTuple().getTerm(0))) {
        Tuple t = tu.getTuple();
        if (tu.getUpdateType() == TableUpdate.INSERT) {
          tables.get(t.getId()).insert(t);
          // adds the update to the queue
          this.add(t);
        } else {
          tables.get(t.getId()).delete(t);
        }
      }
    }
    bufferedTableUpdates.clear();
  }

  /**
   * commitRemoteTuples - sends remote events
   * 
   */
  private void commitRemoteTuples() {
    for (Tuple t : bufferedRemoteTuples) {
      // send it across via communication module
      if (dbg)
        System.out.println("EventQueue: Sending tuple(2):" + t);
      if (cMod != null) {
        cMod.send(t);
      } else {
        if (dbg)
          System.out.println("cMod is null");
      }
    }
    bufferedRemoteTuples.clear();
  }

  /**
   * size
   */
  public int size() {
    return internalQueue.size() + localQueue.size();
  }

  /**
   * start
   */
  public void start() {
    subscribedEvents.start();
  }

  /**
   * shutdown
   */
  public void shutdown() {
    subscribedEvents.shutdown();
    internalQueue.shutdown();
    localQueue.shutdown();
  }

  /**
   * called by tuple handlers to buffer any events generated we only buffer
   * events if the event queue was initialized
   */
  public void buffer(Event e) {
    if (e instanceof TableUpdate) {
      bufferedTableUpdates.add((TableUpdate) e);
    } else {
      NetAddr dest = (NetAddr) ((Tuple) e).getTerm(0);
      if (dest.equals(myAddr)) {
        bufferedLocalTuples.add((Tuple) e);
        // pass it on to subscribers
        subscribedEvents.add((Tuple) e);
      } else {
        bufferedRemoteTuples.add((Tuple) e);
      }
    }
  }

  /**
   * called by tuple handlers to commit buffered updates - adds local generated
   * updates to internal queue - keeps the remote tuples and table updates
   * buffered until the fix point is over. - only works if the eventqueue was
   * initialized
   * 
   */
  public void commitBufferedUpdates() {
    addToInternal(bufferedLocalTuples);
    bufferedLocalTuples.clear();
  }

  /**
   * waitTillEmpty - blocks insertion of any new events in the queue - waits
   * till the queue is empty and then returns - used for cleanly shutting down
   * the system
   */
  public void waitTillEmpty() {
    if (dbg) {
      System.out.println("WaitTillEmpty called");
      System.out.println("External Queue:" + localQueue);
      System.out.println("Internal Queue:" + internalQueue);
      System.out.println("Subscribed events:" + subscribedEvents);
    }
    waitTillEmpty = true;
    localQueue.waitTillEmpty();
    internalQueue.waitTillEmpty();
    subscribedEvents.waitTillEmpty();
  }
}
