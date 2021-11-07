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

/** The superclass of all types. */
public abstract class Type extends xtc.tree.Node {

  /** Flag for a char. */
  public static final int CHAR        = 1;

  /** Flag for a signed char. */
  public static final int SCHAR       = CHAR + 1;

  /** Flag for an unsigned char. */
  public static final int UCHAR       = SCHAR + 1;

  /** Flag for an int. */
  public static final int INT         = UCHAR + 1;

  /** Flag for an unsigned int. */
  public static final int UINT        = INT + 1;

  /** Flag for a short. */
  public static final int SHORT       = UINT + 1;

  /** Flag for an unsigned short. */
  public static final int USHORT      = SHORT + 1;

  /** Flag for a long. */
  public static final int LONG        = USHORT + 1;

  /** Flag for an unsigned long. */
  public static final int ULONG       = LONG + 1;

  /** Flag for a long long. */
  public static final int LONG_LONG   = ULONG + 1;

  /** Flag for an unsigned long long. */
  public static final int ULONG_LONG  = LONG_LONG + 1;

  /** Flag for a float. */
  public static final int FLOAT       = ULONG_LONG + 1;

  /** Flag for a double. */
  public static final int DOUBLE      = FLOAT + 1;

  /** Flag for a long double. */
  public static final int LONG_DOUBLE = DOUBLE + 1;

  /** The optional list of attributes. */
  public List attributes;

  /** Void. */
  public static class Void extends Type { 

  }
  
  /** An integer number. */
  public static class Int extends Type {

    /** The kind of integer number. */
    public int kind;

  }

  /** A floating point number. */
  public static class Float extends Type {

    /** The kind of floating point number. */
    public int kind;

  }

  /** A pointer. */
  public static class Pointer extends Type {

    /** The pointed to type. */
    public Type type;

  }

  /** An array. */
  public static class Array extends Type {

    /** The element type. */
    public Type type;

    /** An optional length. */
    public Expr length;

  }

  /** A function. */
  public static class Function extends Type {

    /** The result type. */
    public Type    result;

    /** The optional list of arguments. */
    public List    arguments;

    /** Flag for whether the function accepts a variable number of arguments. */
    public boolean varArgs;

  }

  /** A function argument. */
  public static class Argument extends xtc.tree.Node {
    
    /** The name. */
    public String name;

    /** The type. */
    public Type   type;

    /** The optional list of attributes. */
    public List   attributes;

  }

  /** A named type, that is a typedef. */
  public static class Typedef extends Type implements File.Global {

    /** The name. */
    public String name;

    /** The corresponding type. */
    public Type   type;

    public Type resolve() {
      Type r = type;
      while (r instanceof Typedef) {
        r = ((Typedef)r).type;
      }
      return r;
    }

  }

  /** A structure. */
  public static class Struct extends Type implements File.Definition {

    /** The optional tag. */
    public String tag;

    /** The list of fields. */
    public List   fields;

  }

  /** A union. */
  public static class Union extends Type implements File.Definition {
    
    /** The optional tag. */
    public String tag;

    /** The list of fields. */
    public List   fields;

  }

  /** A structure or union field. */
  public static class Field extends xtc.tree.Node {

    /** The optional name. */
    public String name;

    /** The field type. */
    public Type   type;

    /**
     * The size of an integral bitfield. The field type must be an
     * Int. Note that -1 indicates that this field is not a bitfield.
     */
    public int    bitfield = -1;

    /** The optional list of attributes. */
    public List   attributes;

  }

  /** An enumeration. */
  public static class Enum extends Type implements File.Definition {

    /** The name. */
    public String name;

    /** The list of enumerators. */
    public List   enumerators;

  }

  /** An enumerator. */
  public static class Enumerator extends xtc.tree.Node {

    /** The name. */
    public String name;

    /** The value. */
    public Expr   value;

  }

  /**
   * Resolve this type, eliminating any type aliases. The default
   * implementation returns <code>this</code>.
   *
   * @return The resolved type.
   */
  public Type resolve() {
    return this;
  }

}
