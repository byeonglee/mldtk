package xtc.lang.marco.ast;

import xtc.tree.Location;

public class StringLitAst extends ExprAst {
  public final String _val;

  protected StringLitAst(final Location loc, final String val) {
    super(loc);
    _val = val;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
