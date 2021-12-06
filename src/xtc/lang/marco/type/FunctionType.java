package xtc.lang.marco.type;

import java.util.LinkedList;

import xtc.lang.marco.Util;

public final class FunctionType extends Type {
  public final Type returnType;
  public final Type[] formalTypes;

  public FunctionType(Type returnType, Type[] formalTypes) {
    this.returnType = returnType;
    this.formalTypes = formalTypes;
  }

  public boolean typeEquals(Type t) {
    if (t instanceof FunctionType) {
      FunctionType ft = (FunctionType) t;
      if (returnType.typeEquals(ft.returnType)) {
        for (int i = 0; i < formalTypes.length; i++) {
          Type here = formalTypes[i];
          Type there = ft.formalTypes[i];
          if (!here.typeEquals(there)) {
            return false;
          }
        }
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  public String toExpression() {
    LinkedList<String> args = new LinkedList<String>();
    args.add(returnType.toExpression());
    for (Type ftype : formalTypes) {
      args.add(ftype.toExpression());
    }
    return String.format("function(%s)", Util.join(args, ","));
  }
}
