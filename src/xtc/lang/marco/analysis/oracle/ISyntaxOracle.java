package xtc.lang.marco.analysis.oracle;

import xtc.lang.marco.exception.MarcoException;

public interface ISyntaxOracle {
  void checkSyntax() throws MarcoException;

  void reportStatics();
}
