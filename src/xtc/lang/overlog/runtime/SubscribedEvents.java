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

import java.util.Iterator;

/**
 * SubscribedEvents - Keeps track of the IDS of the tuples that have been
 * subscribed - also has a subscribeWorker which picks events from the queue and
 * calls the appropriate subscriber
 * 
 * @author Nalini Belaramani
 * @version
 */
public class SubscribedEvents {
  private MultiEntryTable<ID, Subscriber> subscribedEvents = new MultiEntryTable<ID, Subscriber>();
  private BlockedQueue<SubscribeQueueEntry> subscribedQueue = new BlockedQueue<SubscribeQueueEntry>();
  private SubscribeWorker subscribeWorker;
  private static boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  public SubscribedEvents() {
  }

  /**
   * start - starts the subscribe worker
   */
  public void start() {
    subscribeWorker = new SubscribeWorker(subscribedQueue);
    subscribeWorker.start();
  }

  /**
   * waitTillEmpty - blocks insertion of any new events in the queue - waits
   * till the subscribeQueue is empty
   */
  public void waitTillEmpty() {
    if (dbg)
      System.out.println("SubscribedEvents: waitTillEmptyCalled");
    subscribedQueue.waitTillEmpty();
  }

  /**
   * shutdown - shutsdown the queue and the worker
   */
  public void shutdown() {
    subscribeWorker.shutdown();
    subscribedQueue.shutdown();
  }

  /**
   * subscribe for events and register a subscriber for it
   */
  public void subscribe(ID id, Subscriber sub) {
    subscribedEvents.put(id, sub);
  }

  /**
   * add an event into the key
   */
  public void add(Tuple t) {
    Iterator<Subscriber> i = subscribedEvents.getIterator(t.getId());
    if (i != null) {
      while (i.hasNext()) {
        Subscriber sub = i.next();
        if (dbg)
          System.out.println("SubscribedEvents: adding tuple to queue" + t);
        SubscribeQueueEntry seq = new SubscribeQueueEntry(t, sub);
        subscribedQueue.add(seq);
      }
    }
  }

  /**
   * toString
   */
  @Override
  public String toString() {
    return subscribedQueue.toString();
  }
}
