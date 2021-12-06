package xtc.lang.marco.ast;

import xtc.tree.Location;

public abstract class TypeAst extends StrongAst {

  protected TypeAst(Location loc) {
    super(loc);
  }

  public abstract String getTypeIdentifier();
}
