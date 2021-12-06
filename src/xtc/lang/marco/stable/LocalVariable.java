package xtc.lang.marco.stable;

import xtc.lang.marco.type.Type;

public final class LocalVariable extends SymbolInfo {
  final Type type;

  public LocalVariable(Type type) {
    this.type = type;
  }

  public Type getType() {
    return type;
  }

  public String toString() {
    return "local variable " + type.toExpression();
  }

  public String getEntityName() {
    return "local variable";
  }
}
