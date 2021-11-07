/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2004-2007 New York University
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

package xtc.xform;

import java.util.List;

/**
 * The interface for external functions.
 * 
 * @author Joe Pamer
 * @version $Revision: 1.12 $
 */
public interface Function {

  /**
   * Get the name of the function.
   *
   * @return The name.
   */
  String getName();

  /**
   * Apply the function on the specified arguments.
   *
   * @param arguments The arguments.
   * @return The result.
   * @throws IllegalArgumentException Signals that the arguments are
   *   malformed.
   */

  Object apply(List<Object> arguments) throws IllegalArgumentException;
}
