/*
 * xtc - The eXTensible C compiler
 * Copyright (C) 2003 New York University, Department of Computer Science.
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
package xtc.il;

import java.util.List;

/** A function. */
public class Function extends xtc.tree.Node implements File.Definition {

  /** The function as a variable. */
  public Variable   var;

  /** The optional list of formal variables. */
  public List       formals;

  /** The optional list of local variables. */
  public List       locals;

  /** The body. */
  public Stmt.Block body;

}
