package xtc.lang.marco.ast;

import xtc.lang.marco.stable.Scope;
import xtc.lang.marco.type.FunctionType;
import xtc.tree.Location;

public class FuncDefinition extends TopLevelAst {
  public final TypeAst returnType;
  public final NameAst name;
  public final FormalParamAst[] formals;
  public final BlockStmtAst body;
  public FunctionType resolvedType;
  public Scope scope;

  public FuncDefinition(Location loc, TypeAst returnType, NameAst name, FormalParamAst[] formals, BlockStmtAst body) {
    super(loc);
    this.returnType = returnType;
    this.name = name;
    this.formals = formals;
    this.body = body;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
