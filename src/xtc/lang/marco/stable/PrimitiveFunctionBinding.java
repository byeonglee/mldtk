package xtc.lang.marco.stable;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import xtc.lang.marco.Util;
import xtc.lang.marco.ast.CallExprAst;
import xtc.lang.marco.ast.ExprAst;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.run.McObject;
import xtc.lang.marco.run.McObject.McCodeCunit;
import xtc.lang.marco.run.McObject.McInt;
import xtc.lang.marco.run.McObject.McList;
import xtc.lang.marco.run.McObject.McNull;
import xtc.lang.marco.run.McObject.McString;
import xtc.lang.marco.run.McToken;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.FunctionType;
import xtc.lang.marco.type.ListType;
import xtc.lang.marco.type.PrimitiveType;
import xtc.lang.marco.type.Type;

public abstract class PrimitiveFunctionBinding extends FunctionName {

  private static HashMap<String, PrimitiveFunctionBinding> plist = new HashMap<String, PrimitiveFunctionBinding>();

  public abstract Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s);

  public String getEntityName() {
    return "primitive function";
  }

  abstract public McObject execute(CallExprAst ast, List<McObject> actuals);

  static abstract class SimplePrimitiveBinding extends PrimitiveFunctionBinding {
    public FunctionType resolvedType;

    SimplePrimitiveBinding(Type rtype, Type... args) {
      resolvedType = new FunctionType(rtype, args);
    }

    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      if (callExpr._exprs.length != resolvedType.formalTypes.length) {
        tc.error(callExpr, "The number of paramters must be %d.", resolvedType.formalTypes.length);
      }
      for (int i = 0; i < callExpr.exprCount(); i++) {
        ExprAst e = callExpr._exprs[i];
        if (!e.resolvedType.typeEquals(resolvedType.formalTypes[i])) {
          tc.error(e, "The expected type is %s.", resolvedType.formalTypes[i].toExpression());
        }
      }
      return resolvedType.returnType;
    }
  }

  static {
    plist.put("size", new size());
  }

  private static class size extends PrimitiveFunctionBinding {
    public Type matchType(TypeChecker tc, CallExprAst ast, Scope s) {
      if (ast._exprs.length == 1) {
        Type actualType = ast._exprs[0].resolvedType;
        if (!(actualType instanceof ListType)) {
          tc.error(ast, "The argument must have a collection type.");
        }
      } else {
        tc.error(ast, "The size function takes one argument.");
      }
      return PrimitiveType.INT;
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      _assert(actuals.size() == 1);
      McObject o = actuals.get(0);
      if (o instanceof McList) {
        return ((McList) o).size();
      } else {
        _assert(false, "TBI");
        return null;
      }
    }
  }

  static {
    plist.put("printCode", new printCode());
  }

  private static class printCode extends PrimitiveFunctionBinding {
    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      if (callExpr._exprs.length == 1) {
        ExprAst e = callExpr._exprs[0];
        if (e.resolvedType instanceof CodeType) {
          return PrimitiveType.VOID;
        } else {
          tc.error(e, "code type is expected.");
        }
      } else {
        tc.error(callExpr, "printCode takes one parameter.");
      }
      _assert(false, "unreachable");
      return null;
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCode code = (McCode) actuals.get(0);
      List<String> tokens = new LinkedList<String>();
      for (McToken t : code.tokens) {
        tokens.add(t.value);
      }
      out("%s\n", join(tokens, " "));
      return McNull.NULL;
    }
  }

  static {
    plist.put("append", new append());
  }

  private static class append extends PrimitiveFunctionBinding {
    public Type matchType(TypeChecker tc, CallExprAst ast, Scope s) {
      if (ast._exprs.length == 2) {
        Type actual1 = ast._exprs[0].resolvedType;
        if (actual1 instanceof ListType) {
          Type eExpected = ((ListType) actual1).elementType;
          Type actual2 = ast._exprs[1].resolvedType;
          if (eExpected.typeEquals(actual2)) {
          } else {
            tc.error(ast._exprs[1], "The second argument must have an element type of the first argument.");
          }
        } else {
          tc.error(ast, "The first argument must be a collection type.");
        }
      } else {
        tc.error(ast, "The append function takes two arguments.");
      }
      return PrimitiveType.VOID;
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McList m = (McList) actuals.get(0);
      McObject n = actuals.get(1);
      m.add(n);
      return null;
    }
  }

  static {
    plist.put("join_to_id", new join_to_id());
  }

  private static class join_to_id extends SimplePrimitiveBinding {
    join_to_id() {
      super(new CodeType("cpp", "id"), PrimitiveType.STRING, new ListType(new CodeType("cpp", "id")));
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McString g = (McString) actuals.get(0);
      McList l = (McList) actuals.get(1);
      LinkedList<String> ll = new LinkedList<String>();
      for (McObject o : l.l) {
        McCode c = (McCode) o;
        for (McToken t : c.tokens) {
          ll.add(t.value);
        }
      }
      String r = Util.join(ll, g.v);
      return new McCode(new McToken(ast, r));
    }
  }

  static {
    plist.put("cat_type", new cat_type());
  }

  private static class cat_type extends PrimitiveFunctionBinding {
    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      StringBuilder sb = new StringBuilder();
      for (McObject o : actuals) {
        if (o instanceof McInt) {
          sb.append(((McInt) o).v);
        } else if (o instanceof McString) {
          sb.append(((McString) o).v);
        } else {
          _assert(false, "TBI");
        }
      }
      return new McCode(new McToken(ast, sb.toString()));
    }

    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      for (ExprAst e : callExpr._exprs) {
        Type et = e.resolvedType;
        if (et.typeEquals(PrimitiveType.INT) || et.typeEquals(PrimitiveType.STRING)) {
        } else {
          _assert(false, "TBI");
        }
      }
      return new CodeType("cpp", "type");
    }
  }

  static {
    plist.put("reverse", new reverse());
  }

  static class reverse extends PrimitiveFunctionBinding {

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McList m = new McList();
      McList in = (McList) actuals.get(0);
      for (int i = (in.l.size() - 1); i >= 0; i--) {
        m.add(in.l.get(i));
      }
      return m;
    }

    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      if (callExpr._exprs.length == 1) {
        Type t = callExpr._exprs[0].resolvedType;
        if (t instanceof ListType) {
          return t;
        } else {
          tc.error(callExpr, "Expecting list type");
          return null;
        }
      } else {
        tc.error(callExpr, "Taking one parameter");
        return null;
      }
    }
  }

  static {
    plist.put("cat_id", new cat_id());
  }

  static class cat_id extends PrimitiveFunctionBinding {
    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      StringBuilder sb = new StringBuilder();
      for (McObject o : actuals) {
        if (o instanceof McInt) {
          sb.append(((McInt) o).v);
        } else if (o instanceof McString) {
          sb.append(((McString) o).v);
        } else if (o instanceof McCode) {
          _assert(((McCode) o).tokens.size() == 1);
          sb.append(((McCode) o).tokens.get(0));
        } else {
          _assert(false, "TBI");
        }
      }
      return new McCode(new McToken(ast, sb.toString()));
    }

    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      for (ExprAst e : callExpr._exprs) {
        Type et = e.resolvedType;
        if (et.typeEquals(PrimitiveType.INT) || et.typeEquals(PrimitiveType.STRING)
            || et.typeEquals(new CodeType("cpp", "id")) || et.typeEquals(new CodeType("cpp", "type"))) {
        } else {
          _assert(false, "TBI");
        }
      }
      return new CodeType("cpp", "id");
    }
  }

  static {
    plist.put("gensym", new gensym());
  }

  static class gensym extends SimplePrimitiveBinding {
    gensym() {
      super(new CodeType("cpp", "id"));
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      _assert(false, "TBI");
      return null;
    }
  }

  static {
    plist.put("split", new split());
  }

  private static class split extends SimplePrimitiveBinding {
    split() {
      super(new ListType(PrimitiveType.STRING), PrimitiveType.STRING, PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McString s = (McString) actuals.get(0);
      McString sep = (McString) actuals.get(1);
      String is = sep.v.replace(".", "\\.");
      String[] l = s.v.split(is);
      McList m = new McList();
      for (String t : l) {
        m.add(new McString(t));
      }
      return m;
    }
  }

  static {
    plist.put("pstring", new pstring());
  }

  private static class pstring extends SimplePrimitiveBinding {
    pstring() {
      super(new CodeType("cpp", "expr"), new CodeType("cpp", "id"));
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      _assert(false, "TBI");
      return null;
    }
  }

  static {
    plist.put("join", new join());
  }

  static class join extends SimplePrimitiveBinding {
    join() {
      super(PrimitiveType.STRING, new ListType(PrimitiveType.STRING), PrimitiveType.STRING);
    }

    public Type matchType(TypeChecker tc, CallExprAst callExpr, Scope s) {
      return super.matchType(tc, callExpr, s);
    }

    public McObject execute(CallExprAst a, List<McObject> actuals) {
      McList strings = (McList) actuals.get(0);
      String con = ((McString) actuals.get(1)).v;
      LinkedList<String> strs = new LinkedList<String>();
      for (McObject o : strings.l) {
        strs.add(((McString) o).v);
      }
      return new McString(Util.join(strs, con));
    }
  }

  static {
    plist.put("replace", new replace());
  }

  static class replace extends SimplePrimitiveBinding {
    replace() {
      super(PrimitiveType.STRING, PrimitiveType.STRING, PrimitiveType.STRING, PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McString s = (McString) actuals.get(0);
      McString a = (McString) actuals.get(1);
      McString b = (McString) actuals.get(2);
      return new McString(s.v.replace(a.v, b.v));
    }
  }

  static {
    plist.put("include", new include());
  }

  private static class include extends SimplePrimitiveBinding {
    include() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), new ListType(PrimitiveType.STRING));
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McList headers = (McList) actuals.get(1);
      for (McObject o : headers.l) {
        u.cppPrologue.add(String.format("#include <%s>", ((McString) o).v));
      }
      return null;
    }
  }

  static {
    plist.put("ifdef", new ifdef());
  }

  private static class ifdef extends SimplePrimitiveBinding {
    ifdef() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McString s = (McString) actuals.get(1);
      u.cppPrologue.add(String.format("#ifdef %s", s.v));
      return null;
    }
  }

  static {
    plist.put("ifndef", new ifndef());
  }

  private static class ifndef extends SimplePrimitiveBinding {
    ifndef() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McString s = (McString) actuals.get(1);
      u.cppPrologue.add(String.format("#ifndef %s", s.v));
      return null;
    }
  }

  static {
    plist.put("define", new define());
  }

  private static class define extends SimplePrimitiveBinding {
    define() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), PrimitiveType.STRING, PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McString s = (McString) actuals.get(1);
      McString d = (McString) actuals.get(2);
      u.cppPrologue.add(String.format("#define %s %s", s.v, d.v));
      return null;
    }
  }

  static {
    plist.put("undefine", new undefine());
  }

  private static class undefine extends SimplePrimitiveBinding {
    undefine() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McString s = (McString) actuals.get(1);
      u.cppEpilogue.add(String.format("#undef %s", s.v));
      return null;
    }
  }

  static {
    plist.put("endif", new endif());
  }

  private static class endif extends SimplePrimitiveBinding {
    endif() {
      super(PrimitiveType.VOID, new CodeType("cpp", "cunit"), PrimitiveType.STRING);
    }

    public McObject execute(CallExprAst ast, List<McObject> actuals) {
      McCodeCunit u = (McCodeCunit) actuals.get(0);
      McString s = (McString) actuals.get(1);
      u.cppEpilogue.add(String.format("#endif /*%s*/", s.v));
      return null;
    }
  }

  static FunctionName lookup(String name) {
    return plist.get(name);
  }

  static void init(Scope s) {
    for (String name : plist.keySet()) {
      PrimitiveFunctionBinding pfb = plist.get(name);
      s.addSymbol(name, pfb);
    }
  }
}
