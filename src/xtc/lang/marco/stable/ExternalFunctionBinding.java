package xtc.lang.marco.stable;

import xtc.lang.marco.ast.ExterFuncDecl;

public class ExternalFunctionBinding extends FunctionName {
  public final ExterFuncDecl efd;

  public ExternalFunctionBinding(ExterFuncDecl efd) {
    this.efd = efd;
  }

  public String getEntityName() {
    return "external function";
  }
}
