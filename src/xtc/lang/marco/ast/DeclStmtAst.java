package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class DeclStmtAst extends StmtAst {
  public final TypeAst type;
  public final NameAst id;
  public final ExprAst expr;

  DeclStmtAst(Location loc, TypeAst type, NameAst id, ExprAst expr) {
    super(loc);
    this.type = type;
    this.id = id;
    this.expr = expr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
