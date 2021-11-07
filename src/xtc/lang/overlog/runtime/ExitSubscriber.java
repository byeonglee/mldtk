/*
 * OverlogRuntime - A Java Runtime for Overlog
 * Copyright (C) 2008 The University of Texas at Austin
 * Copyright (C) 2008 New York University
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

/**
 * ExitSubscriber - prints out the tuple
 * 
 * @author Robert Soule
 * @version
 */
public class ExitSubscriber implements Subscriber {
  OLG olg;

  public ExitSubscriber(OLG olg) {
    this.olg = olg;
  }

  public void process(Tuple t) {
    if (olg.shutdown || olg.cleanShutdown) {
      return;
    }
    // start a new thread to shutdown the overlog
    try {
      Thread th = new ShutdownThread();
      th.start();
    } catch (Exception e) {
    }
  }

  class ShutdownThread extends Thread {
    @Override
    public void run() {
      olg.cleanShutdown();
    }
  }
}
