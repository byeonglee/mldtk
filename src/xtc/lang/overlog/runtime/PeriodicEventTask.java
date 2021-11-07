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

import java.util.TimerTask;

/**
 * PeriodicEventTask - inserts a tuple in the queue when it is scheduled
 * 
 * @author Nalini Belaramani
 * @version
 */
public class PeriodicEventTask extends TimerTask {
  private Tuple t;
  private int iterations;
  private EventQueue eQueue;
  private int currIter = 0;

  /**
   * constructor
   */
  public PeriodicEventTask(Tuple t, int iterations, EventQueue eQueue) {
    this.t = t;
    this.iterations = iterations;
    this.eQueue = eQueue;
  }

  /**
   * Adds a tuple to the queue Note if iterations <= 0, it will generate events
   * for ever.
   */
  @Override
  public void run() {
    eQueue.add(t);
    currIter++;
    if (iterations > 0 && currIter >= iterations) {
      this.cancel();
    }
  }
}
