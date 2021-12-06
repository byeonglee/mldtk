package xtc.lang.marco.analysis.hygiene;

import static xtc.lang.marco.Util._assert;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Stack;

import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.FunctionSummary;
import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.Literal;
import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.Node;
import xtc.lang.marco.analysis.hygiene.DataFlowAnalysis.Variable;
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
import xtc.lang.marco.ast.TopLevelAst;
import xtc.lang.marco.ast.TupleTypeAst;
import xtc.lang.marco.ast.TypeDef;
import xtc.lang.marco.ast.UnaryExprAst;
import xtc.lang.marco.ast.UserTypeAst;
import xtc.lang.marco.ast.Visitor;
import xtc.lang.marco.ast.VoidTypeAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.stable.ExternalFunctionBinding;
import xtc.lang.marco.stable.PrimitiveFunctionBinding;
import xtc.lang.marco.type.CodeType;
import xtc.lang.marco.type.ListType;
import xtc.lang.marco.type.Type;

public class DFGBuilder extends Visitor {

  static class ScopeSummary {
    final HashMap<String, Node> tlb = new HashMap<String, Node>();

    void put(String name, Node v) {
      tlb.put(name, v);
    }
  }

  public final DataFlowAnalysis df = new DataFlowAnalysis();
  final Stack<ScopeSummary> scopes = new Stack<ScopeSummary>();

  final ProgramAst p;
  FuncDefinition func;
  Node evaluatedVar;

  public DFGBuilder(ProgramAst a) {
    p = a;
  }

  Node looupName(String name) {
    for (int i = scopes.size() - 1; i >= 0; i--) {
      ScopeSummary s = scopes.get(i);
      Node v = s.tlb.get(name);
      if (v != null) {
        return v;
      }
    }
    return null;
  }

  private ScopeSummary scope() {
    return scopes.peek();
  }

  private void enterScope() {
    scopes.push(new ScopeSummary());
  }

  private void leaveScope() {
    scopes.pop();
  }

  public void visit(ProgramAst ast) {
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof FuncDefinition) {
        FuncDefinition fdef = (FuncDefinition) a;
        df.createFuncSummary(fdef);
      }
    }
    for (TopLevelAst a : ast.funcDefs) {
      if (a instanceof FuncDefinition) {
        FuncDefinition fdef = (FuncDefinition) a;
        fdef.accept(this);
      }
    }
  }

  public void visit(FuncDefinition ast) {
    func = ast;
    enterScope();
    for (int i = 0; i < ast.formals.length; i++) {
      String n = ast.formals[i].name._name;
      Variable v = df.lookup(func.name._name).params.get(i);
      scope().put(n, v);
    }
    for (StmtAst s : ast.body._stmts) {
      s.accept(this);
    }
    leaveScope();
  }

  public void visit(InteractiveAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(Blank ast) {
    ast.expr.accept(this);
  }

  public void visit(BlockStmtAst ast) {
    enterScope();
    for (StmtAst s : ast._stmts) {
      s.accept(this);
    }
    leaveScope();
  }

  public void visit(BoolLitAst ast) {
    evaluatedVar = df.createEmptyLiteral(func, ast);
  }

  public void visit(CallExprAst ast) {
    if (ast.fbind instanceof PrimitiveFunctionBinding) {
      // Give up precise results from calling primitive functions.
      evaluatedVar = df.createEmptyLiteral(func, ast);
    } else if (ast.fbind instanceof ExternalFunctionBinding) {
      // Give up precise results from calling external functions.
      evaluatedVar = df.createEmptyLiteral(func, ast);
    } else {
      FunctionSummary recvFunc = df.lookup(ast._name._name);
      for (int i = 0; i < ast._exprs.length; i++) {
        ExprAst e = ast._exprs[i];
        e.accept(this);
        _assert(evaluatedVar != null, "unexpected null");
        df.addConstraint(ast, evaluatedVar, recvFunc.params.get(i));
      }
      Variable resultVar = df.createVariable(func, ast);
      df.addConstraint(ast, recvFunc.ret, resultVar);
      evaluatedVar = resultVar;
    }
  }

  public void visit(Fragment ast) {
    Set<String> freeOccurances;
    try {
      freeOccurances = Oracle.getFreeNames(ast);
    } catch (Exception e) {
      throw new MarcoException(e, ast, "failed in getting free names");
    }
    LinkedList<String> freeNames = new LinkedList<String>();
    for (String fname : freeOccurances) {
      freeNames.add(fname);
    }
    Literal flit = df.createLiteral(func, ast, freeNames.toArray(new String[0]));
    Variable fvar = df.createVariable(func, ast);
    df.addConstraint(ast, flit, fvar);
    for (Blank b : ast.getBlanks()) {
      b.accept(this);
      df.addConstraint(b, evaluatedVar, fvar, b, ast);
    }
    evaluatedVar = fvar;
  }

  public void visit(ForStmtAst ast) {
    ast._expr.accept(this);
    Node exprVar = evaluatedVar;
    _assert(exprVar != null);
    enterScope();

    // induction variable
    Variable indexVar = df.createVariable(func, ast._name);
    df.addConstraint(ast, exprVar, indexVar);
    scope().put(ast._name._name, indexVar);

    // aux variable
    if (ast._v != null) {
      Node auxVar = df.createEmptyLiteral(func, ast._v);
      scope().put(ast._v._name, auxVar);
      ast._stmt.accept(this);
    }
    leaveScope();
  }

  public void visit(FormalParamAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(NameAst ast) {
    Node v = looupName(ast._name);
    _assert(v != null, "failed in finding value node for name %s", ast._name);
    evaluatedVar = v;
  }

  public void visit(IfStmtAst ast) {
    // A predicate expression never updates any variables. It never contributes
    // to any generated code.
    ast._thenStmt.accept(this);
    if (ast._elseStmt != null) {
      ast._elseStmt.accept(this);
    }
  }

  public void visit(InfixExprAst ast) {
    ast._lhsExpr.accept(this);
    ast._rhsExpr.accept(this);
    _assert(ast._lhsExpr.resolvedType instanceof CodeType == false);
    _assert(ast._rhsExpr.resolvedType instanceof CodeType == false);
  }

  public void visit(ObjectToken ast) {
    _assert(false, "unreachable");
  }

  public void visit(ObjectId ast) {
    _assert(false, "unreachable");
  }

  public void visit(StringLitAst ast) {
    evaluatedVar = df.createEmptyLiteral(func, ast);
  }

  public void visit(NumAst ast) {
    // Literal numbers never affects free names in fragments.
  }

  public void visit(ReturnStmt ast) {
    if (ast.expr != null) {
      ast.expr.accept(this);
      if (evaluatedVar != null) {
        df.addConstraint(ast, evaluatedVar, df.lookup(func.name._name).ret);
        evaluatedVar = null;
      }
    }
  }

  public void visit(ListTypeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(DeclStmtAst ast) {
    Variable lv = df.createVariable(func, ast.id);
    scope().put(ast.id._name, lv);
    if (ast.expr != null && ast.expr.resolvedType instanceof CodeType) {
      ast.expr.accept(this);
      if (evaluatedVar != null) {
        df.addConstraint(ast, evaluatedVar, lv);
      }
      evaluatedVar = null;
    }
  }

  public void visit(AssignStmtAst ast) {
    ast._expr.accept(this);
    _assert(evaluatedVar != null);
    Node sv = evaluatedVar;
    Node tv = looupName(ast._name._name);
    _assert(tv != null);
    df.addConstraint(ast, sv, tv);
  }

  /** This is purely functional. */
  public void visit(final ExprStmtAst ast) {
    // This does not affect local variables.
  }

  public void visit(ListAst ast) {
    ListType lt = (ListType) ast.resolvedType;
    Type it = lt.getIterationType();
    List<Node> vars = new LinkedList<Node>();
    if (it instanceof CodeType) {
      for (ExprAst e : ast.elements) {
        evaluatedVar = null;
        e.accept(this);
        _assert(evaluatedVar != null);
        vars.add(evaluatedVar);
      }
      evaluatedVar = df.createVariable(func, ast);
      for (Node s : vars) {
        df.addConstraint(ast, s, evaluatedVar);
      }
    }
  }

  public void visit(UnaryExprAst ast) {
    if (ast.resolvedType instanceof CodeType) {
      _assert(false, "to be implemented");
    }
  }

  public void visit(UserTypeAst ast) {
    _assert(false, "unreachable");
  }

  /**
   * Just bypass value flow.
   */
  public void visit(FieldRefAst ast) {
    ast.objectExpr.accept(this);
    _assert(evaluatedVar != null);
  }

  /**
   * No static free names come from code-type values through array access.
   */
  public void visit(ArrayRefAst ast) {
    ast.arrayExpr.accept(this);
    _assert(evaluatedVar != null);
  }

  public void visit(ListForAst ast) {
    enterScope();

    // from
    ast.from.accept(this);
    Node vfrom = evaluatedVar;
    _assert(vfrom != null);

    // induction variable
    Variable vindex = df.createVariable(func, ast.ID);
    scope().put(ast.ID._name, vindex);
    df.addConstraint(ast, vfrom, vindex);

    // select
    ast.select.accept(this);
    _assert(evaluatedVar != null);

    leaveScope();
  }

  public void visit(AssertStmt ast) {
  }

  public void visit(VoidTypeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(CodeTypeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(ExterFuncDecl ast) {
    // Do nothing.
  }

  public void visit(ImportDecl ast) {
    _assert(false, "unreachable");
  }

  public void visit(TupleTypeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(TypeDef ast) {
    _assert(false, "unreachable");
  }

  public void visit(AttributeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(PrimitiveTypeAst ast) {
    _assert(false, "unreachable");
  }

  public void visit(final ConstDeclAst ast) {
  }
}
