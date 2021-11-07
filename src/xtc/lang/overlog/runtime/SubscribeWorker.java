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

/**
 * SubscribeWorker - picks subscribedEvents from the queue and calls the
 * appropriate subscriber to process them.
 * 
 * @author Nalini Belaramani
 * @version
 */
public class SubscribeWorker extends Thread {
  private BlockedQueue<SubscribeQueueEntry> subQueue;
  private boolean shutdown = false;
  private static boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  public SubscribeWorker(BlockedQueue<SubscribeQueueEntry> subQueue) {
    this.subQueue = subQueue;
  }

  /**
   * shutdown
   */
  public void shutdown() {
    shutdown = true;
    subQueue.shutdown();
  }

  /**
   * run - picks events from queue and handles them
   */
  @Override
  public void run() {
    while (!shutdown) {
      SubscribeQueueEntry sqe = subQueue.getNext();
      if (sqe == null)
        break;
      if (dbg)
        System.out.println("SubcribeWorker: Received tuple" + sqe.getTuple());
      sqe.getSubscriber().process(sqe.getTuple());
    }
  }
}
