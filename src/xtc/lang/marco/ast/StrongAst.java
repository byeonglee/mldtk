package xtc.lang.marco.ast;

import xtc.tree.Location;

public abstract class StrongAst {
  public final int _column;
  public final int _line;
  public String sourceFile;

  public StrongAst(int column, int line, String sourceFile) {
    _column = column;
    _line = line;
    this.sourceFile = sourceFile;
  }

  public StrongAst(final Location loc) {
    this(loc.column, loc.line, loc.file);
  }

  public abstract void accept(final Visitor visitor);
}
