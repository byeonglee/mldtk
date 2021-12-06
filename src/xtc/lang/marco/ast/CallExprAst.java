package xtc.lang.marco.ast;

import xtc.lang.marco.stable.FunctionName;

import xtc.tree.Location;

public class CallExprAst extends ExprAst {
  public final NameAst _name;
  public final ExprAst[] _exprs;
  public FunctionName fbind;

  public int exprCount() {
    return _exprs.length;
  }

  public final ExprAst expr(final int i) {
    return _exprs[i];
  }

  public CallExprAst(final Location loc, final NameAst name, final ExprAst[] exprs) {
    super(loc);
    _name = name;
    _exprs = exprs;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
