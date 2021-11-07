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

import java.util.Hashtable;
import java.util.Iterator;

/**
 * EventWorker - picks events from the queue and calls the appropriate handler
 * 
 * @author Nalini Belaramani
 * @version
 */
public class EventWorker extends Thread {
  private EventQueue eQueue;
  private Hashtable<ID, Table> tables;
  private MultiEntryTable<ID, EventHandler> handlers;
  private boolean shutdown = false;
  public static boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  public EventWorker(EventQueue eQueue, Hashtable<ID, Table> tables,
      MultiEntryTable<ID, EventHandler> handlers) {
    this.eQueue = eQueue;
    this.tables = tables;
    this.handlers = handlers;
  }

  /**
   * Picks Events from the queue and handles them
   */
  @Override
  public void run() {
    while (!shutdown) {
      Event e = eQueue.getNext();
      if (e == null)
        return;
      if (e instanceof Tuple) {
        // if it is a tuple, retrieve the appropriate handler and
        // retrieve it
        Tuple t = (Tuple) e;
        if (dbg)
          System.out.println("EventWorker: Received tuple" + t);
        Iterator<EventHandler> i = handlers.getIterator(t.getId());
        if (i != null) {
          while (i.hasNext()) {
            EventHandler eh = i.next();
            if (dbg)
              System.out.println("EventWorker: calling handler for tuple");
            eh.process(t, tables, eQueue);
          }
        }
        // add all buffered events to queue
        eQueue.commitBufferedUpdates();
      } else {
        System.out.println("Event Worker: Error: Unexpected event " + e);
      }
    }
  }

  /**
   * Shutdown
   */
  public void shutdown() {
    shutdown = true;
  }
}
