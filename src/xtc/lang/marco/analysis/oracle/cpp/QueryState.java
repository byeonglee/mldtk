package xtc.lang.marco.analysis.oracle.cpp;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.cat;
import static xtc.lang.marco.Util.indentCpp;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;
import static xtc.lang.marco.Util.readlines;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.Util;
import xtc.lang.marco.analysis.oracle.util.Query;
import xtc.lang.marco.type.CodeType;

public class QueryState {

  static abstract class decl {
    final String name;

    abstract void show(Query q);

    public decl(String name) {
      this.name = name;
    }

    public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((name == null) ? 0 : name.hashCode());
      return result;
    }

    public boolean equals(Object obj) {
      if (this == obj)
        return true;
      if (obj == null)
        return false;
      if (obj instanceof decl == false)
        return false;
      decl other = (decl) obj;
      if (name == null) {
        if (other.name != null)
          return false;
      } else if (!name.equals(other.name))
        return false;
      return true;
    }

    abstract decl dup();

    abstract Set<String> getUses();

    abstract int getNumberofDeclarations();
  }

  static abstract class compositeDecl extends decl {
    protected final List<decl> decls = new LinkedList<decl>();
    protected final HashMap<String, decl> context = new HashMap<String, decl>();

    public compositeDecl(String name) {
      super(name);
    }

    void copyFrom(compositeDecl o) {
      for (decl d : o.decls) {
        decl nd = d.dup();
        decls.add(nd);
        context.put(nd.name, nd);
      }
      _assert(decls.size() == context.size());
    }

    void findTemplate(int parcount, List<tdecl> r) {
      for (decl d : decls) {
        if (d instanceof tdecl && ((tdecl) d).templateParameters.size() == parcount) {
          r.add((tdecl) d);
        }
        if (d instanceof compositeDecl) {
          ((compositeDecl) d).findTemplate(parcount, r);
        }
      }
    }

    vdecl addVariableWithType(String vid, String tid) {
      tdecl t = new tdecl(tid);
      vdecl vd = new vdecl(vid, t);
      addContext(t);
      addContext(vd);
      return vd;
    }

    decl getDeclaration(String name) {
      return context.get(name);
    }

    void addContext(decl d) {
      _assert(decls.size() == context.size());
      decls.add(d);
      context.put(d.name, d);
      _assert(decls.size() == context.size());
    }

    void removeDeclration(String name) {
      decl d = context.get(name);
      context.remove(name);
      decls.remove(d);
      if (d instanceof vdecl) {
        tdecl td = ((vdecl) d).type;
        removeDeclration(td.name);
      }
      _assert(decls.size() == context.size());
    }

    void replaceDeclaration(decl dnew) {
      removeDeclration(dnew.name);
      addContext(dnew);
    }

    Set<String> getUses() {
      Set<String> s = new TreeSet<String>();
      for (decl d : decls) {
        s.addAll(d.getUses());
      }
      return s;
    }

    int getNumberofDeclarations() {
      int c = 0;
      for (decl d : decls) {
        c += d.getNumberofDeclarations();
      }
      return c;
    }
  }

  static class ndecl extends compositeDecl {
    public ndecl(String name) {
      super(name);
    }

    void show(Query q) {
      q.append("namespace %s {", name);
      for (decl d : decls) {
        d.show(q);
      }
      q.append("}");
    }

    decl dup() {
      ndecl n = new ndecl(name);
      n.copyFrom(this);
      return n;
    }

    int getNumberofDeclarations() {
      return 1 + super.getNumberofDeclarations();
    }
  }

  static class typedefdecl extends decl {
    public typedefdecl(String name) {
      super(name);
    }

    decl dup() {
      typedefdecl td = new typedefdecl(name);
      return td;
    }

    int getNumberofDeclarations() {
      return 1;
    }

    Set<String> getUses() {
      _assert(false);
      return null;
    }

    void show(Query q) {
      q.append("typedef int %s;", name);
    }
  }

  static class tdecl extends compositeDecl {
    LinkedList<String> templateParameters = new LinkedList<String>();

    public tdecl(String name) {
      super(name);
    }

    public void show(Query q) {
      if (templateParameters.size() > 0) {
        List<String> params = new LinkedList<String>();
        for (int i = 0; i < templateParameters.size(); i++) {
          params.add((String.format("%s p%d", templateParameters.get(i), i + 1)));
        }
        q.append("template<%s>", join(params, ","));
      }
      q.append("class %s {", name);
      q.append("public:");
      for (decl d : decls) {
        d.show(q);
      }
      q.append("};");
    }

    decl dup() {
      tdecl td = new tdecl(name);
      td.copyFrom(this);
      td.templateParameters.addAll(this.templateParameters);
      return td;
    }

    int getNumberofDeclarations() {
      return 1 + super.getNumberofDeclarations();
    }
  }

  static class vdecl extends decl {
    final tdecl type;

    public vdecl(String name, tdecl type) {
      super(name);
      this.type = type;
    }

    void show(Query q) {
      q.append("%s %s;", type.name, name);
    }

    decl dup() {
      vdecl vd = new vdecl(name, type);
      return vd;
    }

    Set<String> getUses() {
      TreeSet<String> r = new TreeSet<String>();
      r.addAll(type.getUses());
      return r;
    }

    int getNumberofDeclarations() {
      return 1;
    }
  }

  static class func extends decl {
    String rtype = "int";
    String argtypes = "()";

    public func(String name) {
      super(name);
    }

    public func(String name, String rtype, String argtypes) {
      super(name);
      this.rtype = rtype;
      this.argtypes = argtypes;
    }

    void show(Query q) {
      if (rtype == null) {
        q.append("%s%s;", name, argtypes);
      } else {
        q.append("%s %s%s;", rtype, name, argtypes);
      }
    }

    decl dup() {
      func f = new func(name, rtype, argtypes);
      return f;
    }

    Set<String> getUses() {
      TreeSet<String> r = new TreeSet<String>();
      if (rtype != null) {
        r.add(rtype);
      }
      if (!argtypes.equals("()")) {
        _assert(false, "not implemented");
      }
      return r;
    }

    int getNumberofDeclarations() {
      return 1;
    }
  }

  static class ErrorMessage {
    final int tokenIndex;
    final String msg;

    public ErrorMessage(int line, String msg) {
      this.tokenIndex = line;
      this.msg = msg;
    }
  }

  private final List<decl> decls = new ArrayList<decl>();
  private final Map<String, decl> context = new HashMap<String, decl>();
  final List<ErrorMessage> errors = new LinkedList<ErrorMessage>();

  final CodeType codeType;
  final List<String> tokens = new LinkedList<String>();
  final Set<String> gensyms = new TreeSet<String>();
  final Map<Integer, Integer> line2tokenIndex = new HashMap<Integer, Integer>();
  int uniqueid = 0;
  boolean evaluated = false;

  private QueryState(CodeType codeType) {
    this.codeType = codeType;
  }

  public static QueryState createEmptyQueryState(CodeType codeType) {
    QueryState qs = new QueryState(codeType);
    qs.addContext(new ndecl("std")); // std is a built-in namespace.
    return qs;
  }

  public QueryState dup() {
    QueryState q = new QueryState(codeType);
    for (decl d : decls) {
      decl nd = d.dup();
      q.decls.add(nd);
      q.context.put(nd.name, nd);
    }
    for (String t : tokens) {
      q.tokens.add(t);
    }
    for (String s : gensyms) {
      q.gensyms.add(s);
    }
    q.uniqueid = uniqueid;
    return q;
  }

  List<String> getIdentifiersNotInContext() {
    LinkedList<String> ids = new LinkedList<String>();
    Set<String> _ids = new HashSet<String>();
    for (String tok : tokens) {
      if (CPPSyntaxAnalyzer.iscppid(tok) && !_ids.contains(tok)) {
        ids.add(tok);
        _ids.add(tok);
      }
    }
    LinkedList<String> freshIds = new LinkedList<String>();
    for (String id : ids) {
      if (search(id) == null) {
        freshIds.add(id);
      }
    }
    return freshIds;
  }

  void addContext(decl d) {
    context.put(d.name, d);
    decls.add(d);
  }

  decl search(String name) {
    if (context.containsKey(name)) {
      return context.get(name);
    } else {
      for (decl d : context.values()) {
        if (d instanceof compositeDecl) {
          return search((compositeDecl) d, name);
        }
      }
      return null;
    }
  }

  static decl search(compositeDecl cd, String name) {
    if (cd.context.containsKey(name)) {
      return cd.context.get(name);
    } else {
      for (decl d : cd.context.values()) {
        if (d instanceof compositeDecl) {
          return search((compositeDecl) d, name);
        }
      }
      return null;
    }
  }

  decl lookup(String[] scope, String name) {
    if (scope.length == 0) {
      return context.get(name);
    } else {
      decl d = context.get(scope[0]);
      if (d == null)
        return d;
      else {
        for (int i = 1; i < scope.length; i++) {
          if (d instanceof compositeDecl) {
            d = ((compositeDecl) d).context.get(scope[i]);
          } else {
            return null;
          }
        }
      }
      if (d instanceof compositeDecl) {
        return ((compositeDecl) d).context.get(name);
      } else {
        return null;
      }
    }
  }

  List<tdecl> findTemplate(int parcount) {
    List<tdecl> r = new LinkedList<tdecl>();
    for (decl d : decls) {
      if (d instanceof tdecl) {
        tdecl t = (tdecl) d;
        if (t.templateParameters.size() == parcount) {
          r.add(t);
        }
      }
      if (d instanceof compositeDecl) {
        ((compositeDecl) d).findTemplate(parcount, r);
      }
    }
    return r;
  }

  List<String> findTokensBefore(String k) {
    List<String> r = new LinkedList<String>();
    String prev = null;
    for (String s : tokens) {
      if (prev != null && s.equals(k)) {
        r.add(prev);
      }
      prev = s;
    }
    return r;
  }

  void removeDeclaration(String name) {
    decl d = context.get(name);
    context.remove(name);
    decls.remove(d);
    if (d instanceof vdecl) {
      tdecl td = ((vdecl) d).type;
      context.remove(td.name);
      decls.remove(td);
    }
  }

  void replaceDeclaration(decl dnew) {
    decl dold = context.get(dnew.name);
    if (dold instanceof vdecl) {
      vdecl vd = (vdecl) dold;
      tdecl td = vd.type;
      context.remove(td.name);
      decls.remove(decls.indexOf(td));
    }
    context.remove(dold.name);
    decls.set(decls.indexOf(dold), dnew);
    context.put(dnew.name, dnew);
  }

  compositeDecl lookupScope(String[] names) {
    compositeDecl nd;
    if (context.get(names[0]) instanceof compositeDecl) {
      nd = (compositeDecl) context.get(names[0]);
    } else {
      return null;
    }
    for (int i = 1; i < names.length; i++) {
      String ns_name = names[i];
      if (nd.getDeclaration(ns_name) == null) {
        return null;
      } else if (nd.getDeclaration(ns_name) instanceof compositeDecl) {
        nd = (compositeDecl) nd.getDeclaration(ns_name);
      } else {
        return null;
      }
    }
    return nd;

  }

  tdecl enforceNestedClass(String[] names) {

    tdecl nd;
    if (context.get(names[0]) == null) {
      nd = new tdecl(names[0]);
      addContext(nd);
    } else if (context.get(names[0]) instanceof tdecl) {
      nd = (tdecl) context.get(names[0]);
    } else {
      nd = new tdecl(names[0]);
      replaceDeclaration(nd);
    }
    for (int i = 1; i < names.length; i++) {
      String ns_name = names[i];
      if (nd.getDeclaration(ns_name) == null) {
        tdecl ndparent = nd;
        nd = new tdecl(ns_name);
        ndparent.addContext(nd);
      } else if (nd.getDeclaration(ns_name) instanceof tdecl) {
        nd = (tdecl) nd.getDeclaration(ns_name);
      } else {
        tdecl ndparent = nd;
        nd = new tdecl(ns_name);
        ndparent.replaceDeclaration(nd);
      }
    }
    return nd;
  }

  ndecl enforceNameSpace(String[] names) {

    ndecl nd;
    if (context.get(names[0]) == null) {
      nd = new ndecl(names[0]);
      addContext(nd);
    } else if (context.get(names[0]) instanceof ndecl) {
      nd = (ndecl) context.get(names[0]);
    } else {
      nd = new ndecl(names[0]);
      replaceDeclaration(nd);
    }
    for (int i = 1; i < names.length; i++) {
      String ns_name = names[i];
      if (nd.getDeclaration(ns_name) == null) {
        ndecl ndparent = nd;
        nd = new ndecl(ns_name);
        ndparent.addContext(nd);
      } else if (nd.getDeclaration(ns_name) instanceof ndecl) {
        nd = (ndecl) nd.getDeclaration(ns_name);
      } else {
        ndecl ndparent = nd;
        nd = new ndecl(ns_name);
        ndparent.replaceDeclaration(nd);
      }
    }
    return nd;
  }

  boolean isDeclaredInContext(String name) {
    return context.containsKey(name);
  }

  Set<String> getDeclaredNames() {
    return context.keySet();
  }

  decl getDeclaration(String name) {
    return context.get(name);
  }

  void tellContext(Query q) {
    q.append("// Begin context.");
    for (decl d : decls) {
      if (d instanceof tdecl) {
        q.append("class %s;", d.name);
      }
    }
    for (decl d : decls) {
      d.show(q);
    }
    q.append("// End context.");
  }

  tdecl findClass(String cname) {
    String[] names = cname.split("::");
    decl d = context.get(names[0]);
    if (d instanceof compositeDecl) {
      for (int i = 1; i < names.length; i++) {
        if (((compositeDecl) d).getDeclaration(names[i]) instanceof compositeDecl) {
          d = ((compositeDecl) d).getDeclaration(names[i]);
        } else {
          _assert(false, "TBI");
        }
      }
      return (tdecl) d;
    } else {
      _assert(false, "TBI");
      return null;
    }
  }

  String genSym() {
    String genID = String.format("__id%d__", uniqueid++);
    gensyms.add(genID);
    return genID;
  }

  vdecl addVariableWithType(String id) {
    tdecl t = new tdecl(genSym());
    vdecl vd = new vdecl(id, t);
    addContext(t);
    addContext(vd);
    return vd;
  }

  int getNumberofDeclarations() {
    int c = 0;
    for (decl d : decls) {
      c += d.getNumberofDeclarations();
    }
    return c;
  }

  QueryState assertNamespace(String[] scope, String id) {
    QueryState nqs = dup();
    if (scope.length == 0) {
      nqs.addContext(new ndecl(id));
    } else {
      nqs.lookupScope(scope).addContext(new ndecl(id));
    }
    return nqs;
  }

  QueryState assertType(String[] scope, String id) {
    QueryState nqs = dup();
    if (scope.length == 0) {
      nqs.addContext(new tdecl(id));
    } else {
      compositeDecl cd = nqs.lookupScope(scope);
      cd.addContext(new tdecl(id));
    }
    return nqs;
  }

  QueryState assertVariable(String[] scope, String id) {
    QueryState nqs = dup();
    if (scope.length == 0) {
      nqs.addVariableWithType(id);
    } else {
      nqs.lookupScope(scope).addVariableWithType(id, nqs.genSym());
    }
    return nqs;
  }

  QueryState assertTemplate(String[] scope, String name) {
    QueryState nqs = dup();
    QueryState.decl d = nqs.lookup(scope, name);
    if (d == null) {
      nqs.addContext(new tdecl(name));
      return nqs;
    } else {
      if (d instanceof tdecl) {
        tdecl td = (tdecl) d;
        td.templateParameters.add("class");
        return nqs;
      } else {
        _assert(false);
        return null;
      }
    }
  }

  void resolveDependency() {
    if (decls.size() == 2) {
      decl d = decls.get(0);
      decls.set(0, decls.get(1));
      decls.set(1, d);
    } else {
      _assert(false, "TBI");
    }
  }

  void evalute() {
    try {
      _evalute();
    } catch (Exception e) {
      _assert(false, "TBI for exception handling");
    }
  }

  void _evalute() throws Exception {
    _assert(!evaluated, "QueryState cannot be evaluated more than once");
    File genertedQueryFile = File.createTempFile("query", ".cpp");
    Query query = new Query();
    tellContext(query);
    for (int i = 0; i < tokens.size(); i++) {
      String token = tokens.get(i);
      line2tokenIndex.put(query.getCurrentLineNumber(), i);
      query.append("%s", token);
    }

    PrintWriter w = new PrintWriter(new FileWriter(genertedQueryFile));
    query.write(w);
    w.close();

    if (CmdOptions.printOracleQuery()) {
      File indentedQueryFile = File.createTempFile("query_indented", ".cpp");
      indentCpp(genertedQueryFile, indentedQueryFile);
      out("[oracle query file] %s\n", genertedQueryFile.getPath());
      cat(indentedQueryFile);
      indentedQueryFile.delete();
    }

    List<String> rawMessage = runCompiler(genertedQueryFile);
    for (String line : rawMessage) {
      Matcher m = errorLinePattern.matcher(line);
      if (m.matches()) {
        int lineNumber = Integer.parseInt(m.group(2));
        String msg = m.group(4);
        if (CPPSyntaxAnalyzer.isSignificantErrorMessage(msg)) {
          ErrorMessage emsg = new ErrorMessage(line2tokenIndex.get(lineNumber), msg);
          this.errors.add(emsg);
          if (CmdOptions.printOracleQuery()) {
            out("[taking] %s\n", line);
          }
        } else {
          if (CmdOptions.printOracleQuery()) {
            out("[ignoring] %s\n", line);
          }
        }
      } else {
        if (CmdOptions.printOracleQuery()) {
          out("[ignoring] %s\n", line);
        }
      }
    }
    genertedQueryFile.delete();
    evaluated = true;
  }

  static final Pattern errorLinePattern = Pattern.compile("^(.+\\.cpp):(\\d+):(\\d+): error: (.+)$");

  public static List<String> runCompiler(File queryfile) throws Exception {
    Runtime runtime = Runtime.getRuntime();
    String[] cmd = { Util.findCompiler("g++"), "-S", "-o", "/dev/null", queryfile.getPath(), };
    if (CmdOptions.printOracleQuery()) {
      System.out.printf("[running g++] %s\n", Util.join(cmd, " "));
    }
    Process gcc = runtime.exec(cmd, new String[] { "LANG=en_US" });
    List<String> emsgs = readlines(gcc.getErrorStream());
    return emsgs;
  }

  void append(String fmt, Object... args) {
    tokens.add(String.format(fmt, args));
  }

}
