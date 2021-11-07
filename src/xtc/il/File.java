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

/** A top-level source file. */
public class File extends xtc.tree.Node {

  /** The empty marker interface for a global declaration or definition. */
  public static interface Global { }

  /** The empty marker interface for a global definition. */
  public static interface Definition extends Global { }

  /** A declaraction. */
  public static class Declaration extends xtc.tree.Node implements Global {
    
    /** The corresponding defintion. */
    public Definition def;

  }

  /** The name. */
  public String name;

  /** The list of global declarations and definitions, in order. */
  public List   globals;

}
