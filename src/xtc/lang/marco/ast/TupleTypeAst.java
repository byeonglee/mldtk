package xtc.lang.marco.ast;

import java.util.LinkedList;
import java.util.List;

import xtc.lang.marco.Util;
import xtc.tree.Location;

public final class TupleTypeAst extends CompositeTypeAst {
  public final AttributeAst[] attributes;

  public TupleTypeAst(Location loc, AttributeAst[] attributes) {
    super(loc);
    this.attributes = attributes;
  }

  public String getTypeIdentifier() {
    List<String> types = new LinkedList<String>();
    for (AttributeAst a : attributes) {
      types.add(String.format("%s %s", a.ID, a.type.getTypeIdentifier()));
    }
    return String.format("tuple<%s>", Util.join(types, ","));
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
