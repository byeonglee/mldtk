package xtc.lang.marco.ast;

import xtc.tree.Location;

public class ReturnStmt extends StmtAst {
  public final ExprAst expr;

  public ReturnStmt(Location loc, ExprAst expr) {
    super(loc);
    this.expr = expr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
