package xtc.lang.marco.ast;

import xtc.tree.Location;

public class ListAst extends ExprAst {
  public final ExprAst[] elements;

  public ListAst(Location loc, ExprAst[] elements) {
    super(loc);
    this.elements = elements;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
