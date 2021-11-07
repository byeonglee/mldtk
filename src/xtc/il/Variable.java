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

/** A variable. */
public class Variable extends xtc.tree.Node implements File.Definition {

  /** A global variable initializer. */
  public static abstract class Initializer extends xtc.tree.Node { }

  /** A single initializer. */
  public static class SingleInit extends Initializer {

    /** The expression. */
    public Expr expr;
  }

  /** A compound initializer. */
  public static class CompoundInit extends Initializer {

    /** The list of offsets and initializers for those offsets. */
    public List elements;

  }

  /** An element initializer. */
  public static class ElementInit extends xtc.tree.Node {

    /** The offset. */
    public Expr.Offset offset;

    /** The initializer. */
    public Initializer init;
  }

  /** Flag for default variable storage. */
  public static final int NO_STORAGE = 0;

  /** Flag for static storage. */
  public static final int STATIC     = NO_STORAGE + 1;

  /** Flag for register storage. */
  public static final int REGISTER   = STATIC + 1;

  /** Flag for external storage. */
  public static final int EXTERN     = REGISTER + 1;

  /** The name. */
  public String name;

  /** The type. */
  public Type type;

  /** The optional list of attributes. */
  public List attributes;

  /** Flag for whether the variable is global. */
  public boolean global;

  /** The optional variable initializer for global variables. */
  public Initializer init;

  /** Flag for the kind of storage. */
  public int storage = NO_STORAGE;

  /** Flag for whether this variable represents an inline function. */
  public boolean inline = false;

}
