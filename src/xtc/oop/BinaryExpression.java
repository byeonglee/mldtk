/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
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
package xtc.oop;

/**
 * A binary expression.
 *
 * @author Robert Grimm
 */
public class BinaryExpression extends Expression {

  /** The first operand. */
  private Expression operand1;

  /** The operator. */
  private String operator;

  /** The second operand. */
  private Expression operand2;

  /**
   * Create a new binary expression.
   *
   * @param operand1 The first operand.
   * @param operator The operator.
   * @param operand2 The second operand.
   */
  public BinaryExpression(Expression operand1, String operator,
                          Expression operand2) {
    this.operand1 = operand1;
    this.operator = operator;
    this.operand2 = operand2;
  }

  /**
   * Get the first operand.
   *
   * @return The first operand.
   */
  public Expression getOperand1() {
    return operand1;
  }

  /**
   * Get the operator.
   *
   * @return The operator.
   */
  public String getOperator() {
    return operator;
  }

  /**
   * Get the second operand.
   *
   * @return The second operand.
   */
  public Expression getOperand2() {
    return operand2;
  }
 
  public <T, E extends Exception> T accept(Visitor<T,E> v) throws E {
    return v.visit(this);
  }

}
