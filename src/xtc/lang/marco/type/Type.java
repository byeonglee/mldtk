package xtc.lang.marco.type;

import xtc.lang.marco.analysis.oracle.Oracle;

public abstract class Type {
  public final boolean assignable(Type rhs) {
    if (this instanceof CodeType && rhs instanceof CodeType) {
      return Oracle.isAssignable((CodeType) this, (CodeType) rhs);
    } else {
      return typeEquals(rhs);
    }
  }

  abstract public boolean typeEquals(Type t);

  public abstract String toExpression();

  public String toString() {
    return toExpression();
  }
}
