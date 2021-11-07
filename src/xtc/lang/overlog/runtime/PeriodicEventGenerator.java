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

import java.util.Timer;
import java.util.LinkedList;
import java.util.Iterator;

/**
 * PeriodicEventGenerator - generates events periodically and puts them in the
 * queue
 * 
 * @author Nalini Belaramani
 * @version
 */
public class PeriodicEventGenerator {
  private Timer timer = new Timer();
  private LinkedList<PeriodicEventEntry> periodicTasks = new LinkedList<PeriodicEventEntry>();
  private EventQueue eQueue;
  private boolean started = false;
  private boolean shutdown = false;
  private boolean dbg = OLG.dbg;

  /**
   * Constructor
   */
  public PeriodicEventGenerator(EventQueue eQueue) {
    this.eQueue = eQueue;
  }

  /**
   * register periodic events -- saves them in a queue until start is called --
   * otherwise schedules them to be generated
   */
  public void register(Tuple t, int periodInSec, int iterations) {
    if (dbg)
      System.out.println("PEG: tuple " + t + " registered");
    int period = periodInSec * 1000;
    if (period == 0)
      period = 1; // we cannot schedule 0 period
    if (!started) {
      PeriodicEventEntry pee = new PeriodicEventEntry(t, period, iterations);
      periodicTasks.add(pee);
    } else if (!shutdown) {
      PeriodicEventTask pet = new PeriodicEventTask(t, iterations, eQueue);
      timer.scheduleAtFixedRate(pet, period, period);
    }
  }

  /**
   * start generating events
   */
  public void start() {
    started = true;
    Iterator<PeriodicEventEntry> i = periodicTasks.iterator();
    while (i.hasNext()) {
      PeriodicEventEntry pee = i.next();
      PeriodicEventTask pet = new PeriodicEventTask(pee.getTuple(), pee
          .getIterations(), eQueue);
      timer.scheduleAtFixedRate(pet, pee.getPeriod(), pee.getPeriod());
    }
  }

  /**
   * stop generating events
   */
  public void shutdown() {
    shutdown = true;
    started = false;
    timer.cancel();
  }
}
