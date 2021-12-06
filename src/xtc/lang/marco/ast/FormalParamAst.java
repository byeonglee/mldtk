package xtc.lang.marco.ast;

import xtc.tree.Location;

public class FormalParamAst extends StrongAst {
  public final NameAst name;
  public final TypeAst type;

  public FormalParamAst(final Location loc, NameAst name, TypeAst type) {
    super(loc);
    this.name = name;
    this.type = type;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
