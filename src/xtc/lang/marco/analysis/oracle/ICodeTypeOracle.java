package xtc.lang.marco.analysis.oracle;

import xtc.lang.marco.type.CodeType;

public interface ICodeTypeOracle {
  boolean isAssignable(CodeType lhs, CodeType rhs);
}
