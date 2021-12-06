package xtc.lang.marco.ast;

import xtc.tree.Location;

public class IfStmtAst extends StmtAst {
  public final ExprAst _expr;
  public final StmtAst _thenStmt;
  public final StmtAst _elseStmt;

  protected IfStmtAst(final Location loc, final ExprAst expr, final StmtAst thenStmt, final StmtAst elseStmt) {
    super(loc);
    _expr = expr;
    _thenStmt = thenStmt;
    _elseStmt = elseStmt;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
