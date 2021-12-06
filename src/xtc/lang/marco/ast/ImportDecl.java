package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class ImportDecl extends TopLevelAst {
  public final NameAst ID;

  public ImportDecl(Location loc, NameAst iD) {
    super(loc);
    ID = iD;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
