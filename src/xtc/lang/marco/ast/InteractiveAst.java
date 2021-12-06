package xtc.lang.marco.ast;

import xtc.tree.Location;

public class InteractiveAst extends StrongAst {
  public final StmtAst[] s;

  private InteractiveAst(Location loc, StmtAst[] _s) {
    super(loc);
    s = _s;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
