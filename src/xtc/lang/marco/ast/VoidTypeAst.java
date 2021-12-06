package xtc.lang.marco.ast;

import xtc.lang.marco.type.PrimitiveType;
import xtc.lang.marco.type.Type;
import xtc.tree.Location;

public final class VoidTypeAst extends TypeAst {

  public VoidTypeAst(Location loc) {
    super(loc);
  }

  public String getTypeIdentifier() {
    return "void";
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }

  Type getType() {
    return PrimitiveType.VOID;
  }
}
