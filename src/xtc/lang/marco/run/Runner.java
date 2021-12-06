package xtc.lang.marco.run;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.cat;
import static xtc.lang.marco.Util.here;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Stack;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.analysis.oracle.Oracle;
import xtc.lang.marco.ast.ArrayRefAst;
import xtc.lang.marco.ast.AssertStmt;
import xtc.lang.marco.ast.AssignStmtAst;
import xtc.lang.marco.ast.AttributeAst;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.BlockStmtAst;
import xtc.lang.marco.ast.BoolLitAst;
import xtc.lang.marco.ast.CallExprAst;
import xtc.lang.marco.ast.CodeTypeAst;
import xtc.lang.marco.ast.ConstDeclAst;
import xtc.lang.marco.ast.DeclStmtAst;
import xtc.lang.marco.ast.ExprAst;
import xtc.lang.marco.ast.ExprStmtAst;
import xtc.lang.marco.ast.ExterFuncDecl;
import xtc.lang.marco.ast.FieldRefAst;
import xtc.lang.marco.ast.ForStmtAst;
import xtc.lang.marco.ast.FormalParamAst;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentElement;
import xtc.lang.marco.ast.FuncDefinition;
import xtc.lang.marco.ast.IfStmtAst;
import xtc.lang.marco.ast.ImportDecl;
import xtc.lang.marco.ast.InfixExprAst;
import xtc.lang.marco.ast.InteractiveAst;
import xtc.lang.marco.ast.ListAst;
import xtc.lang.marco.ast.ListForAst;
import xtc.lang.marco.ast.ListTypeAst;
import xtc.lang.marco.ast.NameAst;
import xtc.lang.marco.ast.NumAst;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;
import xtc.lang.marco.ast.PrimitiveTypeAst;
import xtc.lang.marco.ast.ProgramAst;
import xtc.lang.marco.ast.ReturnStmt;
import xtc.lang.marco.ast.StmtAst;
import xtc.lang.marco.ast.StringLitAst;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.ast.TopLevelAst;
import xtc.lang.marco.ast.TupleTypeAst;
import xtc.lang.marco.ast.TypeDef;
import xtc.lang.marco.ast.UnaryExprAst;
import xtc.lang.marco.ast.UserTypeAst;
import xtc.lang.marco.ast.Visitor;
import xtc.lang.marco.ast.VoidTypeAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.modules.MLib;
import xtc.lang.marco.run.McObject.McBoolean;
import xtc.lang.marco.run.McObject.McCodeCunit;
import xtc.lang.marco.run.McObject.McInt;
import xtc.lang.marco.run.McObject.McList;
import xtc.lang.marco.run.McObject.McNull;
import xtc.lang.marco.run.McObject.McString;
import xtc.lang.marco.run.McObject.McTuple;
import xtc.lang.marco.stable.ExternalFunctionBinding;
import xtc.lang.marco.stable.FunctionName;
import xtc.lang.marco.stable.PrimitiveFunctionBinding;
import xtc.lang.marco.stable.UserFunctionBinding;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.FunctionType;
import xtc.lang.marco.type.ListType;
import xtc.lang.marco.type.PrimitiveType;

@SuppressWarnings("serial")
class ReturnException extends RuntimeException {
  final McObject returnValue;

  public ReturnException() {
    returnValue = null;
  }

  public ReturnException(McObject returnValue) {
    this.returnValue = returnValue;
  }
}

public class Runner extends Visitor {

  static class StackFrame {
    final HashMap<String, McObject> vars = new HashMap<String, McObject>();

    public StackFrame() {
    }

    void add(String lname, McObject v) {
      vars.put(lname, v);
    }

    void set(String lname, McObject v) {
      vars.put(lname, v);
    }

    McObject _lookup(String lname) {
      return vars.get(lname);
    }

    void remove(String lname) {
      vars.remove(lname);
    }
  }

  // final ProgramAst prog;
  final HashMap<String, FuncDefinition> funcs = new HashMap<String, FuncDefinition>();

  final Stack<StackFrame> runtimeStack = new Stack<StackFrame>();
  McObject exprValue;

  public Runner() {
  }

  public void addFunction(FuncDefinition fdef) {
    String fname = fdef.name._name;
    _assert(!funcs.containsKey(fname));
    funcs.put(fname, fdef);
  }

  McObject lookup(String lname) {
    McObject o = curEnv()._lookup(lname);
    if (o == null) {
      o = runtimeStack.get(0)._lookup(lname); /* global constants */
    }
    return o;
  }

  void debug(StrongAst a) {
  }

  public void enter() {
    runtimeStack.push(new StackFrame());
  }

  public void leave() {
    runtimeStack.pop();
  }

  StackFrame curEnv() {
    return runtimeStack.peek();
  }

  public void run(ProgramAst ast, McList margs) {
    enter();
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof ConstDeclAst) {
        ConstDeclAst c = (ConstDeclAst) a;
        curEnv().add(c.id._name, new McInt(c.value._val));
      } else if (a instanceof FuncDefinition) {
        FuncDefinition fdef = (FuncDefinition) a;
        addFunction(fdef);
      }
    }

    FuncDefinition fmain = funcs.get("main");
    ensureCorrectMainSignature(fmain);
    enter();
    curEnv().add(fmain.formals[0].name._name, margs);
    fmain.accept(this);
    leave();

    leave();
  }

  public void visit(InteractiveAst ast) {
    for (StmtAst s : ast.s) {
      s.accept(this);
    }
  }

  public void visit(BlockStmtAst ast) {
    for (StmtAst s : ast._stmts) {
      s.accept(this);
    }
  }

  public void visit(BoolLitAst ast) {
    exprValue = ast._val ? McBoolean.TRUE : McBoolean.FALSE;
  }

  public void visit(CallExprAst ast) {
    List<McObject> actuals = new LinkedList<McObject>();
    for (ExprAst e : ast._exprs) {
      e.accept(this);
      _assert(exprValue != null);
      actuals.add(exprValue);
      exprValue = null;
    }

    FunctionName fbind = ast.fbind;
    if (fbind instanceof ExternalFunctionBinding) {
      exprValue = dispatchExternal((ExternalFunctionBinding) fbind, actuals);
    } else if (fbind instanceof UserFunctionBinding) {
      UserFunctionBinding ubind = (UserFunctionBinding) fbind;
      FuncDefinition fdef = ubind.fdef;
      enter();
      for (int i = 0; i < fdef.formals.length; i++) {
        FormalParamAst fram = fdef.formals[i];
        McObject a = actuals.get(i);
        String flname = fram.name._name;
        curEnv().add(flname, a);
      }
      fdef.accept(this);
      leave();
    } else if (fbind instanceof PrimitiveFunctionBinding) {
      PrimitiveFunctionBinding pbind = (PrimitiveFunctionBinding) fbind;
      exprValue = pbind.execute(ast, actuals);
    } else {
      throw new MarcoException(ast, "The function %s is not defined.", ast._name._name);
    }
  }

  private McObject dispatchExternal(ExternalFunctionBinding ebind, List<McObject> actuals) {
    try {
      ExterFuncDecl decl = ebind.efd;
      String fname = decl.ID._name;
      String sfile = decl.sourceFile;
      String mname = sfile.substring(sfile.lastIndexOf('/') + 1, sfile.lastIndexOf('.'));
      String cnameOfExtMod = MLib.class.getPackage().getName() + "." + mname;
      Class<?> extCls = Class.forName(cnameOfExtMod);
      boolean found = false;
      for (Method m : extCls.getDeclaredMethods()) {
        if (m.getName().equals(fname)) {
          found = true;
          Object r = m.invoke(null, actuals.toArray(new Object[0]));
          if (ebind.efd.resolvedType.returnType == PrimitiveType.VOID) {
            return null;
          } else {
            if (r == null) {
              _assert(false, "TBI for handling Marco/Java type error");
            } else if (r instanceof McObject) {
              return (McObject) r;
            } else {
              _assert(false, "unreachable");
            }
          }
          break;
        }
      }
      _assert(found, "external function not found %s", fname);
    } catch (Exception e) {
      e.printStackTrace();
      _assert(false, "TBI");
    }
    _assert(false, "TBI");
    return null;
  }

  public void visit(Fragment ast) {
    LinkedList<McToken> tokens = new LinkedList<McToken>();
    if (CmdOptions.printBlankExpansion()) {
      if (ast.getBlanks().size() > 0) {
        out("%s:%s:%s: Evaluating a fragment containing blanks.\n", ast.sourceFile, ast._line, ast._column);
        cat(ast.sourceFile, ast._line, ast.endLine);
      }
    }
    for (FragmentElement e : ast.elements) {
      if (e instanceof ObjectToken) {
        tokens.add(new McToken((ObjectToken) e));
      } else if (e instanceof ObjectId) {
        tokens.add(new McToken((ObjectId) e));
      } else if (e instanceof Blank) {
        Blank b = (Blank) e;
        b.accept(this);
        _assert(exprValue instanceof McCode);
        McCode c = (McCode) exprValue;

        if (CmdOptions.printBlankExpansion()) {
          out("%s:%d:%d: A blank was expanded.\n", e.sourceFile, e._line, e._column);
          out("  open fragment: %s\n", join(c.tokens, " "));
        }

        // Check hygienic expansion.
        if (!CmdOptions.hasDisableDynamicHygieneChecking()) {
          Set<String> freeNames;
          try {
            freeNames = Oracle.getFreeNames(b, (CodeType) b.expr.resolvedType, c);
          } catch (Exception ex) {
            throw new MarcoException(b.expr, "failed in getting free names");
          }
          if (CmdOptions.printBlankExpansion()) {
            out("  free names: %s\n", join(freeNames, ", "));
          }

          try {
            for (String fname : freeNames) {
              McToken fv = null;
              for (McToken t : c.tokens) {
                if (t.value.equals(fname)) {
                  fv = t;
                  break;
                }
              }
              String freeName = fv.value;
              if (!ast.isIntentionalCapture(freeName) && Oracle.isCapture(ast, b, freeName)) {
                out("%s:%d:%d: un-hygienic expansion error due to accidental capture of \"%s\"\n", b.sourceFile,
                    b._line, b._column, freeName);
                cat(ast.sourceFile, ast._line, ast.endLine);
                out("The expanded blank is here: %s\n", join(c.tokens, " "));
                out("%s:%d:%d: Here is the origin.\n", fv.sourceFile, fv.line, fv.column);
                cat(fv.sourceFile, fv.line, fv.line);
                out("\n");
                System.exit(1);
              }
            }
          } catch (Throwable t) {
            throw new MarcoException(b, "failed in analyzing captured names");
          }
        }
        for (McToken s : c.tokens) {
          tokens.add(s);
        }
      } else {
        _assert(false, "TBI");
      }
    }
    CodeType ct = (CodeType) ast.resolvedType;
    if (ct.lang.equals("cpp") && ct.phrase.equals("cunit")) {
      exprValue = new McCodeCunit(tokens);
    } else {
      exprValue = new McCode(tokens);
    }
  }

  public void visit(Blank ast) {
    ast.expr.accept(this);
    if (exprValue instanceof McCode) {
    } else if (exprValue instanceof McList) {
      McList ml = (McList) exprValue;
      LinkedList<McToken> tks = new LinkedList<McToken>();
      for (int i = 0; i < ml.l.size(); i++) {
        McCode oc = (McCode) ml.l.get(i);
        tks.addAll(oc.tokens);
        if ((i != (ml.l.size() - 1))) {
          CodeType etype = (CodeType) ((ListType) ast.expr.resolvedType).getIterationType();
          if (etype.phrase.equals("expr")) {
            tks.add(new McToken(here(), ","));
          } else if (etype.phrase.equals("stmt")) {
            tks.add(new McToken(here(), ";"));
          } else if (etype.phrase.equals("fdef")) {
          } else {
            _assert(false, "unreachable");
          }
        }
      }
      exprValue = new McCode(tks);
    } else {
      _assert(false, "unreachable");
    }
  }

  public void visit(ForStmtAst ast) {
    ast._expr.accept(this);
    _assert(exprValue instanceof McList, "%s must be McList", exprValue);
    McList s = (McList) exprValue;
    _assert(lookup(ast._name._name) == null, "TBI");
    curEnv().add(ast._name._name, McNull.NULL);
    _assert(ast._v == null, "TBI");
    for (McObject o : s.l) {
      curEnv().set(ast._name._name, o);
      ast._stmt.accept(this);
    }
    curEnv().remove(ast._name._name);
  }

  public void visit(FormalParamAst ast) {
    _assert(false, "TBI");
  }

  public void visit(FuncDefinition ast) {
    try {
      ast.body.accept(this);
    } catch (ReturnException e) {
      if (e.returnValue != null) {
        exprValue = e.returnValue;
      }
    }
  }

  public void visit(NameAst ast) {
    String lname = ast._name;
    exprValue = lookup(lname);
    _assert(exprValue != null);
  }

  public void visit(IfStmtAst ast) {
    ast._expr.accept(this);
    _assert(exprValue != null);
    McBoolean cond = (McBoolean) exprValue;
    if (cond.v) {
      ast._thenStmt.accept(this);
    } else {
      if (ast._elseStmt != null) {
        ast._elseStmt.accept(this);
      }
    }
  }

  public void visit(InfixExprAst ast) {
    ast._lhsExpr.accept(this);
    McObject lhsv = exprValue;
    ast._rhsExpr.accept(this);
    McObject rhsv = exprValue;
    switch (ast._op) {
    case EQUAL: {
      exprValue = lhsv.equals(rhsv) ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case NOT_EQUAL: {
      exprValue = !lhsv.equals(rhsv) ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case MEMBERSHIP: {
      if (rhsv instanceof McList) {
        exprValue = ((McList) rhsv).contains(lhsv) ? McBoolean.TRUE : McBoolean.FALSE;
      } else {
        _assert(false, "TBI");
      }
      break;
    }
    case GREATER: {
      _assert(lhsv instanceof McInt);
      _assert(rhsv instanceof McInt);
      exprValue = ((McInt) lhsv).v > ((McInt) rhsv).v ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case LESS: {
      _assert(lhsv instanceof McInt);
      _assert(rhsv instanceof McInt);
      exprValue = ((McInt) lhsv).v < ((McInt) rhsv).v ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case LOGICAL_OR: {
      _assert(lhsv instanceof McBoolean);
      _assert(rhsv instanceof McBoolean);
      exprValue = ((McBoolean) lhsv).v || ((McBoolean) rhsv).v ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case LOGICAL_AND: {
      _assert(lhsv instanceof McBoolean);
      _assert(rhsv instanceof McBoolean);
      exprValue = ((McBoolean) lhsv).v && ((McBoolean) rhsv).v ? McBoolean.TRUE : McBoolean.FALSE;
      break;
    }
    case PLUS: {
      if (lhsv instanceof McInt) {
        _assert(lhsv instanceof McInt);
        _assert(rhsv instanceof McInt);
        exprValue = new McInt(((McInt) lhsv).v + ((McInt) rhsv).v);
      } else if (lhsv instanceof McString) {
        _assert(lhsv instanceof McString);
        _assert(rhsv instanceof McString);
        exprValue = new McString(((McString) lhsv).v + ((McString) rhsv).v);
      }
      break;
    }
    case MULT: {
      if (lhsv instanceof McInt) {
        _assert(rhsv instanceof McInt);
        exprValue = new McInt(((McInt) lhsv).v * ((McInt) rhsv).v);
      } else {
        _assert(false, "TBI");
      }
      break;
    }
    default:
      _assert(false, "TBI");
      break;
    }
  }

  public void visit(ObjectToken ast) {
    _assert(false, "TBI");
  }

  static void ensureCorrectMainSignature(FuncDefinition f) {
    FunctionType ftype = f.resolvedType;
    if (!PrimitiveType.VOID.typeEquals(ftype.returnType)) {
      throw new MarcoException(f, "The \"main\" function must have return type void.");
    }
    if (ftype.formalTypes.length != 1 || !ftype.formalTypes[0].typeEquals(new ListType(PrimitiveType.STRING))) {
      throw new MarcoException(f, "The \"main\" function must take \"list<string>\" parameter only.");
    }
  }

  public void visit(ProgramAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(StringLitAst ast) {
    exprValue = new McString(ast._val);
  }

  public void visit(NumAst ast) {
    exprValue = new McInt(ast._val);
  }

  public void visit(ReturnStmt ast) {
    if (ast.expr != null) {
      ast.expr.accept(this);
      _assert(exprValue instanceof McObject);
      throw new ReturnException((McObject) exprValue);
    } else {
      throw new ReturnException();
    }
  }

  public void visit(ListTypeAst ast) {
    _assert(false, "TBI");

  }

  public void visit(DeclStmtAst ast) {
    String vname = ast.id._name;
    // _assert(lookup(vname) == null, "TBI for shadowed local variables.");
    if (ast.expr == null) {
      exprValue = McNull.NULL;
      curEnv().add(vname, exprValue);
    } else {
      ast.expr.accept(this);
      _assert(exprValue != null);
      _assert(ast.id.resolvedType != null);
      if (ast.id.resolvedType instanceof CodeType) {
        if (!(exprValue instanceof McCode)) {
          if (exprValue instanceof McInt) {
            String s = Integer.toString(((McInt) exprValue).v);
            exprValue = new McCode(new McToken(here(), s));
          } else {
            _assert(false, "TBI");
          }
        }
      }
      curEnv().add(vname, exprValue);
    }
  }

  public void visit(AssignStmtAst ast) {
    ast._expr.accept(this);
    _assert(exprValue != null);
    curEnv().add(ast._name._name, exprValue);
    exprValue = null;
  }

  public void visit(ExprStmtAst ast) {
    ast._expr.accept(this);
  }

  public void visit(ObjectId ast) {
    _assert(false, "TBI");
  }

  public void visit(ListAst ast) {
    LinkedList<McObject> exprs = new LinkedList<McObject>();
    for (ExprAst e : ast.elements) {
      e.accept(this);
      _assert(exprValue != null);
      exprs.add(exprValue);
      exprValue = null;
    }
    McList m = new McList();
    for (McObject o : exprs) {
      m.add(o);
    }
    exprValue = m;
  }

  public void visit(UnaryExprAst ast) {
    switch (ast.op) {
    case NOT:
      ast.operand.accept(this);
      _assert(exprValue instanceof McBoolean);
      McBoolean b = (McBoolean) exprValue;
      exprValue = b.v ? McBoolean.FALSE : McBoolean.TRUE;
      break;
    default:
      _assert(false, "TBI");
      break;
    }
  }

  public void visit(UserTypeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(FieldRefAst ast) {
    ast.objectExpr.accept(this);
    _assert(exprValue instanceof McTuple);
    McTuple ov = (McTuple) exprValue;
    exprValue = ov.get(ast.fieldName._name);
    _assert(exprValue != null, "NPE");
  }

  public void visit(ArrayRefAst ast) {

    ast.arrayExpr.accept(this);
    _assert(exprValue != null);
    McList aro = (McList) exprValue;
    exprValue = null;

    ast.indexExpr.accept(this);
    McInt ido = (McInt) exprValue;
    exprValue = null;

    if (ido.v >= aro.l.size()) {
      out("%s:%d:%d: an error of ArrayOutOfBound\n", ast.sourceFile, ast._line, ast._column);
      cat(ast.sourceFile, ast._line, ast._line);
      System.exit(1);
    }

    exprValue = aro.get(ido);
  }

  public void visit(ListForAst ast) {
    boolean saveInductionVariable = lookup(ast.ID._name) != null;
    McObject savedValue = saveInductionVariable ? lookup(ast.ID._name) : null;
    curEnv().add(ast.ID._name, McNull.NULL);
    ast.from.accept(this);
    _assert(exprValue instanceof McList);
    McList m = new McList();
    McList from = (McList) exprValue;
    for (McObject e : from.l) {
      curEnv().set(ast.ID._name, e);
      boolean tba;
      if (ast.cond == null) {
        tba = true;
      } else {
        ast.cond.accept(this);
        _assert(exprValue instanceof McBoolean);
        tba = ((McBoolean) exprValue).v;
      }
      if (tba) {
        ast.select.accept(this);
        _assert(exprValue instanceof McObject);
        m.add(exprValue);
      }
    }
    if (saveInductionVariable) {
      curEnv().set(ast.ID._name, savedValue);
    }
    exprValue = m;
  }

  public void visit(AssertStmt ast) {
    ast.cond.accept(this);
    McBoolean c = (McBoolean) exprValue;
    if (!c.v) {
      if (ast.message != null) {
        ast.message.accept(this);
        McString msg = (McString) exprValue;
        _assert(false, "Assertion failure: %s", msg.v);
      } else {
        _assert(false, "Assertion failure");
      }
    }
  }

  public void visit(VoidTypeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(CodeTypeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(ExterFuncDecl ast) {
    _assert(false, "TBI");
  }

  public void visit(ImportDecl ast) {
    _assert(false, "TBI");
  }

  public void visit(TupleTypeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(TypeDef ast) {
    _assert(false, "TBI");
  }

  public void visit(AttributeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(PrimitiveTypeAst ast) {
    _assert(false, "TBI");
  }

  public void visit(final ConstDeclAst ast) {
    curEnv().add(ast.id._name, new McInt(ast.value._val));
  }
}
