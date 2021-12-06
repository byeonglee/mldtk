package xtc.lang.marco.analysis.oracle;

import static xtc.lang.marco.Util.cat;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;
import static xtc.lang.marco.analysis.oracle.OracleFactory.getOracleFactory;

import java.util.HashSet;
import java.util.Set;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.type.CodeType;

public abstract class Oracle {

  public static boolean isAssignable(CodeType lhs, CodeType rhs) {
    try {
      ICodeTypeOracle cto = getOracleFactory(lhs.lang).createCodeTypeOracle();
      return cto.isAssignable(lhs, rhs);
    } catch (Exception e) {
      throw new RuntimeException("some unkown failure");
    }
  }

  public static void checkSyntax(Fragment f) throws Exception {
    if (f.hasProperty("ignore")) {
      return;
    }
    ISyntaxOracle so = getOracleFactory(f.getCodeType().lang).createSyntaxOracle(f);
    boolean syntaxOK = false;
    try {
      so.checkSyntax();
      syntaxOK = true;
    } catch (MarcoException e) {
      throw e;
    } finally {
      if (CmdOptions.printFragmentInformation()) {
        out("%s:%d:%d: the fragment\n", f.sourceFile, f._line, f._column);
        cat(f.sourceFile, f._line, f.endLine);
        out("  syntax checking = %s\n", syntaxOK ? "success" : "fail");
        out("  size = %d\n", f.elements.length);
        so.reportStatics();
        out("\n");
      }
    }
  }

  public static boolean isCapture(Fragment f, Blank b, String freeName) throws Exception {
    if (f.hasProperty("ignore")) {
      return false;
    }
    ICapturedNameOracle co = getOracleFactory(f.getCodeType().lang).createCapturedNameOracle(f, b, freeName);
    boolean result = co.isCapture();
    if (CmdOptions.printFragmentInformation()) {
      out("%s:%d:%d: the fragment\n", f.sourceFile, f._line, f._column);
      cat(f.sourceFile, f._line, f.endLine);
      out("%b = captured(\"%s\") at the blank (Line: %d and Column:%d)\n", result, freeName, b._line, b._column);
      out("\n");
    }
    return result;
  }

  public static Set<String> getFreeNames(Fragment m) throws Exception {
    if (m.hasProperty("ignore")) {
      return new HashSet<String>();
    }
    Set<String> s = getOracleFactory(m.getCodeType().lang).createFreeNameOracle(m).getFreeNames();
    if (CmdOptions.printOracleQuery() || CmdOptions.printFragmentInformation()) {
      out("%s:%d:%d: the fragment\n", m.sourceFile, m._line, m._column);
      cat(m.sourceFile, m._line, m.endLine);
      out("  free names = {%s} (%d)\n", join(s, ", "), s.size());
      out("\n");
    }
    return s;
  }

  public static Set<String> getFreeNames(StrongAst origin, CodeType ct, McCode cd) throws Exception {
    Set<String> s = getOracleFactory(ct.lang).createFreeNameOracle(origin, ct, cd).getFreeNames();
    if (CmdOptions.printOracleQuery() || CmdOptions.printFragmentInformation()) {
      out("%s:%d: the fragment\n", origin._line, origin._column);
      out("  free names = {%s}\n", join(s, ", "));
      out("\n");
    }
    return s;
  }
}
