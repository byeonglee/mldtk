package xtc.lang.marco.ast;

import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.Type;
import xtc.tree.Location;

public final class CodeTypeAst extends TypeAst {
  public final CodeType codeType;

  protected CodeTypeAst(final Location loc, final CodeType codeType) {
    super(loc);
    this.codeType = codeType;
  }

  public String getTypeIdentifier() {
    return "Code<" + codeType + ">";
  }

  Type getType() {
    return codeType;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }
}
