package xtc.lang.marco.analysis;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

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
import xtc.lang.marco.ast.TopLevelAst;
import xtc.lang.marco.ast.TupleTypeAst;
import xtc.lang.marco.ast.TypeAst;
import xtc.lang.marco.ast.TypeDef;
import xtc.lang.marco.ast.UnaryExprAst;
import xtc.lang.marco.ast.UserTypeAst;
import xtc.lang.marco.ast.Visitor;
import xtc.lang.marco.ast.VoidTypeAst;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.stable.FunctionName;
import xtc.lang.marco.stable.UserFunctionBinding;

public class IPAPruning {

  final HashSet<FuncDefinition> reachableFunctions = new HashSet<FuncDefinition>();

  final FuncDefinition root;

  public IPAPruning(FuncDefinition root) {
    this.root = root;
  }

  public Set<FuncDefinition> trace() {
    dfsTrace(root);
    return reachableFunctions;
  }

  void dfsTrace(FuncDefinition f) {
    reachableFunctions.add(f);
    for (CallExprAst cs : CallSiteExtractor.getCallSites(f)) {
      FunctionName fbind = cs.fbind;
      if (fbind instanceof UserFunctionBinding) {
        UserFunctionBinding ufb = (UserFunctionBinding) fbind;
        FuncDefinition succ = ufb.fdef;
        if (!reachableFunctions.contains(succ)) {
          dfsTrace(succ);
        }
      }
    }
  }

  public static ProgramAst prune(ProgramAst prog) {
    Set<FuncDefinition> reachable = new IPAPruning(findRoot(prog)).trace();
    LinkedList<TopLevelAst> l = new LinkedList<TopLevelAst>();
    for (TopLevelAst a : prog.funcDefs) {
      if (a instanceof FuncDefinition) {
        if (reachable.contains(a)) {
          l.add(a);
        }
      } else {
        l.add(a);
      }
    }
    ProgramAst newProg = new ProgramAst(l.toArray(new TopLevelAst[0]), prog._line, prog._column, prog.sourceFile);

    return newProg;
  }

  public static FuncDefinition findRoot(ProgramAst prog) {
    for (TopLevelAst a : prog.funcDefs) {
      if (a instanceof FuncDefinition) {
        FuncDefinition def = (FuncDefinition) a;
        if ("main".equals(def.name._name)) {
          return def;
        }
      }
    }
    throw new MarcoException(prog, "cannot find a main function");
  }
}

class CallSiteExtractor extends Visitor {
  final HashSet<CallExprAst> css = new HashSet<CallExprAst>();

  public static Set<CallExprAst> getCallSites(FuncDefinition f) {
    CallSiteExtractor e = new CallSiteExtractor();
    e.visit(f);
    return e.css;
  }

  public CallSiteExtractor() {
  }

  public void visit(ReturnStmt ast) {
    if (ast.expr != null) {
      ast.expr.accept(this);
    }
  }

  public void visit(final AssignStmtAst ast) {
    ast._name.accept(this);
    ast._expr.accept(this);
  }

  public void visit(final ExprStmtAst ast) {
    ast._expr.accept(this);
  }

  public void visit(final BlockStmtAst ast) {
    for (int i = 0, n = ast.stmtCount(); i < n; i++) {
      ast.stmt(i).accept(this);
    }
  }

  public void visit(final BoolLitAst ast) {
  }

  public void visit(final CallExprAst ast) {
    css.add(ast);
    for (int i = 0, n = ast.exprCount(); i < n; i++) {
      ast.expr(i).accept(this);
    }
  }

  public void visit(final FormalParamAst ast) {
  }

  public void visit(final ForStmtAst ast) {
    ast._name.accept(this);
    ast._expr.accept(this);
    ast._stmt.accept(this);
    if (ast._v != null) {
      ast._v.accept(this);
    }
  }

  public void visit(FuncDefinition ast) {
    ast.returnType.accept(this);
    for (final FormalParamAst f : ast.formals) {
      f.accept(this);
    }
    ast.body.accept(this);
  }

  public void visit(final NameAst ast) {
  }

  public void visit(final IfStmtAst ast) {
    ast._expr.accept(this);
    ast._thenStmt.accept(this);
    if (null != ast._elseStmt) {
      ast._elseStmt.accept(this);
    }
  }

  public void visit(final InfixExprAst ast) {
    ast._lhsExpr.accept(this);
    ast._rhsExpr.accept(this);
  }

  public void visit(final ProgramAst ast) {
    for (TopLevelAst fdef : ast.funcDefs) {
      fdef.accept(this);
    }
  }

  public void visit(final StringLitAst ast) {
  }

  public void visit(final NumAst ast) {
  }

  public void visit(Fragment ast) {
    for (FragmentElement t : ast.elements) {
      t.accept(this);
    }
  }

  public void visit(Blank ast) {
    ast.expr.accept(this);
  }

  public void visit(ObjectToken ast) {
  }

  public void visit(ListTypeAst ast) {
    ast.elementType.accept(this);
  }

  public void visit(DeclStmtAst ast) {
    ast.type.accept(this);
    ast.id.accept(this);
    if (ast.expr != null) {
      ast.expr.accept(this);
    }
  }

  public void visit(ObjectId ast) {
  }

  public void visit(ListAst ast) {
    for (ExprAst e : ast.elements) {
      e.accept(this);
    }
  }

  public void visit(final UnaryExprAst ast) {
    ast.operand.accept(this);
  }

  public void visit(final UserTypeAst ast) {
  }

  public void visit(final FieldRefAst ast) {
    ast.fieldName.accept(this);
    ast.objectExpr.accept(this);
  }

  public void visit(final ArrayRefAst ast) {
    ast.arrayExpr.accept(this);
    ast.indexExpr.accept(this);
  }

  public void visit(final ListForAst ast) {
    ast.select.accept(this);
    ast.from.accept(this);
    if (ast.cond != null) {
      ast.cond.accept(this);
    }
  }

  public void visit(final AssertStmt ast) {
    ast.cond.accept(this);
    if (ast.message != null) {
      ast.message.accept(this);
    }
    if (ast.location != null) {
      ast.location.accept(this);
    }
  }

  public void visit(final VoidTypeAst ast) {
  }

  public void visit(final ExterFuncDecl ast) {
    ast.ID.accept(this);
    ast.returnType.accept(this);
    for (TypeAst p : ast.paramTypes) {
      p.accept(this);
    }
  }

  public void visit(final ImportDecl ast) {
    ast.ID.accept(this);
  }

  public void visit(final TupleTypeAst ast) {
    for (AttributeAst a : ast.attributes) {
      a.accept(this);
    }
  }

  public void visit(final TypeDef ast) {
    ast.ID.accept(this);
    ast.type.accept(this);
  }

  public void visit(AttributeAst ast) {
    ast.ID.accept(this);
    ast.type.accept(this);
  }

  public void visit(final PrimitiveTypeAst ast) {
  }

  public void visit(CodeTypeAst ast) {
  }

  public void visit(InteractiveAst ast) {
    for (StmtAst s : ast.s) {
      s.accept(this);
    }
  }

  public void visit(final ConstDeclAst ast) {
  }
}
