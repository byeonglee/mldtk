package xtc.lang.marco.analysis.oracle.cpp;

import static xtc.lang.marco.Util._assert;

import xtc.lang.marco.analysis.oracle.ICapturedNameOracle;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.Type;

public class CppCapturedNameAnalyzer extends CPPSyntaxAnalyzer implements ICapturedNameOracle {
  final Fragment fragment;
  final Blank blank;
  final String freeName;
  public boolean isCaptured = true;

  public CppCapturedNameAnalyzer(Fragment fragment, Blank blank, String freeName) {
    super(fragment, fragment.getCodeType());
    this.fragment = fragment;
    this.blank = blank;
    this.freeName = freeName;
  }

  void concreatizeBlank(QueryState qs, Blank b, String cname) {
    if (b != blank) {
      super.concreatizeBlank(qs, b, cname);
    }
    Type _t = b.expr.resolvedType;
    if (_t instanceof CodeType) {
      CodeType t = (CodeType) _t;
      String phrase = t.phrase;
      if (phrase.equals("id")) {
        qs.append("%s", "(");
        qs.append("%s", freeName);
        qs.append("%s", ")");
      } else if (phrase.equals("expr")) {
        qs.append("%s", "(");
        qs.append("%s", freeName);
        qs.append("%s", ")");
      } else if (phrase.equals("stmt")) {
        qs.append("%s", "{");
        qs.append("%s", freeName);
        qs.append("%s", ";");
        qs.append("%s", "}");
      } else {
        _assert(false, "TBI for %s", phrase);
      }
    } else {
      _assert(false, "TBI");
    }
  }

  public boolean isCapture() {
    perform();
    isCaptured = !finalQState.isDeclaredInContext(freeName);
    return isCaptured;
  }
}
