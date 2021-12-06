package xtc.lang.marco.ast;

import xtc.lang.marco.type.FunctionType;
import xtc.tree.Location;

public final class ExterFuncDecl extends TopLevelAst {
  public final NameAst ID;
  public final TypeAst returnType;
  public final TypeAst[] paramTypes;
  public FunctionType resolvedType;

  public ExterFuncDecl(Location loc, NameAst iD, TypeAst returnType, TypeAst[] paramTypes) {
    super(loc);
    this.ID = iD;
    this.returnType = returnType;
    this.paramTypes = paramTypes;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
