package xtc.lang.marco.stable;

import xtc.lang.marco.type.PrimitiveType;
import xtc.lang.marco.type.Type;

public class GlobalConstant extends SymbolInfo {
  public Type getType() {
    return PrimitiveType.INT;
  }

  public String getEntityName() {
    return "global constant";
  }
}
