package xtc.lang.marco.stable;

import static xtc.lang.marco.Util._assert;

import java.util.LinkedList;
import java.util.Stack;

import xtc.lang.marco.Util;
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
import xtc.lang.marco.ast.InfixOp;
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
import xtc.lang.marco.ast.TypeAst;
import xtc.lang.marco.ast.TypeDef;
import xtc.lang.marco.ast.UnaryExprAst;
import xtc.lang.marco.ast.UserTypeAst;
import xtc.lang.marco.ast.Visitor;
import xtc.lang.marco.ast.VoidTypeAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.FunctionType;
import xtc.lang.marco.type.ListType;
import xtc.lang.marco.type.PrimitiveType;
import xtc.lang.marco.type.TupleType;
import xtc.lang.marco.type.Type;

public class TypeChecker extends Visitor {

  final ProgramAst pst;
  Scope current;
  final Stack<Scope> scopeContext = new Stack<Scope>();
  private Type computedType;
  FuncDefinition currentFunction;

  public TypeChecker(ProgramAst pst) {
    this.pst = pst;
  }

  public static void perform(ProgramAst prog) {
    prog.accept(new TypeChecker(prog));
  }

  private Scope enter() {
    Scope parent = current;
    if (parent != null) {
      scopeContext.push(parent);
    }
    current = new Scope(parent);
    return current;
  }

  private void leave() {
    if (scopeContext.size() > 0) {
      current = scopeContext.pop();
    } else {
      assert current != null;
      current = null;
    }
  }

  protected void setComputedType(Type t) {
    assert t != null;
    computedType = t;
  }

  protected Type getComputedType() {
    return computedType;
  }

  public void visit(ProgramAst ast) {
    ast.scope = enter();
    PrimitiveFunctionBinding.init(ast.scope);
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof TypeDef) {
        a.accept(this);
      }
    }
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof FuncDefinition) {
        FuncDefinition fdef = (FuncDefinition) a;
        fdef.returnType.accept(this);
        Type rType = computedType;
        LinkedList<Type> paramTypes = new LinkedList<Type>();
        for (FormalParamAst p : fdef.formals) {
          p.accept(this);
          paramTypes.add(computedType);
        }
        fdef.resolvedType = new FunctionType(rType, paramTypes.toArray(new Type[0]));
        computedType = fdef.resolvedType;
        current.addSymbol(fdef.name._name, new UserFunctionBinding(fdef));
      } else if (a instanceof TypeDef == false) {
        a.accept(this);
      } else {
        _assert(a instanceof TypeDef, "unreachable");
      }
    }
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof FuncDefinition) {
        a.accept(this);
      }
    }
    leave();
  }

  public void visit(final ConstDeclAst ast) {
    current.addSymbol(ast.id._name, new GlobalConstant());
  }

  public void visit(TypeDef ast) {
    ast.type.accept(this);
    Type t = getComputedType();
    current.addSymbol(ast.ID._name, new TypeAlias(t));
  }

  public void visit(ExterFuncDecl ast) {
    ast.returnType.accept(this);
    Type rType = computedType;
    LinkedList<Type> paramTypes = new LinkedList<Type>();
    for (TypeAst a : ast.paramTypes) {
      a.accept(this);
      paramTypes.add(computedType);
    }
    ast.resolvedType = new FunctionType(rType, paramTypes.toArray(new Type[0]));
    computedType = ast.resolvedType;
    ExternalFunctionBinding eb = new ExternalFunctionBinding(ast);
    current.addSymbol(ast.ID._name, eb);
  }

  public void visit(ImportDecl ast) {
    _assert(false, "unreachable");
  }

  public void visit(FormalParamAst ast) {
    ast.type.accept(this);
  }

  public void visit(ListTypeAst ast) {
    ast.elementType.accept(this);
    computedType = new ListType(computedType);
  }

  public void visit(PrimitiveTypeAst ast) {
    computedType = ast.type;
  }

  public void visit(TupleTypeAst ast) {
    LinkedList<TupleType.NameTypePair> pairs = new LinkedList<TupleType.NameTypePair>();
    for (AttributeAst a : ast.attributes) {
      a.accept(this);
      pairs.add(new TupleType.NameTypePair(a.ID._name, computedType));
    }
    computedType = new TupleType(pairs.toArray(new TupleType.NameTypePair[0]));
  }

  public void visit(AttributeAst ast) {
    ast.type.accept(this);
  }

  public void visit(UserTypeAst ast) {
    SymbolInfo si = current._getSymbol(ast.id._name);
    if (si instanceof TypeAlias) {
      TypeAlias ta = (TypeAlias) si;
      computedType = ta.type;
    } else {
      error(ast, "cannot find definition of type '%s'", ast.id._name);
    }
  }

  public void visit(VoidTypeAst ast) {
    computedType = PrimitiveType.VOID;
  }

  public void visit(CodeTypeAst ast) {
    computedType = ast.codeType;
  }

  public void visit(BlockStmtAst ast) {
    ast.scope = enter();
    for (StmtAst a : ast._stmts) {
      a.accept(this);
    }
    leave();
  }

  public void visit(FuncDefinition ast) {
    currentFunction = ast;
    ast.scope = enter();
    for (FormalParamAst f : ast.formals) {
      f.type.accept(this);
      Type type = getComputedType();
      current.addSymbol(f.name._name, new LocalVariable(type));
    }

    for (StmtAst s : ast.body._stmts) {
      s.accept(this);
    }
    leave();
    currentFunction = null;
  }

  void error(StrongAst a, String format, Object... args) {
    throw new MarcoException(a, format, args);
  }

  void check(Type stype, Type expected, ExprAst n) {
    if (!stype.typeEquals(expected)) {
      error(n, "expected type %s not type %s", expected.toExpression(), stype.toExpression());
    }
  }

  public void visit(ForStmtAst ast) {
    ast.scope = enter();
    ast._type.accept(this);
    Type itype = getComputedType(); // the type of the induction variable
    current.addSymbol(ast._name._name, new LocalVariable(itype));
    if (ast._v != null) {
      current.addSymbol(ast._v._name, new LocalVariable(PrimitiveType.INT));
    }
    ast._expr.accept(this);
    Type exprType = getComputedType();
    if (exprType instanceof ListType) {
      Type itType = ((ListType) exprType).getIterationType();
      if (!itype.typeEquals(itType)) {
        error(ast._type, "Type is expected to be %s", itType.toExpression());
      }
    } else {
      error(ast._expr, "A collection type is expected, but the given type is %s", exprType.toExpression());
    }

    ast._stmt.accept(this);
    leave();
  }

  public void visit(IfStmtAst ast) {
    ast._expr.accept(this);
    Type condType = getComputedType();
    check(condType, PrimitiveType.BOOLEAN, ast._expr);
    ast._thenStmt.accept(this);
    if (ast._elseStmt != null) {
      ast._elseStmt.accept(this);
    }
  }

  public void visit(DeclStmtAst ast) {
    ast.type.accept(this);
    Type varType = getComputedType();
    LocalVariable v = new LocalVariable(varType);
    ast.id.resolvedType = varType;
    current.addSymbol(ast.id._name, v);
    if (ast.expr != null) {
      if (ast.expr instanceof ListAst && ((ListAst) ast.expr).elements.length == 0) {
        ast.expr.resolvedType = v.type;
      } else {
        Type lhsType = v.type;
        ast.expr.accept(this);
        Type rhsType = getComputedType();
        if (lhsType instanceof CodeType) {
          if (rhsType instanceof CodeType) {
            if (!lhsType.assignable(rhsType)) {
              error(ast.expr, "type '%s' cannot be assigned to type '%s'", rhsType.toExpression(),
                  lhsType.toExpression());
            }
          } else {
            if (rhsType.typeEquals(PrimitiveType.INT)) {
              // OK
            } else if (rhsType.typeEquals(PrimitiveType.STRING)) {
              // OK
            } else {
              _assert(false, "TBI");
            }
          }
        } else {
          check(rhsType, lhsType, ast.expr);
        }
      }
    }
  }

  public void visit(AssertStmt ast) {
    ast.cond.accept(this);
    Type condType = getComputedType();
    check(condType, PrimitiveType.BOOLEAN, ast.cond);
    if (ast.message != null) {
      ast.message.accept(this);
      Type msgType = getComputedType();
      check(msgType, PrimitiveType.STRING, ast.message);
    }
    if (ast.location != null) {
      _assert(false, "to be implemented");
    }
  }

  public void visit(ReturnStmt ast) {
    Type returnType = currentFunction.resolvedType.returnType;
    if (PrimitiveType.VOID.typeEquals(returnType)) {
      if (ast.expr != null) {
        error(ast, "No return value for the function %s", currentFunction.name._name);
      }
    } else {
      ast.expr.accept(this);
      check(getComputedType(), returnType, ast.expr);
    }
  }

  public void visit(AssignStmtAst ast) {
    ast._expr.accept(this);
    Type rhsType = getComputedType();
    SymbolInfo si = current.getSymbol(ast._name._name);
    if (si instanceof LocalVariable) {
      LocalVariable lv = (LocalVariable) si;
      if (ast.op == InfixOp.ASSIGN) {
        Type lhs = lv.getType();
        if (!lhs.assignable(rhsType)) {
          error(ast._expr, "type '%s' cannot be assigned to type '%s'", rhsType.toExpression(), lhs.toExpression());
        }
      } else if (ast.op == InfixOp.ASSIGN_PLUS) {
        if (lv.getType() instanceof ListType) {
          ListType lvtype = (ListType) lv.getType();
          check(lvtype.getIterationType(), rhsType, ast._expr);
        } else {
          error(ast, "sorry");
        }
      }
    } else {
      error(ast._name, "The name %s must be a local variable.", ast._name._name);
    }
  }

  public void visit(final ExprStmtAst ast) {
    ast._expr.accept(this);
  }

  public void visit(CallExprAst ast) {
    for (ExprAst e : ast._exprs) {
      e.accept(this);
    }
    String calleeName = ast._name._name;
    SymbolInfo si = current.getSymbol(calleeName);
    if (si == null) {
      error(ast, "The function '%s' is not defined", calleeName);
    }
    if (!(si instanceof FunctionName)) {
      error(ast, "The name '%s' is %s not a function.", calleeName, si.getEntityName());
    }
    FunctionName fbind = (FunctionName) si;
    ast.fbind = fbind;
    if (fbind instanceof PrimitiveFunctionBinding) {
      ast.resolvedType = ((PrimitiveFunctionBinding) fbind).matchType(this, ast, current);
    } else if (fbind instanceof UserFunctionBinding) {
      FunctionType ftype = ((UserFunctionBinding) fbind).fdef.resolvedType;
      if (ast._exprs.length != ftype.formalTypes.length) {
        error(ast, "The '%s' function takes %d arguments", calleeName, ftype.formalTypes.length);
      }
      for (int i = 0; i < ast.exprCount(); i++) {
        ExprAst e = ast.expr(i);
        Type lhs = ftype.formalTypes[i], rhs = e.resolvedType;
        if (!lhs.assignable(rhs)) {
          error(e, "type '%s' cannot be assigned to type '%s' " + "in %d parameter to the function to '%s'",
              rhs.toExpression(), lhs.toExpression(), i + 1, calleeName);
        }
      }
      ast.resolvedType = ftype.returnType;
    } else if (fbind instanceof ExternalFunctionBinding) {
      FunctionType ftype = ((ExternalFunctionBinding) fbind).efd.resolvedType;
      if (ast._exprs.length != ftype.formalTypes.length) {
        error(ast, "The '%s' function takes %d arguments", calleeName, ftype.formalTypes.length);
      }
      for (int i = 0; i < ast.exprCount(); i++) {
        ExprAst e = ast.expr(i);
        if (!e.resolvedType.typeEquals(ftype.formalTypes[i])) {
          error(e, "The expected type is %s in the '%s' function.", ftype.formalTypes[i].toExpression(), calleeName);
        }
      }
      ast.resolvedType = ftype.returnType;
    }
    setComputedType(ast.resolvedType);
  }

  public void visit(ArrayRefAst ast) {
    ast.arrayExpr.accept(this);
    Type lhsType = getComputedType();
    if (lhsType instanceof ListType) {
      ast.indexExpr.accept(this);
      Type rhsType = getComputedType();
      check(rhsType, PrimitiveType.INT, ast.indexExpr);
      setComputedType(((ListType) lhsType).elementType);
      ast.resolvedType = getComputedType();
    } else {
      error(ast, "Either list or map type is expected");
    }
  }

  public void visit(FieldRefAst ast) {
    ast.objectExpr.accept(this);
    Type rtype = getComputedType();
    if (rtype instanceof TupleType) {
      TupleType tType = (TupleType) rtype;
      Type eType = tType.getAttributeType(ast.fieldName._name);
      if (eType != null) {
        setComputedType(eType);
        ast.resolvedType = eType;
      } else {
        error(ast.fieldName, "The %s name is not member of tuple: %s", ast.fieldName._name, tType.toExpression());
      }
    } else {
      error(ast.objectExpr, "A tuple type is expected, not the \"%s\" type", rtype.toExpression());
    }
  }

  public void visit(InfixExprAst ast) {
    ast._lhsExpr.accept(this);
    Type lhsType = getComputedType();
    ast._rhsExpr.accept(this);
    Type rhsType = getComputedType();
    if (lhsType.typeEquals(rhsType)) {
      if (ast._op == InfixOp.ASSIGN) {
        setComputedType(lhsType);
        ast.resolvedType = lhsType;
      } else if ((lhsType == PrimitiveType.INT)) {
        switch (ast._op) {
        case PLUS:
        case MINUS:
        case MULT:
        case DIVIDE:
        case PERCENT:
        case BIT_AND:
        case BIT_OR:
        case RSHIFT:
        case LSHIFT:
        case ASSIGN:
        case ASSIGN_PLUS:
          setComputedType(PrimitiveType.INT);
          ast.resolvedType = PrimitiveType.INT;
          break;
        case EQUAL:
        case NOT_EQUAL:
        case GREATER:
        case LESS:
        case LESS_EQUAL:
        case GREATER_EQUAL:
          setComputedType(PrimitiveType.BOOLEAN);
          ast.resolvedType = PrimitiveType.BOOLEAN;
          break;
        case MEMBERSHIP:
        default:
          error(ast, "%s is not allowed to lhs=%s, rhs=%s", ast._op.toString(), lhsType.toExpression(),
              rhsType.toExpression());
          break;
        }
      } else if (lhsType == PrimitiveType.BOOLEAN) {
        switch (ast._op) {
        case LOGICAL_AND:
        case LOGICAL_OR:
          setComputedType(PrimitiveType.BOOLEAN);
          ast.resolvedType = PrimitiveType.BOOLEAN;
          break;
        default:
          error(ast, "The %s is not a boolean operator.", ast._op.toString());
          break;
        }
      } else if (lhsType == PrimitiveType.STRING) {
        switch (ast._op) {
        case PLUS:
        case ASSIGN_PLUS:
          setComputedType(PrimitiveType.STRING);
          ast.resolvedType = PrimitiveType.STRING;
          break;
        case EQUAL:
        case NOT_EQUAL:
          setComputedType(PrimitiveType.BOOLEAN);
          ast.resolvedType = PrimitiveType.BOOLEAN;
          break;
        default:
          error(ast, "%s is not allowed to lhs=%s, rhs=%s", ast._op.toString(), lhsType.toExpression(),
              rhsType.toExpression());
          break;
        }
      } else if (lhsType instanceof CodeType) {
        switch (ast._op) {
        case ASSIGN:
        case ASSIGN_PLUS:
          setComputedType(lhsType);
          ast.resolvedType = lhsType;
          break;
        case EQUAL:
        case NOT_EQUAL:
          setComputedType(PrimitiveType.BOOLEAN);
          ast.resolvedType = PrimitiveType.BOOLEAN;
          break;
        default:
          error(ast, "The %s is not a code operator.", ast._op.toString());
          break;
        }
      } else {
        error(ast, "not implemented: op=%s, lhs=rhs=%s", ast._op.toString(), lhsType.toExpression());
      }
    } else if (ast._op == InfixOp.MEMBERSHIP) {
      if (rhsType instanceof ListType) {
        Type elemType = ((ListType) rhsType).getIterationType();
        if (lhsType.typeEquals(elemType)) {
          setComputedType(PrimitiveType.BOOLEAN);
          ast.resolvedType = PrimitiveType.BOOLEAN;
        } else {
          error(ast._lhsExpr, "LHS must be %s type", elemType);
        }
      } else {
        error(ast._rhsExpr, "The RHS must have collection type");
      }
    } else if (lhsType instanceof CodeType && rhsType instanceof CodeType) {
      switch (ast._op) {
      case PLUS:
      case ASSIGN_PLUS:
        // if (lhsType == CodeType.CUNIT && rhsType == CodeType.DECL) {
        // setComputedType(CodeType.CUNIT);
        // ast.resolvedType = CodeType.CUNIT;
        // } else {
        error(ast, "Code appending is not allowed where lhs=%s and rhs=%s", lhsType.toExpression(),
            rhsType.toExpression());
        // }
        break;
      default:
        error(ast, "The %s is not a code operator.", ast._op.toString());
        break;
      }
    } else {
      error(ast, "not implemented: op=%s, lhs=%s, rhs=%s", ast._op.toString(), lhsType.toExpression(),
          rhsType.toExpression());
    }
  }

  public void visit(UnaryExprAst ast) {
    ast.operand.accept(this);
    Type t = getComputedType();
    switch (ast.op) {
    case NOT:
      check(t, PrimitiveType.BOOLEAN, ast.operand);
      setComputedType(PrimitiveType.BOOLEAN);
      ast.resolvedType = PrimitiveType.BOOLEAN;
      break;
    default:
      Util._assert(false, "Unreachable");
      break;
    }
  }

  public void visit(ListAst ast) {
    Type elemType = null;
    for (ExprAst e : ast.elements) {
      e.accept(this);
      Type curType = getComputedType();
      if (elemType == null) {
        elemType = curType;
      } else {
        if (elemType.typeEquals(curType)) {
        } else {
          error(e, "The elements of a list must have the same type.");
        }
      }
    }
    if (elemType == null) {
      error(ast, "unreachable");
    } else {
      setComputedType(new ListType(elemType));
      ast.resolvedType = new ListType(elemType);
    }
  }

  public void visit(ListForAst ast) {
    ast.scope = enter();
    ast.type.accept(this);
    current.addSymbol(ast.ID._name, new LocalVariable(getComputedType()));
    ast.from.accept(this);
    Type fromType = getComputedType();
    if (fromType instanceof ListType) {
      if (ast.cond != null) {
        ast.cond.accept(this);
        check(getComputedType(), PrimitiveType.BOOLEAN, ast.cond);
      }
      ast.select.accept(this);
      setComputedType(new ListType(getComputedType()));
      ast.resolvedType = new ListType(getComputedType());
    } else {
      error(ast.from, "A collection type is expected.");
    }
    leave();
  }

  public void visit(StringLitAst ast) {
    setComputedType(PrimitiveType.STRING);
    ast.resolvedType = PrimitiveType.STRING;
  }

  public void visit(NameAst ast) {
    SymbolInfo s = current.getSymbol(ast._name);
    if (s instanceof LocalVariable) {
      setComputedType(((LocalVariable) s).type);
      ast.resolvedType = ((LocalVariable) s).type;
    } else if (s instanceof GlobalConstant) {
      setComputedType(((GlobalConstant) s).getType());
      ast.resolvedType = ((GlobalConstant) s).getType();
    } else {
      error(ast, "undefined name: %s", ast._name);
    }
    Util._assert(ast.resolvedType != null, "err");
  }

  public void visit(NumAst ast) {
    setComputedType(PrimitiveType.INT);
    ast.resolvedType = PrimitiveType.INT;
  }

  public void visit(BoolLitAst ast) {
    setComputedType(PrimitiveType.BOOLEAN);
    ast.resolvedType = PrimitiveType.BOOLEAN;
  }

  public void visit(Fragment ast) {
    for (FragmentElement e : ast.elements) {
      if (e instanceof Blank) {
        Blank b = (Blank) e;
        b.accept(this);
      }
    }
    setComputedType(ast.resolvedType);
    ast.resolvedType = ast.resolvedType;
  }

  public void visit(Blank ast) {
    ast.expr.accept(this);
    Type t = getComputedType();
    if (t instanceof CodeType) {

    } else if (PrimitiveType.STRING.equals(t)) {

    } else if (PrimitiveType.INT.equals(t)) {

    } else if (t instanceof ListType) {
      Type etype = ((ListType) t).elementType;
      if (etype instanceof CodeType) {

      } else {
        error(ast.expr, "unexpected type: %s", t.toExpression());
      }
    } else {
      error(ast.expr, "unexpected type: %s", t.toExpression());
    }
    if (ast.expr.resolvedType == null) {
      error(ast.expr, "null type");
    }
    Util._assert(ast.expr.resolvedType != null, "err");
  }

  public void visit(ObjectId ast) {
    Util._assert(false, "Unreachable");
  }

  public void visit(ObjectToken ast) {
    Util._assert(false, "Unreachable");
  }

  protected void fail(StrongAst a, String fmt, Object... args) {
    Util.out("%s:%d:%d:" + fmt + "\n", a.sourceFile, a._line, a._column, args);
    new Throwable().printStackTrace();
    System.exit(1);
  }

  public void visit(InteractiveAst ast) {
  }
}
