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

/** The superclass of all statements. */
public abstract class Stmt extends xtc.tree.Node {

  /** The optional list of labels. */
  public List labels;

  /** The (empty) superclass of all labels. */
  public static abstract class Label extends xtc.tree.Node { }

  /** A named label. */
  public static class NamedLabel extends Label {

    /** The label's name. */
    public String  name;

    /** Flag for whether the label is synthetic. */
    public boolean synthetic;

  }

  /** A case label. */
  public static class CaseLabel extends Label {

    /** The value for this case label. */
    public Expr value;

  }

  /** A default label. */
  public static class DefaultLabel extends Label { }

  /** An assignment statement. */
  public static class Assignment extends Stmt {

    /** The lvalue. */
    public Expr.Lvalue lval;

    /** The new value. */
    public Expr        value;

  }

  /** A function call. */
  public static class Call extends Stmt {

    /** The optional lvalue receiving the result. */
    public Expr.Lvalue result;

    /** The function. */
    public Expr        function;

    /**
     * The list of arguments. It may be <code>null</code> for functions
     * with no arguments.
     */
    public List        arguments;

  }

  /** A return statement. */
  public static class Return extends Stmt {

    /** The optional result. */
    public Expr result;

  }

  /** A goto statement. */
  public static class Goto extends Stmt {

    /** The target, which must have at least one label. */
    public Stmt target;

  }

  /** A break statement. */
  public static class Break extends Stmt { }

  /** A continue statement. */
  public static class Continue extends Stmt { }

  /** A conditional statement. */
  public static class If extends Stmt {

    /** The test. */
    public Expr  test;

    /** The consequent. */
    public Block consequent;

    /** The optional alternative. */
    public Block alternative;

  }

  /** A switch statement. */
  public static class Switch extends Stmt {

    /** The switch expression. */
    public Expr  expr;

    /** The switch body with embedded case labels. */
    public Block body;

  }

  /** A while(1) loop. */
  public static class Loop extends Stmt {

    /** The loop body. */
    public Block body;

  }

  /** A block. */
  public static class Block extends Stmt {

    /** The optional list of statements. */
    public List statements;

    /** The optional list of attributes. */
    public List attributes;

  }

}
