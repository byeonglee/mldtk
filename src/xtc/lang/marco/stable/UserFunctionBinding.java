package xtc.lang.marco.stable;

import xtc.lang.marco.ast.FuncDefinition;

public class UserFunctionBinding extends FunctionName {
  public final FuncDefinition fdef;

  public UserFunctionBinding(FuncDefinition fdef) {
    this.fdef = fdef;
  }

  public String getEntityName() {
    return "function";
  }
}
