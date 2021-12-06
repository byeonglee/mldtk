package xtc.lang.marco.ast;

import xtc.tree.Location;

public class BoolLitAst extends ExprAst {

  public final boolean _val;

  protected BoolLitAst(final Location loc, final boolean val) {
    super(loc);
    _val = val;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
