package xtc.lang.marco.analysis.oracle.sql;

import xtc.lang.marco.analysis.oracle.ICodeTypeOracle;
import xtc.lang.marco.type.CodeType;

public class SQLCodeTypeOracle implements ICodeTypeOracle {

  public boolean isAssignable(CodeType lhs, CodeType rhs) {
    return lhs.typeEquals(rhs);
  }
}
