package xtc.lang.marco.ast;

import xtc.tree.Location;

public class ConstDeclAst extends TopLevelAst {
  public final NameAst id;
  public final NumAst value;

  public ConstDeclAst(Location loc, NameAst id, NumAst value) {
    super(loc);
    this.id = id;
    this.value = value;
  }

  public void accept(Visitor visitor) {
    visitor.visit(this);
  }
}
