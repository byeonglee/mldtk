/*
 * OverlogRuntime - A Java Runtime for Overlog
 * Copyright (C) 2008 The University of Texas at Austin
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
 * 
 * @author Nalini Belaramani
 * @version
 */
public class Constraint {
  private ConstraintType ctype;
  private int termNum;
  private Object value;
  private Expression expr1;
  private Expression expr2;
  private boolean useExpr = false;

  /**
   * Constructor single term and value constraint
   */
  public Constraint(ConstraintType ctype_, int termNum_, Object value_) {
    ctype = ctype_;
    termNum = termNum_;
    value = value_;
  }

  /**
   * Constructor for an expression constraint
   */
  public Constraint(ConstraintType ctype_, Expression expr1_, Expression expr2_) {
    ctype = ctype_;
    expr1 = expr1_;
    expr2 = expr2_;
    useExpr = true;
  }

  /**
   * Get Constraint type
   */
  public ConstraintType getType() {
    return ctype;
  }

  /**
   * getTermNum for constraint
   */
  public int getTermNum() {
    return termNum;
  }

  /**
   * get the value
   */
  public Object getValue() {
    return value;
  }

  /**
   * Get the Left side expression
   */
  public Expression getExpr1() {
    return expr1;
  }

  /**
   * get the right side expression
   */
  public Expression getExpr2() {
    return expr2;
  }

  /**
   * Should the expression constraint be used?
   */
  public boolean useExpr() {
    return useExpr;
  }
}
