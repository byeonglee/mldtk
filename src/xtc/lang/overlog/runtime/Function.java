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
 * Implements the f_* functions of overlog
 * 
 * @author Nalini Belaramani
 * @version
 */
public class Function {
  /**
   * f_now(): returns current time as an Integer Object in millis
   */
  public static Integer now() {
    return new Integer((new Long(System.currentTimeMillis())).intValue());
  }

  /**
   * f_rand(): returns an Float object bigger than 0.0 but less than 1.0
   */
  public static Float rand() {
    return new Float(Math.random());
  }
}
