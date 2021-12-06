package xtc.lang.marco.analysis.hygiene;

import static xtc.lang.marco.Util.cat;
import static xtc.lang.marco.Util.out;
import static xtc.lang.marco.Util.readlines;

import java.io.File;

import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.HygieneError;
import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.Literal;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.ProgramAst;
import xtc.lang.marco.ast.StrongAst;

public class StaticHygieneChecker {
  public static void perform(ProgramAst prog) {
    DFGBuilder h = new DFGBuilder(prog);
    h.visit(prog);
    DataFlowAnalysis df = h.df;
    df.solve();
    for (HygieneError e : df.getHigieneErrors()) {
      Blank f = (Blank) e.failure.cause;
      out("%s:%d:%d: hygiene error for name '%s' at the following blank:\n", f.sourceFile, f._line, f._column,
          e.capturedName);
      cat(new File(prog.sourceFile), f._line, f._line);
      out("Here are the origins:\n");
      for (Literal cause : e.causes) {
        StrongAst c = cause.cause;
        try {
          out("  %s:%d:%d: %s\n", c.sourceFile, c._line, c._column, readlines(c.sourceFile).get(c._line - 1));
        } catch (Exception ex) {
          out("error -- I could not read the '%s' file.", c.sourceFile);
        }
      }
      out("\n");
    }
    if (df.getHigieneErrors().size() > 0) {
      System.exit(1);
    }
  }
}
