package xtc.lang.marco.stable;

import xtc.lang.marco.type.Type;

public final class TypeAlias extends SymbolInfo {
  public final Type type;

  public TypeAlias(Type type) {
    this.type = type;
  }

  public Type getType() {
    return type;
  }

  public String toString() {
    return "type " + type.toExpression();
  }

  public String getEntityName() {
    return "type synonym";
  }
}
