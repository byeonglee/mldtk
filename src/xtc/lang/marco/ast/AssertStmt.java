package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class AssertStmt extends StmtAst {
  public final ExprAst cond;
  public final ExprAst message;
  public final ExprAst location;

  public AssertStmt(Location loc, ExprAst cond, ExprAst message, ExprAst location) {
    super(loc);
    this.cond = cond;
    this.message = message;
    this.location = location;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
