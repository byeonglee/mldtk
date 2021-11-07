/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2009 New York University
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
package xtc.lang.babble.util;

import xtc.util.SymbolTable;

/**
 * The class that contains utility functions for the translation of streaming
 * languages.
 * 
 * @author Robert Soule
 * @version $Revision: 1.6 $
 */
public class Util {
  private static int n, m = 0;
  private static int a = 64;

  static public void reset() {
    n = 0;
    m = 0;
    a = 64; // ascii 'A' - 1
  }

  static public String freshId() {
    n++;
    return "q" + n;
  }

  static public String freshId(SymbolTable table) {
    n++;
    String id = "q" + n;
    if (table.isDefined(id))
      return Util.freshId(table);
    return id;
  }

  static public String freshVar() {
    m++;
    return "v" + m;
  }

  static public String freshVar(SymbolTable table) {
    m++;
    String id = "v" + m;
    if (table.isDefined(id))
      return Util.freshVar(table);
    return id;
  }

  static public String freshAlias(SymbolTable table) {
    a++;
    String id = Character.toString((char) a);
    if (table.isDefined(id))
      return Util.freshAlias(table);
    return id;
  }

  /** Empty constructor. */
  private Util() {
    // Nothing to do.
  }
}
