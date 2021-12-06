package xtc.lang.marco.ast;

import static xtc.lang.marco.Util._assert;

import java.util.LinkedList;
import java.util.List;

public class FragmentEnumerator extends Visitor {

  public static List<Fragment> getFragments(ProgramAst past) {
    FragmentEnumerator fe = new FragmentEnumerator();
    fe.visit(past);
    return fe.l;
  }

  final LinkedList<Fragment> l = new LinkedList<Fragment>();

  public void visit(ProgramAst ast) {
    for (TopLevelAst d : ast.funcDefs) {
      d.accept(this);
    }
  }

  public void visit(FormalParamAst ast) {
    _assert(false, "Unreachable");
  }

  public void visit(FuncDefinition ast) {
    ast.body.accept(this);
  }

  public void visit(ReturnStmt ast) {
    if ((ast.expr != null) && (ast.expr instanceof Fragment)) {
      ast.expr.accept(this);
    }
  }

  public void visit(BlockStmtAst ast) {
    for (int i = 0; i < ast.stmtCount(); i++) {
      ast.stmt(i).accept(this);
    }
  }

  public void visit(AssignStmtAst ast) {
    ast._expr.accept(this);
  }

  public void visit(final ExprStmtAst ast) {
    ast._expr.accept(this);
  }

  public void visit(ForStmtAst ast) {
    ast._stmt.accept(this);
  }

  public void visit(IfStmtAst ast) {
    if (ast._thenStmt != null) {
      ast._thenStmt.accept(this);
    }
    if (ast._elseStmt != null) {
      ast._elseStmt.accept(this);
    }
  }

  public void visit(DeclStmtAst ast) {
    if (ast.expr != null) {
      ast.expr.accept(this);
    }
  }

  public void visit(StringLitAst ast) {
  }

  public void visit(BoolLitAst ast) {
  }

  public void visit(NameAst ast) {
  }

  public void visit(ListAst ast) {
    for (ExprAst e : ast.elements) {
      e.accept(this);
    }
  }

  public void visit(CallExprAst ast) {
    for (int i = 0; i < ast.exprCount(); i++) {
      ast.expr(i).accept(this);
    }
  }

  public void visit(InfixExprAst ast) {
    ast._lhsExpr.accept(this);
    ast._rhsExpr.accept(this);
  }

  public void visit(NumAst ast) {
  }

  public void visit(Fragment ast) {
    l.add(ast);
  }

  public void visit(Blank ast) {
    _assert(false, "Unreachable");
  }

  public void visit(ObjectToken ast) {
    _assert(false, "Unreachable");
  }

  public void visit(ListTypeAst ast) {
    _assert(false, "Unreachable");
  }

  public void visit(ObjectId ast) {
    _assert(false, "Unreachable");
  }

  public void visit(UnaryExprAst ast) {
  }

  public void visit(UserTypeAst ast) {
  }

  public void visit(FieldRefAst ast) {
  }

  public void visit(ArrayRefAst ast) {
  }

  public void visit(ListForAst ast) {
  }

  public void visit(AssertStmt ast) {
  }

  public void visit(VoidTypeAst ast) {
  }

  public void visit(ExterFuncDecl ast) {
  }

  public void visit(ImportDecl ast) {
  }

  public void visit(TupleTypeAst ast) {
  }

  public void visit(TypeDef ast) {
  }

  public void visit(AttributeAst ast) {
  }

  public void visit(PrimitiveTypeAst ast) {
  }

  public void visit(CodeTypeAst ast) {
  }

  public void visit(InteractiveAst ast) {
  }

  public void visit(ConstDeclAst ast) {
  }
}
