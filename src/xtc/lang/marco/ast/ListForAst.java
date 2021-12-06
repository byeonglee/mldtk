package xtc.lang.marco.ast;

import xtc.lang.marco.stable.Scope;
import xtc.tree.Location;

public class ListForAst extends ExprAst {
  public final NameAst ID;
  public final TypeAst type;
  public final ExprAst select;
  public final ExprAst from;
  public final ExprAst cond;
  public Scope scope;

  public ListForAst(Location loc, NameAst _ID, TypeAst _type, ExprAst _select, ExprAst _from, ExprAst _cond) {
    super(loc);
    ID = _ID;
    type = _type;
    select = _select;
    from = _from;
    cond = _cond;
  }

  public void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
