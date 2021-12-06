package xtc.lang.marco.ast;

import xtc.tree.Location;

public class NameAst extends ExprAst {
  public final String _name;

  public NameAst(final Location loc, final String name) {
    super(loc);
    _name = name;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
