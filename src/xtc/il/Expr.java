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

/**
 * The superclass of all expressions. Note that expressions are functional
 * and do not have side effects.
 */
public abstract class Expr extends xtc.tree.Node {

  /** The opcode for unary minus (<code>-</code>). */
  public static final int OP_NEGATE   = 1;

  /** The opcode for the bitwise complement (<code>~</code>). */
  public static final int OP_BIT_NOT  = OP_NEGATE + 1;

  /** The opcode for logical not (<code>&#033;</code>). */
  public static final int OP_NOT      = OP_BIT_NOT +1;

  /** The opcode for arithmetic addition (<code>+</code>). */
  public static final int OP_PLUS     = OP_NOT + 1;

  /** The opcode for adding an integer to a pointer (<code>+</code>). */
  public static final int OP_PLUS_PI  = OP_PLUS + 1;

  /** The opcode for arithmetic subtraction (<code>-</code>). */
  public static final int OP_MINUS    = OP_PLUS_PI + 1;

  /** The opcode for subtracting an integer from a pointer (<code>-</code>). */
  public static final int OP_MINUS_PI = OP_MINUS + 1;

  /** The opcode for subtracting a pointer from another pointer
   *  (<code>-</code>). */
  public static final int OP_MINUS_PP = OP_MINUS_PI + 1;

  /** The opcode for multiplication (<code>*</code>). */
  public static final int OP_MULT     = OP_MINUS_PP + 1;

  /** The opcode for division (<code>/</code>). */
  public static final int OP_DIV      = OP_MULT + 1;

  /** The opcode for modulus (<code>%</code>). */
  public static final int OP_MOD      = OP_DIV + 1;

  /** The opcode for shift left (<code>&lt;&lt;</code>). */
  public static final int OP_SHIFT_LT = OP_MOD + 1;

  /** The opcode for shift right (<code>&gt;&gt;</code>). */
  public static final int OP_SHIFT_RT = OP_SHIFT_LT + 1;

  /** The opcode for less than (<code>&lt;</code>). */
  public static final int OP_LT       = OP_SHIFT_RT + 1;

  /** The opcode for greater than (<code>&gt;</code>). */
  public static final int OP_GT       = OP_LT + 1;

  /** The opcode for less equal (<code>&lt;=</code>). */
  public static final int OP_LE       = OP_GT + 1;

  /** The opcode for greater equal (<code>&gt;=</code>). */
  public static final int OP_GE       = OP_LE + 1;

  /** The opcode for equal (<code>==</code>). */
  public static final int OP_EQ       = OP_GE + 1;

  /** The opcode for not equal (<code>&#033;=</code>). */
  public static final int OP_NE       = OP_EQ + 1;

  /** The opcode for bitwise and (<code>&amp;</code>). */
  public static final int OP_BIT_AND  = OP_NE + 1;

  /** The opcode for bitwise xor (<code>^</code>). */
  public static final int OP_BIT_XOR  = OP_BIT_AND + 1;

  /** The opcode for bitwise or (<code>|</code>). */
  public static final int OP_BIT_OR   = OP_BIT_XOR + 1;

  /** The opcode for logical and (<code>&amp;&amp;</code>). */
  public static final int OP_AND      = OP_BIT_OR + 1;

  /** The opcode for logical or (<code>||</code>). */
  public static final int OP_OR       = OP_AND + 1;

  /** The parentheses level for an arrow expression. */
  public static final int PLEVEL_ARROW = 20;

  /** The parentheses level for a dereference expression. */
  public static final int PLEVEL_DEREF = 20;

  /** The parentheses level for an addressof expression. */
  public static final int PLEVEL_ADDRESS_OF = 30;

  /**
   * Get the parentheses level for this expression.
   *
   * <p />A smaller parentheses level corresponds to a stronger
   * precedence.  In other words, when printing an expression, the
   * expression needs to be parenthesized if its parentheses level is
   * greater or equal to the level of its context.
   *
   * @return The parentheses level.
   */
  public abstract int getPLevel();

  /**
   * Get the parentheses level for the specified unary or binary operator.
   *
   * @param op The unary or binary operator.
   * @return The corresponding parentheses level.
   */
  protected static int getPLevel(int op) {
    switch (op) {
    case OP_AND:
    case OP_OR:
      return 80;
    case OP_BIT_AND:
    case OP_BIT_OR:
    case OP_BIT_XOR:
      return 75;
    case OP_EQ:
    case OP_GE:
    case OP_GT:
    case OP_LE:
    case OP_LT:
    case OP_NE:
      return 70;
    case OP_MINUS:
    case OP_MINUS_PI:
    case OP_MINUS_PP:
    case OP_PLUS:
    case OP_PLUS_PI:
    case OP_SHIFT_LT:
    case OP_SHIFT_RT:
      return 60;
    case OP_DIV:
    case OP_MOD:
    case OP_MULT:
      return 40;
    case OP_BIT_NOT:
    case OP_NEGATE:
    case OP_NOT:
      return 30;
    default:
      assert false;
      return 100;
    }
  }

  /**
   * Determine whether this expression nees to be parenthesized.
   *
   * @param context The parentheses level of this expression's context.
   * @return <code>true</code> iff this expression needs to be parenthesized.
   */
  public boolean needsParentheses(int context) {
    int plevel = this.getPLevel();

    if (plevel >= context) {
      return true;
    } else if (75 == context) {
      return ((60 == plevel) || (70 == plevel));
    } else {
      return false;
    }
  }

  /** A constant. */
  public static class Constant extends Expr {

    /** The source representation. */
    public String representation;

    /** The corresponding Java value (if available). */
    public Object value;

    public int getPLevel() {
      return 0;
    }

  }

  /** An lvalue. */
  public static abstract class Lvalue extends Expr {

    /** The optional offset. */
    public Offset offset;

  }

  /** A variable lvalue. */
  public static class VariableLvalue extends Lvalue {

    /** The variable. */
    public Variable var;

    public int getPLevel() {
      return (null == offset)? 0 : 20;
    }

  }

  /** A memory lvalue. */
  public static class MemoryLvalue extends Lvalue {

    /** The memory referencing expression. */
    public Expr expr;

    public int getPLevel() {
      return 20;
    }
    
  }

  /** An offset. */
  public static abstract class Offset extends xtc.tree.Node {

    /** An optional nested offset. */
    public Offset offset;

  }

  /** A field offset. */
  public static class FieldOffset extends Offset {

    /** The field. */
    public Type.Field field;

  }

  /** An array offset. */
  public static class ArrayOffset extends Offset {

    /** The index into the array. */
    public Expr index;

  }

  /** A sizeof(Type) expression. */
  public static class SizeOf extends Expr {

    /** The type. */
    public Type type;

    public int getPLevel() {
      return 20;
    }

  }

  /** A sizeof(Expr) expression. */
  public static class SizeOfExpr extends Expr {

    /** The expression. */
    public Expr expr;

    public int getPLevel() {
      return 20;
    }

  }

  /** A sizeof(String) expression. */
  public static class SizeOfString extends Expr {

    /** The string. */
    public String string;

    public int getPLevel() {
      return 20;
    }

  }

  /** An alignof(Type) expression. */
  public static class AlignOf extends Expr {

    /** The type. */
    public Type type;

    public int getPLevel() {
      return 20;
    }

  }

  /** An alignof(Expr) expression. */
  public static class AlignOfExpr extends Expr {

    /** The expression. */
    public Expr expr;

    public int getPLevel() {
      return 20;
    }

  }

  /** A unary operation. */
  public static class UnaryOp extends Expr {

    /**
     * The operation. 
     *
     * <p />Its value must be either {@link #OP_NEGATE}, {@link #OP_BIT_NOT},
     * or {@link #OP_NOT}.
     */
    public int  op;

    /** The operand. */
    public Expr operand;

    /** The result type. */
    public Type result;

    public int getPLevel() {
      return getPLevel(op);
    }

  }

  /** A binary operation. */
  public static class BinaryOp extends Expr {

    /**
     * The operation.
     *
     * <p />Its value must be one of the opcodes defined in {@link Expr},
     * though not one of the three unary opcodes {@link #OP_NEGATE},
     * {@link #OP_BIT_NOT}, and {@link #OP_NOT}.
     */
    public int  op;

    /** The first operand. */
    public Expr operand1;

    /** The second operand. */
    public Expr operand2;

    /** The result type. */
    public Type result;

    public int getPLevel() {
      return getPLevel(op);
    }

  }

  /** A cast expression. */
  public static class Cast extends Expr {

    /** The expression. */
    public Expr expr;

    /** The type. */
    public Type type;

    public int getPLevel() {
      return 30;
    }

  }

  /** An addressof expression. */
  public static class AddressOf extends Expr {

    /** The lvalue. */
    public Lvalue lval;

    public int getPLevel() {
      return 30;
    }

  }

  /** A startof expression. */
  public static class StartOf extends Expr {

    /** The lvalue. */
    public Lvalue lval;

    public int getPLevel() {
      return 30;
    }

  }

}
