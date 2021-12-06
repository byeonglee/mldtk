package xtc.lang.marco.ast;

import xtc.lang.marco.type.Type;
import xtc.tree.Location;

public final class UserTypeAst extends TypeAst {
  public final NameAst id;
  public Type resolvedType;

  public UserTypeAst(Location loc, NameAst id) {
    super(loc);
    this.id = id;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }

  public String getTypeIdentifier() {
    return id._name;
  }

  Type getType() {
    return resolvedType;
  }
}
