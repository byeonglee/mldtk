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
import java.util.Map;

/**
 * IDMap - converts string to ID and vice versa
 * 
 * @author Nalini Belaramani
 * @version
 */
public class IDMap {
  private static Hashtable<ID, String> map = new Hashtable<ID, String>();

  /**
   * getID - generates a ID and stores it in the local map
   */
  public static ID getId(String str) {
    ID id = new ID(str);
    if (!map.containsKey(id)) {
      map.put(id, str);
    }
    return id;
  }

  public static String getString(ID id) {
    return map.get(id);
  }

  public static Map<ID, String> getMap() {
    return map;
  }
}
