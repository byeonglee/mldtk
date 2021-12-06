package xtc.lang.marco.ast;

import xtc.tree.Location;

public class NumAst extends ExprAst {
  public final int _val;

  protected NumAst(final Location loc, final int val) {
    super(loc);
    _val = val;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
