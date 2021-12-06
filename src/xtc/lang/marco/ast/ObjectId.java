package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ObjectId extends FragmentElement {
  public final String name;

  public ObjectId(Location loc, String name) {
    super(loc);
    this.name = name;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
