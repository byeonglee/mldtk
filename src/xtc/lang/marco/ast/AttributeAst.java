package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class AttributeAst extends StrongAst {
  public final NameAst ID;
  public final TypeAst type;

  public AttributeAst(Location loc, NameAst iD, TypeAst type) {
    super(loc);
    ID = iD;
    this.type = type;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
