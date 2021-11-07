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
 * TableUpdate - represents an update to a table
 * 
 * @author Nalini Belaramani
 * @version
 */
public class TableUpdate implements Event {
  private boolean updateType;
  private Tuple t;
  public static boolean INSERT = true;
  public static boolean DELETE = false;

  /**
   * Constructor
   */
  public TableUpdate(boolean updateType_, Tuple t_) {
    updateType = updateType_;
    t = t_;
  }

  /**
   * get Update type
   */
  public boolean getUpdateType() {
    return updateType;
  }

  /**
   * getTuple
   */
  public Tuple getTuple() {
    return t;
  }
}
