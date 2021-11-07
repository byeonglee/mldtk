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
 * Entry in the subscribe queue - encapsulates the tuple received with the
 * subscriber
 * 
 * @author Nalini Belaramani
 * @version
 */
public class SubscribeQueueEntry {
  private Tuple t;
  private Subscriber sub;

  /**
   * Constructor
   */
  public SubscribeQueueEntry(Tuple t, Subscriber sub) {
    this.t = t;
    this.sub = sub;
  }

  /**
   * getTuple
   */
  public Tuple getTuple() {
    return t;
  }

  /**
   * getSubscriber
   */
  public Subscriber getSubscriber() {
    return sub;
  }

  @Override
  public String toString() {
    return t + "::" + sub;
  }
}
