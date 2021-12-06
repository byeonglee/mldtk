package xtc.lang.marco.ast;

import xtc.lang.marco.stable.Scope;
import xtc.tree.Location;

public class ForStmtAst extends StmtAst {
  public final TypeAst _type;
  public final NameAst _name;
  public final ExprAst _expr;
  public final StmtAst _stmt;
  public final NameAst _v;
  public Scope scope;

  protected ForStmtAst(final Location loc, final TypeAst type, final NameAst name, final ExprAst expr,
      final StmtAst stmt, final NameAst v) {
    super(loc);
    _type = type;
    _name = name;
    _expr = expr;
    _stmt = stmt;
    _v = v;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
