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
import java.lang.InterruptedException;

/**
 * Blocked Queue:
 * 
 * a producer/consumer queue - getNext blocks until an object is available in
 * the queue. - returns objects in the order they were inserted.
 * 
 * @author Nalini Belaramani
 * @version
 */
public class BlockedQueue<T> {
  private LinkedList<T> _list;
  private boolean shutdown = false;
  private boolean waitTillEmpty = false;
  private Object waitObj = new Object();
  private boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  public BlockedQueue() {
    _list = new LinkedList<T>();
  }

  /**
   * adds grabs lock then adds object to the queue
   */
  public synchronized void add(T obj) {
    if (!waitTillEmpty) {
      _list.add(obj);
      notifyAll();
    }
  }

  /**
   * getNext - wait until an object is available and remove it from the queue -
   * it will return null only if the queue has been instructed to shutdown
   */
  public synchronized T getNext() {
    while (_list.size() == 0 && !shutdown) {
      if (waitTillEmpty) {
        // if(dbg) {System.out.println ("notifiying list is empty");}
        synchronized (waitObj) {
          waitObj.notifyAll();
        }
      }
      try {
        wait();
      } catch (InterruptedException e) {
      }
    }
    if (shutdown)
      return null;
    assert (_list.size() > 0);
    return _list.removeFirst();
  }

  /**
   * isEmpty: returns ture if queue is empty
   */
  public synchronized boolean isEmpty() {
    if (_list.size() > 0) {
      return false;
    }
    return true;
  }

  /**
   * size
   */
  public synchronized int size() {
    return _list.size();
  }

  /**
   * shutdown:
   */
  public synchronized void shutdown() {
    shutdown = true;
    notifyAll();
  }

  /**
   * waitTillEmpty - blocks insertion of any new events in the queue - waits
   * till the queue is empty
   */
  public synchronized void waitTillEmpty() {
    if (dbg) {
      System.out.println("BlockedQueue: waitTillEmpty called");
      System.out.println("BlockedQueue: current items:" + _list);
    }
    waitTillEmpty = true;
    while (_list.size() != 0) {
      try {
        synchronized (waitObj) {
          waitObj.wait();
        }
      } catch (InterruptedException e) {
      }
    }
    if (dbg)
      System.out.println("BlockedQueue: is empty");
  }

  @Override
  public synchronized String toString() {
    return _list.toString();
  }
}
