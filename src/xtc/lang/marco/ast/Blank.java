package xtc.lang.marco.ast;

import xtc.lang.marco.type.CodeType;
import xtc.tree.Location;

public final class Blank extends FragmentElement {
  public final ExprAst expr;

  protected Blank(Location loc, ExprAst expr) {
    super(loc);
    this.expr = expr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }

  public CodeType getCodeType() {
    return (CodeType) expr.resolvedType;
  }

}
