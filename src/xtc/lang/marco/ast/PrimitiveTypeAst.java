package xtc.lang.marco.ast;

import xtc.lang.marco.type.PrimitiveType;
import xtc.lang.marco.type.Type;
import xtc.tree.Location;

public final class PrimitiveTypeAst extends TypeAst {
  public final PrimitiveType type;
  public final String text;

  public PrimitiveTypeAst(Location loc, PrimitiveType type, String text) {
    super(loc);
    this.type = type;
    this.text = text;
  }

  public String getTypeIdentifier() {
    return text;
  }

  Type getType() {
    return type;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
