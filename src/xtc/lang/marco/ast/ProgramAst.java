package xtc.lang.marco.ast;

import xtc.lang.marco.stable.Scope;
import xtc.tree.Location;

public class ProgramAst extends StrongAst {
  public final TopLevelAst[] funcDefs;
  public Scope scope = new Scope(null);

  public ProgramAst(TopLevelAst[] funcDefs, int line, int column, String sourceFile) {
    super(column, line, sourceFile);
    this.funcDefs = funcDefs;
  }

  public ProgramAst(Location loc, TopLevelAst[] funcDefs) {
    super(loc);
    this.funcDefs = funcDefs;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
