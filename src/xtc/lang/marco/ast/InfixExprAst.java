package xtc.lang.marco.ast;

import xtc.tree.Location;

public class InfixExprAst extends ExprAst {

  public final InfixOp _op;
  public final ExprAst _lhsExpr;
  public final ExprAst _rhsExpr;

  protected InfixExprAst(final InfixOp op, final ExprAst lhsExpr, final ExprAst rhsExpr) {
    super(new Location(lhsExpr.sourceFile, lhsExpr._line, lhsExpr._column));
    _op = op;
    _lhsExpr = lhsExpr;
    _rhsExpr = rhsExpr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
