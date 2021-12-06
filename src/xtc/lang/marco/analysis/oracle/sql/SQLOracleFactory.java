package xtc.lang.marco.analysis.oracle.sql;

import xtc.lang.marco.analysis.oracle.ICapturedNameOracle;
import xtc.lang.marco.analysis.oracle.ICodeTypeOracle;
import xtc.lang.marco.analysis.oracle.IFreeNameOracle;
import xtc.lang.marco.analysis.oracle.ISyntaxOracle;
import xtc.lang.marco.analysis.oracle.OracleFactory;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.type.CodeType;

public class SQLOracleFactory extends OracleFactory {
  public ICapturedNameOracle createCapturedNameOracle(Fragment f, Blank b, String freeName) {
    return new SQLCapturedNameAnalyzer(f, b, freeName);
  }

  public IFreeNameOracle createFreeNameOracle(Fragment m) {
    return new SQLFreeNameAnalyzer(m);
  }

  public IFreeNameOracle createFreeNameOracle(StrongAst origin, CodeType ct, McCode c) {
    return new SQLFreeNameAnalyzer(ct, c);
  }

  public ISyntaxOracle createSyntaxOracle(Fragment f) {
    return new SQLSyntaxAnalyzer(f);
  }

  public ICodeTypeOracle createCodeTypeOracle() {
    return new SQLCodeTypeOracle();
  }
}
