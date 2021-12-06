package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ObjectToken extends FragmentElement {
  public final String value;
  public final boolean isStringLiteral;
  public final boolean isCharLiteral;

  ObjectToken(Location loc, String value, boolean isStringLiteral, boolean isCharLiteral) {
    super(loc);
    this.value = value;
    this.isStringLiteral = isStringLiteral;
    this.isCharLiteral = isCharLiteral;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
