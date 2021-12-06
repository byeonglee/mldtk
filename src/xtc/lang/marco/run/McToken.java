package xtc.lang.marco.run;

import xtc.lang.marco.Util.SourceLineLocation;
import xtc.lang.marco.ast.CallExprAst;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;

public class McToken extends McObject {
  public final String sourceFile;
  public final int line, column;
  public final String value;

  public McToken(SourceLineLocation l, String v) {
    this(l.sourceFile, l.line, 0, v);
  }

  public McToken(ObjectToken a) {
    this(a.sourceFile, a._line, a._column, a.value);
  }

  public McToken(ObjectId a) {
    this(a.sourceFile, a._line, a._column, a.name);
  }

  public McToken(CallExprAst a, String v) {
    this(a.sourceFile, a._line, a._column, v);
  }

  public McToken(String sourceFile, int line, int column, String value) {
    this.sourceFile = sourceFile;
    this.line = line;
    this.column = column;
    this.value = value;
  }

  public int hashCode() {
    return value.hashCode();
  }

  public boolean equals(Object obj) {
    if (obj instanceof McToken) {
      return value.equals(((McToken) obj).value);
    } else {
      return false;
    }
  }
}
