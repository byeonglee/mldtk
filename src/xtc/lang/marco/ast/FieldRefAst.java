package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class FieldRefAst extends ExprAst {
  public final NameAst fieldName;
  public final ExprAst objectExpr;

  public FieldRefAst(Location loc, NameAst fieldName, ExprAst objectExpr) {
    super(loc);
    this.fieldName = fieldName;
    this.objectExpr = objectExpr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
