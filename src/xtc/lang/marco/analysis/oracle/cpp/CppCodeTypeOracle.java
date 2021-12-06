package xtc.lang.marco.analysis.oracle.cpp;

import xtc.lang.marco.analysis.oracle.ICodeTypeOracle;
import xtc.lang.marco.type.CodeType;

public class CppCodeTypeOracle implements ICodeTypeOracle {
  public boolean isAssignable(CodeType lhs, CodeType rhs) {
    if ("tname".equals(lhs.phrase) && "type".equals(rhs.phrase)) {
      return true;
    } else if ("type".equals(lhs.phrase) && "id".equals(rhs.phrase)) {
      return true;
    } else if ("tname".equals(lhs.phrase) && "id".equals(rhs.phrase)) {
      return true;
    } else {
      return lhs.phrase.equals(rhs.phrase);
    }
  }
}
