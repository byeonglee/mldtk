package xtc.lang.marco;

import static xtc.lang.marco.Util.out;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import xtc.lang.marco.analysis.IPAPruning;
import xtc.lang.marco.analysis.hygiene.StaticHygieneChecker;
import xtc.lang.marco.analysis.oracle.Oracle;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentEnumerator;
import xtc.lang.marco.ast.ImportDecl;
import xtc.lang.marco.ast.ProgramAst;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.ast.TopLevelAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.exception.ParsingFailureException;
import xtc.lang.marco.modules.MLib;
import xtc.lang.marco.run.McObject.McList;
import xtc.lang.marco.run.McObject.McString;
import xtc.lang.marco.run.Runner;
import xtc.lang.marco.stable.TypeChecker;

public class Main {
  public static void main(final String[] args) throws Exception {
    String[] rawArgs = CmdOptions.processOptions(args);
    if (rawArgs.length <= 0) {
      CmdOptions.usage("Please, specify a Marco program.");
    }
    String mprog = rawArgs[0];
    if (!new File(mprog).isFile()) {
      CmdOptions.usage(String.format("%s is not a file name.", mprog));
    }
    try {
      ProgramAst p = compile(mprog);
      if (!CmdOptions.hasDisableInterpreter()) {
        p = IPAPruning.prune(p);
        McList margs = new McList();
        for (int i = 1; i < rawArgs.length; i++) {
          margs.add(new McString(rawArgs[i]));
        }
        new Runner().run(p, margs);
      }
    } catch (ParsingFailureException e) {
      System.exit(1);
    } catch (MarcoException e) {
      StrongAst a = e.cause;
      out("%s:%d:%d: error %s\n", a.sourceFile, a._line, a._column, e.getMessage());
      System.exit(1);
    }
  }

  public static ProgramAst getProgram(String sourceFile) throws Exception {

    HashMap<String, ProgramAst> modules = new HashMap<String, ProgramAst>();
    ProgramAst mainProg = Util.getAst(new FileInputStream(sourceFile), sourceFile);
    modules.put(sourceFile, mainProg);
    for (TopLevelAst t : mainProg.funcDefs) {
      if (!(t instanceof ImportDecl)) {
        continue;
      }
      ImportDecl idecl = (ImportDecl) t;
      String mfile = idecl.ID._name + ".mc";
      if (modules.containsKey(mfile)) {
        continue;
      }
      InputStream is = MLib.class.getResourceAsStream(mfile);
      ProgramAst mprog = Util.getAst(is, mfile);
      modules.put(mfile, mprog);
    }

    List<TopLevelAst> tops = new LinkedList<TopLevelAst>();
    for (String mfile : modules.keySet()) {
      ProgramAst prog = modules.get(mfile);
      for (TopLevelAst t : prog.funcDefs) {
        if (!(t instanceof ImportDecl)) {
          tops.add(t);
        }
      }
    }

    ProgramAst wholeProg = new ProgramAst(tops.toArray(new TopLevelAst[0]), 1, 0, sourceFile);

    return wholeProg;
  }

  /**
   * Parse a source program, generate an abstract tree, and perform type checking.
   *
   * @param sourceFile The input source file name
   * @return The abstract syntax tree of the input source file
   */
  static ProgramAst compile(String sourceFile) throws Exception {
    ProgramAst programAst = getProgram(sourceFile);
    if (!CmdOptions.hasDisableTypeChecking()) {
      TypeChecker.perform(programAst);
    }

    if (!CmdOptions.hasDisableSytaxChecking()) {
      boolean isSyntaxOK = true;
      List<Fragment> flist = FragmentEnumerator.getFragments(programAst);
      for (Fragment f : flist) {
        try {
          Oracle.checkSyntax(f);
        } catch (MarcoException e) {
          isSyntaxOK = false;
          StrongAst a = e.cause;
          out("%s:%d:%d: error %s\n", a.sourceFile, a._line, a._column, e.getMessage());
        }
      }
      if (!isSyntaxOK) {
        System.exit(1);
      }
    }
    if (!CmdOptions.hasDisableStaticHygieneChecking()) {
      StaticHygieneChecker.perform(programAst);
    }

    return programAst;
  }
}
