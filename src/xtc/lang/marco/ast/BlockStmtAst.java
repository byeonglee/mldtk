package xtc.lang.marco.ast;

import xtc.lang.marco.stable.Scope;
import xtc.tree.Location;

public class BlockStmtAst extends StmtAst {
  public final int endLine, endColunm;
  public final StmtAst[] _stmts;
  public Scope scope;

  public int stmtCount() {
    return _stmts.length;
  }

  public final StmtAst stmt(final int i) {
    return _stmts[i];
  }

  public BlockStmtAst(Location loc, StmtAst[] stmts, int endLine, int endColunm) {
    super(loc);
    this.endLine = endLine;
    this.endColunm = endColunm;
    _stmts = stmts;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
