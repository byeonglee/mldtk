package xtc.lang.marco.ast;

import xtc.tree.Location;

public final class AssignStmtAst extends StmtAst {
  public final NameAst _name;
  public final InfixOp op;
  public final ExprAst _expr;

  public AssignStmtAst(Location loc, NameAst name, InfixOp op, ExprAst expr) {
    super(loc);
    _name = name;
    this.op = op;
    _expr = expr;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
