package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ListTypeAst extends CompositeTypeAst {
  public final TypeAst elementType;

  ListTypeAst(Location loc, TypeAst elementType) {
    super(loc);
    this.elementType = elementType;
  }

  public String getTypeIdentifier() {
    return "list<" + elementType.getTypeIdentifier() + ">";
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
