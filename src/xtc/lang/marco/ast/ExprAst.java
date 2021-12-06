package xtc.lang.marco.ast;

import xtc.lang.marco.type.Type;
import xtc.tree.Location;

public abstract class ExprAst extends StrongAst {
  public Type resolvedType;

  protected ExprAst(final Location loc) {
    super(loc);
  }
}
