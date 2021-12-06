package xtc.lang.marco.analysis.oracle.cpp;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.Statistics;
import xtc.lang.marco.analysis.oracle.IFreeNameOracle;
import xtc.lang.marco.analysis.oracle.ISyntaxOracle;
import xtc.lang.marco.analysis.oracle.cpp.QueryState.ErrorMessage;
import xtc.lang.marco.analysis.oracle.cpp.QueryState.decl;
import xtc.lang.marco.analysis.oracle.cpp.QueryState.func;
import xtc.lang.marco.analysis.oracle.cpp.QueryState.tdecl;
import xtc.lang.marco.analysis.oracle.cpp.QueryState.vdecl;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentElement;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.exception.BackTrackingException;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.exception.OracleAnalysisException;
import xtc.lang.marco.exception.OracleAnalysisTimeOut;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.run.McToken;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.ListType;
import xtc.lang.marco.type.Type;

public class CPPSyntaxAnalyzer implements ISyntaxOracle, IFreeNameOracle {

  final StrongAst origin;
  final QueryState initialQstate;
  QueryState finalQState;
  int numberOfQueries = 0;
  int numberOfBackTracks = 0;

  public CPPSyntaxAnalyzer(StrongAst origin, CodeType codeType) {
    this.origin = origin;
    initialQstate = QueryState.createEmptyQueryState(codeType);
  }

  CPPSyntaxAnalyzer(Fragment fragment) {
    this(fragment, fragment.getCodeType());
    for (String tname : fragment.getTypeNames()) {
      initialQstate.addContext(new QueryState.typedefdecl(tname));
    }
    concretizeFragment(initialQstate, fragment);
  }

  public CPPSyntaxAnalyzer(McCode c, CodeType type) {
    this((StrongAst) null, type);
    for (McToken s : c.tokens) {
      initialQstate.tokens.add(s.value);
    }
  }

  public void concretizeFragment(QueryState qs, Fragment f) {
    CodeType t = qs.codeType;
    if (t.phrase.equals("id")) {
      completeExprFragment(qs, f);
    } else if (t.phrase.equals("type")) {
      completeTypeFragment(qs, f);
    } else if (t.phrase.equals("tname")) {
      completeTypeNameFragment(qs, f);
    } else if (t.phrase.equals("expr")) {
      completeExprFragment(qs, f);
    } else if (t.phrase.equals("stmt")) {
      completeStmtFragment(qs, f);
    } else if (t.phrase.equals("fdef")) {
      completeFdefFragment(qs, f);
    } else if (t.phrase.equals("mdecl")) {
      completeMdeclFragment(qs, f);
    } else if (t.phrase.equals("decl")) {
      completeDeclFragment(qs, f);
    } else if (t.phrase.equals("cunit")) {
      completeCunitFragment(qs, f);
    } else {
      _assert(false, "TBI");
    }
  }

  void completeFragmentBody(QueryState qs, Fragment f, String cname) {
    Set<Blank> equalBlanks = f.getMustEqualBlanks();
    String equalID = equalBlanks.size() == 0 ? null : qs.genSym();
    int bid = 0;
    for (FragmentElement e : f.elements) {
      if (e instanceof Blank) {
        Blank b = (Blank) e;
        if ("mdecl".equals(f.getCodeType().phrase) && f.hasProperty("class") && f.isEnclosingClassNameForMdecl(bid)) {
          qs.tokens.add(cname);
        } else if (equalID != null && equalBlanks.contains(b)) {
          qs.tokens.add(equalID);
        } else {
          concreatizeBlank(qs, b, cname);
        }
        bid++;
      } else if (e instanceof ObjectToken) {
        qs.tokens.add(((ObjectToken) e).value);
      } else if (e instanceof ObjectId) {
        qs.tokens.add(((ObjectId) e).name);
      }
    }
  }

  void completeTypeFragment(QueryState qs, Fragment f) {
    completeFragmentBody(qs, f, null);
    qs.append("%s", qs.genSym());
    qs.append(";");
  }

  void completeTypeNameFragment(QueryState qs, Fragment f) {
    qs.append("void query_tname(){");
    qs.append("sizeof(");
    completeFragmentBody(qs, f, null);
    qs.append(");");
    qs.append("}");
  }

  void completeExprFragment(QueryState qs, Fragment f) {
    qs.append("int query_expr() {");
    qs.append("return");
    qs.append("(");
    completeFragmentBody(qs, f, null);
    qs.append(")");
    qs.append(";");
    qs.append("}");
  }

  void completeStmtFragment(QueryState qs, Fragment f) {
    qs.append("int query_stmt() {");
    qs.append("if (1)");
    completeFragmentBody(qs, f, null);
    qs.append("else;");
    qs.append("}");
  }

  void completeDeclFragment(QueryState qs, Fragment f) {
    completeFragmentBody(qs, f, null);
  }

  void completeFdefFragment(QueryState qs, Fragment f) {
    completeFragmentBody(qs, f, null);
  }

  void completeMdeclFragment(QueryState qs, Fragment f) {
    String cname = qs.genSym();
    qs.append("class");
    qs.append(cname);
    qs.append("{");
    completeFragmentBody(qs, f, cname);
    qs.append("}");
    qs.append(";");
  }

  void completeCunitFragment(QueryState qs, Fragment f) {
    completeFragmentBody(qs, f, null);
  }

  void concreatizeBlank(QueryState qs, Blank b, String cname) {
    Type _t = b.expr.resolvedType;
    if (_t instanceof CodeType) {
      CodeType t = (CodeType) _t;
      String phrase = t.phrase;
      if (phrase.equals("id")) {
        qs.append("%s", qs.genSym());
      } else if (phrase.equals("type")) {
        String fid = qs.genSym();
        qs.append("%s", fid);
        // qs.addContext(new tdecl(fid));
      } else if (phrase.equals("tname")) {
        qs.append("%s", "int");
      } else if (phrase.equals("expr")) {
        qs.append("%s", "1");
      } else if (phrase.equals("stmt")) {
        qs.append("%s", ";");
      } else if (phrase.equals("fdef")) {
        qs.append("%s", "int");
        qs.append("%s", qs.genSym());
        qs.append("%s", "(");
        qs.append("%s", ")");
        qs.append("%s", "{");
        qs.append("%s", "}");
      } else if (phrase.equals("decl")) {
        qs.append("%s", "int");
        qs.append("%s", qs.genSym());
        qs.append("%s", ";");
      } else if (phrase.equals("mdecl")) {
        qs.append("%s", "int");
        qs.append("%s", qs.genSym());
        qs.append("%s", ";");
      } else if (phrase.equals("cunit")) {
        // empty
      } else {
        _assert(false, "TBI for %s", phrase);
      }
    } else if (_t instanceof ListType) {
      ListType lt = (ListType) _t;
      assert (lt.getIterationType() instanceof CodeType);
      // empty for list types
    } else {
      _assert(false, "TBI");
    }
  }

  public void checkSyntax() throws MarcoException {
    perform();
  }

  public StrongAst getErroReportSite() {
    return origin;
  }

  QueryState backtrack(QueryState qs) {
    numberOfBackTracks++;
    _assert(qs.evaluated);
    throw new BackTrackingException(qs);
  }

  QueryState speculateEntityOfName(QueryState qs, String[] scope, String id, boolean type, boolean namespace,
      boolean variable) {
    _assert(type || namespace || variable);
    if (type) {
      try {
        if (CmdOptions.printOracleQuery()) {
          out("[speculating] '%s' is a type.\n", id);
        }
        return solve(qs.assertType(scope, id));
      } catch (BackTrackingException e) {
        if (CmdOptions.printOracleQuery()) {
          out("[backtracking:%d] '%s' cannot be a type name\n", numberOfBackTracks, id);
        }
      }
    }

    if (variable) {
      try {
        if (CmdOptions.printOracleQuery()) {
          out("[speculating] '%s' is a variable.\n", id);
        }
        return solve(qs.assertVariable(scope, id));
      } catch (BackTrackingException e) {
        if (CmdOptions.printOracleQuery()) {
          out("[backtracking:%d] '%s' cannot be a variable\n", numberOfBackTracks, id);
        }
      }
    }

    return backtrack(qs);
  }

  static Set<String> CPPKEY = new HashSet<String>();
  static {
    for (String s : new String[] { "and", "and_eq", "asm", "auto", "bitand", "bitor", "bool", "break", "case", "catch",
        "char", "class", "compl", "const", "const_cast", "continue", "default", "delete", "do", "double",
        "dynamic_cast", "else", "enum", "explicit", "export", "extern", "false", "float", "for", "friend", "goto", "if",
        "inline", "int", "long", "mutable", "namespace", "new", "not", "not_eq", "operator", "or", "or_eq", "private",
        "protected", "public", "register", "reinterpre_cast", "return", "short", "signed", "sizeof", "static",
        "static_cast", "struct", "switch", "template", "this", "throw", "true", "try", "typedef", "typeid", "typename",
        "union", "unsigned", "using", "virtual", "void", "volatile", "wchar_t", "while", "xor", "xor_eq", })
      CPPKEY.add(s);
  }

  static boolean iscppid(String s) {
    if (!s.matches("^[a-z_A-Z][0-9a-zA-Z_]+$")) {
      return false;
    } else {
      return !CPPKEY.contains(s);
    }
  }

  QueryState handleSyntaxError(QueryState qs) {
    _assert(qs.evaluated);
    int failPoint = qs.errors.get(0).tokenIndex;
    for (String id : qs.getIdentifiersNotInContext()) {
      try {
        QueryState nqs = qs.assertType(new String[0], id);
        numberOfQueries++;
        if (numberOfQueries >= 1000) {
          throw new OracleAnalysisTimeOut();
        }
        nqs.evalute();
        if (nqs.errors.size() == 0) {
          return nqs;
        }
        int failpointNew = nqs.errors.get(0).tokenIndex;
        if (failpointNew > failPoint) {
          if (CmdOptions.printOracleQuery()) {
            out("[speculating] '%s' is a type.\n", id);
          }
          return solve(nqs.dup());
        }
      } catch (BackTrackingException e) {
        if (CmdOptions.printOracleQuery()) {
          out("[backtracking:%d] '%s' as a type name does not resolve the syntax error.\n", numberOfBackTracks, id);
        }
      }
    }
    return backtrack(qs);
  }

  static abstract class ErrorHandler {
    final Pattern msgPattern;
    Matcher m;

    public ErrorHandler(Pattern msgPattern) {
      this.msgPattern = msgPattern;
    }

    boolean isAcceptable(String msg) {
      return msgPattern.matcher(msg).matches();
    }

    void accept(String msg) {
      m = msgPattern.matcher(msg);
      _assert(m.matches());
    }

    String g(int i) {
      return m.group(i);
    }

    abstract QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState s)
        throws OracleAnalysisException;
  }

  static abstract class SyntaxErrorHandler extends ErrorHandler {
    public SyntaxErrorHandler(String p) {
      super(Pattern.compile(p));
    }
  }

  static abstract class SemanticErrorHandler extends ErrorHandler {
    public SemanticErrorHandler(String p) {
      super(Pattern.compile(p));
    }
  }

  static public boolean isSignificantErrorMessage(String msg) {
    for (ErrorHandler h : errorHandlers) {
      if (h.isAcceptable(msg)) {
        return true;
      }
    }
    return false;
  }

  ErrorHandler findErrorHandler(String emsg) {
    for (ErrorHandler h : errorHandlers) {
      if (h.isAcceptable(emsg)) {
        return h;
      }
    }
    return null;
  }

  public QueryState solve(QueryState qs) throws OracleAnalysisException {
    _assert(!qs.evaluated);
    qs.evalute();
    numberOfQueries++;
    if (numberOfQueries >= 1000) {
      throw new OracleAnalysisTimeOut();
    }
    if (qs.errors.size() == 0) {
      return qs;
    }
    ErrorMessage emsg = qs.errors.get(0);
    ErrorHandler h = findErrorHandler(emsg.msg);
    _assert(h != null, "unreachable");
    if (CmdOptions.printOracleQuery()) {
      out("[handling] %s\n", emsg.msg);
    }
    h.accept(emsg.msg);
    return h.handleMessage(this, emsg, qs);
  }

  static ErrorHandler errorHandlers[] = { new SyntaxErrorHandler("^expected (.+) before \'(.+)\' token$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      return a.handleSyntaxError(qs);
    }
  }, new SyntaxErrorHandler("^expected (.+) before \'(.+)\'$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      return a.handleSyntaxError(qs);
    }
  }, new SyntaxErrorHandler("^expected .+ at end of member declaration$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      return a.handleSyntaxError(qs);
    }
  }, new SemanticErrorHandler("^\'(.+)\' was not declared in this scope$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String id = g(1);
      return a.speculateEntityOfName(qs, new String[0], id, true, true, true);
    }
  }, new SemanticErrorHandler("^\'::(.+)\' has not been declared$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String name = g(1);
      return a.speculateEntityOfName(qs, new String[0], name, true, true, true);
    }
  }, new SemanticErrorHandler("^\'(.+)::(.+)\' has not been declared$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String[] scope = g(1).split("::");
      String name = g(2);
      return a.speculateEntityOfName(qs, scope, name, true, true, true);
    }
  }, new SemanticErrorHandler("^\'(.+)\' has not been declared$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String id = g(1);
      return a.speculateEntityOfName(qs, new String[0], id, true, true, true);
    }
  }, new SemanticErrorHandler("^definition of implicitly-declared \'(.+)::~(.+)\\(\\)\'") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String[] scope = g(1).split("::");
      String name = g(2);
      if ((qs.lookupScope(scope) == null)) {
        _assert(false, "Let me examine carefully");
        return null;
      } else {
        if ((qs.lookupScope(scope).context.get(name) == null)) {
          QueryState nqs = qs.dup();
          nqs.lookupScope(scope).addContext(new func(("~" + name)));
          return a.solve(nqs);
        } else {
          _assert(false, "Let me examine carefully");
          return null;
        }
      }
    }
  }, new SemanticErrorHandler("^\'(.+)\' is not a member of \'(.+)\'") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String name = g(1), scope[] = g(2).split("::");
      return a.speculateEntityOfName(qs, scope, name, true, false, true);
    }
  }, new SemanticErrorHandler("^\'.*class (.+)\' has no member named \'(.+)\'") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String scope[] = g(1).split("::"), mname = g(2);
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s' is a type.\n", mname);
      }
      return a.solve(qs.assertVariable(scope, mname));
    }
  }, new SemanticErrorHandler("^prototype for \'(.+)::(.+)(\\(.+\\))\' does not match any in class \'(.+)\'$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String cname = g(1);
      String mfname = g(2);
      String args = g(3);
      String cname2 = g(4);
      _assert(cname.equals(cname2));
      decl cdecl = qs.lookup(new String[0], cname);
      if (cdecl instanceof tdecl) {
        QueryState nqs = qs.dup();
        tdecl td = (tdecl) nqs.lookup(new String[0], cname);
        td.addContext(new func(mfname, null, args));
        return a.solve(nqs);
      } else {
        _assert(false, "TBII");
        return null;
      }
    }
  }, new SemanticErrorHandler("^\'(.+)\' in namespace \'::\' does not name a type$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String name = g(1);
      if ((qs.lookup(new String[0], name) == null)) {
        QueryState nqs = qs.dup();
        nqs.addContext(new tdecl(name));
        return a.solve(nqs);
      } else {
        return a.backtrack(qs);
      }
    }
  }, new SemanticErrorHandler("^\'(.+)::(.+)\' is not a class or namespace$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String scope[] = { g(1) };
      String name = g(2);
      return a.solve(qs.assertType(scope, name));
    }
  }, new SemanticErrorHandler("^'(.+)' in namespace '(.+)' does not name a type$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String name = g(1);
      String scope[] = g(2).split("::");
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s::%s' is a type.\n", join(scope, "::"), name);
      }
      return a.solve(qs.assertType(scope, name));
    }
  }, new SemanticErrorHandler("^\'(.+)\' in \'class (.+)\' does not name a type$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String name = g(1);
      String scope[] = g(2).split("::");
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s::%s' is a type.\n", join(scope, "::"), name);
      }
      return a.solve(qs.assertType(scope, name));
    }
  }, new SemanticErrorHandler("^\'(.+)\' does not name a type$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String[] scope = new String[0];
      String name = g(1);
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s::%s' is a type.\n", join(scope, "::"), name);
      }
      return a.solve(qs.assertType(scope, name));
    }
  }, new SemanticErrorHandler("^\'(.+)::(.+)\' is not a template") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String[] scope = g(1).split("::");
      String name = g(2);
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s' is a type.\n", name);
      }
      return a.solve(qs.assertTemplate(scope, name));
    }
  }, new SemanticErrorHandler(
      "^type/value mismatch at argument (\\d+) in template parameter list for \'template<.+> class (.+)::(.+)\'$") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      int ord = Integer.parseInt(g(1));
      String scope[] = g(2).split("::");
      String name = g(3);
      if ((qs.lookupScope(scope).context.get(name) != null)) {
        QueryState nqs = qs.dup();
        tdecl td = (tdecl) nqs.lookupScope(scope).context.get(name);
        td.templateParameters.set((ord - 1), "int");
        return a.solve(nqs);
      } else {
        _assert(false, "unrechable");
        return null;
      }
    }
  }, new SemanticErrorHandler("^\'(.+)\' is not a namespace-name") {
    public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
      String names[] = g(1).split("::");
      String id = names[names.length - 1];
      String scope[] = new String[names.length - 1];
      System.arraycopy(names, 0, scope, 0, names.length - 1);
      if (CmdOptions.printOracleQuery()) {
        out("[asserting] '%s' is a namespace.\n", id);
      }
      return a.solve(qs.assertNamespace(scope, id));
    }
  },

      new SemanticErrorHandler("^redefinition of 'class (.+)'$") {
        public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
          String cname = g(1);
          if (qs.search(cname) != null) {
            return a.backtrack(qs);
          } else {
            _assert(false, "TBI");
            return a.backtrack(qs);
          }
        }
      }, new SemanticErrorHandler("^'struct (.+)' redeclared as different kind of symbol$") {
        public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
          String cname = g(1);
          if (qs.search(cname) != null) {
            return a.backtrack(qs);
          } else {
            _assert(false, "TBI");
            return a.backtrack(qs);
          }
        }
      }, new SemanticErrorHandler("^no '.+' member function declared in class '(.+)'$") {
        public QueryState handleMessage(CPPSyntaxAnalyzer a, ErrorMessage emsg, QueryState qs) {
          String cname = g(1);
          if (qs.search(cname) != null) {
            return a.backtrack(qs);
          } else {
            _assert(false, "TBI");
            return a.backtrack(qs);
          }
        }
      }, };

  public void reportStatics() {
    if (origin instanceof Fragment) {
      Statistics.setNumbers((Fragment) origin, numberOfBackTracks, numberOfQueries,
          finalQState.getNumberofDeclarations(), _getFreeNames().size());
    }
  }

  public void perform() {
    try {
      finalQState = initialQstate;
      finalQState = solve(initialQstate);
    } catch (OracleAnalysisTimeOut e) {
      throw new MarcoException(origin, "oracle anlaysis timeout");
    } catch (BackTrackingException e) {
      throw new MarcoException(origin, "cannot verify syntax due to lack of infomation from the compiler");
    }
    if (CmdOptions.printStatistics()) {
      reportStatics();
    }
  }

  public Set<String> getFreeNames() {
    perform();
    return _getFreeNames();
  }

  Set<String> _getFreeNames() {
    Set<String> freeNames = new HashSet<String>();
    for (String name : finalQState.getDeclaredNames()) {
      if (!initialQstate.gensyms.contains(name)) {
        decl c = finalQState.getDeclaration(name);
        if (c instanceof vdecl) {
          freeNames.add(name);
        }
      }
    }
    return freeNames;
  }
}
