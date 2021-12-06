package xtc.lang.marco.ast;

import xtc.tree.Location;

public class UnaryExprAst extends ExprAst {
  public static enum UnaryOperator {
    NOT
  }

  public final UnaryOperator op;
  public final ExprAst operand;

  public UnaryExprAst(Location loc, UnaryOperator op, ExprAst operand) {
    super(loc);
    this.op = op;
    this.operand = operand;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }

}
