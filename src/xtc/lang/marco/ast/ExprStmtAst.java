package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ExprStmtAst extends StmtAst {
  public final ExprAst _expr;

  ExprStmtAst(Location loc, ExprAst expr) {
    super(loc);
    this._expr = expr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
