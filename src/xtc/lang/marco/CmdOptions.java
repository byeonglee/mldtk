package xtc.lang.marco;

import static xtc.lang.marco.Util.out;

import xtc.util.Runtime;

public class CmdOptions {

  private static final Runtime runtime = new Runtime();
  private static final String DISABLE_DYNAMIC_HYGIENE_CHECKING = "dhd";
  private static final String DISABLE_INTERPRETER = "di";
  private static final String DISABLE_STATIC_HYGIENE_CHECKING = "dhs";
  private static final String DISABLE_SYNTAX_CHECKING = "ds";
  private static final String DISABLE_TYPE_CHECKING = "dt";
  private static final String HELP = "help";
  private static final String PRINT_AST = "pa";
  private static final String PRINT_BLANK_EXPANSION = "pbe";
  private static final String PRINT_FRAGMENT_INFORMATIOn = "pfi";
  private static final String PRINT_ORACLE_QUERIES = "pq";
  private static final String PRINT_STATISTICS = "pstat";
  private static final String QUERY_FILE_PREFIX = "qf";

  static {
    runtime.bool(DISABLE_DYNAMIC_HYGIENE_CHECKING, DISABLE_DYNAMIC_HYGIENE_CHECKING, false,
        "disable dynamic checking of hygienic expansion");
    runtime.bool(DISABLE_INTERPRETER, DISABLE_INTERPRETER, false, "disable interpreter");
    runtime.bool(DISABLE_STATIC_HYGIENE_CHECKING, DISABLE_STATIC_HYGIENE_CHECKING, false,
        "disable static checking of hygienic expansion");
    runtime.bool(DISABLE_SYNTAX_CHECKING, DISABLE_SYNTAX_CHECKING, false,
        "disable static checking of hygienic expansion");
    runtime.bool(DISABLE_TYPE_CHECKING, DISABLE_TYPE_CHECKING, false, "disable type checking");
    runtime.bool(HELP, HELP, false, "print this message");
    runtime.bool(PRINT_AST, PRINT_AST, false, "print the abstract syntax tree");
    runtime.bool(PRINT_BLANK_EXPANSION, PRINT_BLANK_EXPANSION, false, "print blank expansion");
    runtime.bool(PRINT_FRAGMENT_INFORMATIOn, PRINT_FRAGMENT_INFORMATIOn, false, "print fragment information");
    runtime.bool(PRINT_ORACLE_QUERIES, PRINT_ORACLE_QUERIES, false, "print oracle queries");
    runtime.bool(PRINT_STATISTICS, PRINT_STATISTICS, false, "print statistics");
    runtime.bool(QUERY_FILE_PREFIX, QUERY_FILE_PREFIX, false, "query file prefix");
  }

  public static boolean hasDisableDynamicHygieneChecking() {
    return runtime.test(DISABLE_DYNAMIC_HYGIENE_CHECKING);
  }

  static boolean hasDisableInterpreter() {
    return runtime.test(DISABLE_INTERPRETER);
  }

  public static boolean hasDisableStaticHygieneChecking() {
    return runtime.test(DISABLE_STATIC_HYGIENE_CHECKING);
  }

  static boolean hasDisableSytaxChecking() {
    return runtime.test(DISABLE_SYNTAX_CHECKING);
  }

  static boolean hasDisableTypeChecking() {
    return runtime.test(DISABLE_TYPE_CHECKING);
  }

  public static boolean printAst() {
    return runtime.test(PRINT_AST);
  }

  public static boolean printBlankExpansion() {
    return runtime.test(PRINT_BLANK_EXPANSION);
  }

  public static boolean printFragmentInformation() {
    return runtime.test(PRINT_FRAGMENT_INFORMATIOn);
  }

  public static boolean printOracleQuery() {
    return runtime.test(PRINT_ORACLE_QUERIES);
  }

  public static boolean printStatistics() {
    return runtime.test(PRINT_STATISTICS);
  }

  public static String[] processOptions(final String[] args) throws Exception {
    int idx = runtime.process(args);
    runtime.initDefaultValues();
    String[] residue = new String[args.length - idx];
    System.arraycopy(args, idx, residue, 0, residue.length);
    return residue;
  }

  public static void usage(final String msg) {
    out("Usage: %s <option>* <file-name>\n", Main.class.getName());
    out("where <option>* include:\n");
    runtime.printOptions();
    System.exit(1);
  }
}
