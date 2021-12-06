package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ArrayRefAst extends ExprAst {
  public final ExprAst arrayExpr;
  public final ExprAst indexExpr;

  public ArrayRefAst(Location loc, ExprAst arrayExpr, ExprAst indexExpr) {
    super(loc);
    this.arrayExpr = arrayExpr;
    this.indexExpr = indexExpr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }

}
