package xtc.lang.marco.stable;

import java.util.HashMap;
import java.util.Map;

public class Scope {
  final Scope parent;
  final Map<String, SymbolInfo> symbols = new HashMap<String, SymbolInfo>();

  public Scope(Scope parent) {
    this.parent = parent;
  }

  public void addSymbol(String name, SymbolInfo s) {
    symbols.put(name, s);
  }

  public SymbolInfo getSymbol(String name) {
    return this._getSymbol(name);
  }

  public SymbolInfo _getSymbol(String name) {
    SymbolInfo i = symbols.get(name);
    if (i == null) {
      if (parent == null) {
        return null;
      } else {
        return parent._getSymbol(name);
      }
    } else {
      return i;
    }
  }
}
