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

/**
 * PeriodicEventEntry - stored on a list until the periodic timer is started
 * 
 * @author Nalini Belaramani
 * @version
 */
public class PeriodicEventEntry {
  private Tuple t;
  private int period;
  private int iterations;

  /**
   * Constructor
   */
  public PeriodicEventEntry(Tuple t, int period, int iterations) {
    this.t = t;
    this.period = period;
    this.iterations = iterations;
  }

  /**
   * Get id
   */
  public Tuple getTuple() {
    return t;
  }

  /**
   * Get period
   */
  public int getPeriod() {
    return period;
  }

  /**
   * Get iterations
   */
  public int getIterations() {
    return iterations;
  }
}
