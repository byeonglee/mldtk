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
 * TableKey - represents the keys of the table.
 * 
 * @author Nalini Belaramani
 * @version
 */
public class TableKey {
  private Object[] keys;

  /**
   * constructor
   */
  public TableKey(Object[] keys) {
    this.keys = keys;
  }

  /**
   * hashCode
   */
  @Override
  public int hashCode() {
    int code = 0;
    for (int ii = 0; ii < keys.length; ii++) {
      code = code * 100 + keys[ii].hashCode();
    }
    return code;
  }

  /**
   * Equals
   */
  @Override
  public boolean equals(Object o) {
    if (o instanceof TableKey) {
      TableKey oTK = (TableKey) o;
      for (int ii = 0; ii < keys.length; ii++) {
        if (!this.keys[ii].equals(oTK.keys[ii])) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  @Override
  public String toString() {
    String str = "[";
    for (int ii = 0; ii < keys.length; ii++) {
      str += keys[ii] + ",";
    }
    str += "]";
    return str;
  }
}
