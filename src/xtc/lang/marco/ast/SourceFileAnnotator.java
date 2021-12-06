package xtc.lang.marco.ast;

public class SourceFileAnnotator extends Visitor {

  private final String sourceFile;

  public SourceFileAnnotator(final String sourceFile) {
    this.sourceFile = sourceFile;
  }

  public void visit(ReturnStmt ast) {
    ast.sourceFile = sourceFile;
    if (ast.expr != null) {
      ast.expr.accept(this);
    }
  }

  public void visit(final AssignStmtAst ast) {
    ast.sourceFile = sourceFile;
    ast._name.accept(this);
    ast._expr.accept(this);
  }

  public void visit(final ExprStmtAst ast) {
    ast.sourceFile = sourceFile;
    ast._expr.accept(this);
  }

  public void visit(final BlockStmtAst ast) {
    ast.sourceFile = sourceFile;
    for (int i = 0, n = ast.stmtCount(); i < n; i++) {
      ast.stmt(i).accept(this);
    }
  }

  public void visit(final BoolLitAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(final CallExprAst ast) {
    ast.sourceFile = sourceFile;
    for (int i = 0, n = ast.exprCount(); i < n; i++) {
      ast.expr(i).accept(this);
    }
  }

  public void visit(final FormalParamAst ast) {
    ast.sourceFile = sourceFile;
    ast.type.accept(this);
    ast.name.accept(this);
  }

  public void visit(final ForStmtAst ast) {
    ast.sourceFile = sourceFile;
    ast._name.accept(this);
    ast._expr.accept(this);
    ast._stmt.accept(this);
    if (ast._v != null) {
      ast._v.accept(this);
    }
  }

  public void visit(FuncDefinition ast) {
    ast.sourceFile = sourceFile;

    ast.returnType.accept(this);
    for (final FormalParamAst f : ast.formals) {
      f.accept(this);
    }
    ast.body.accept(this);
  }

  public void visit(final NameAst ast) {
    ast.sourceFile = sourceFile;

  }

  public void visit(final IfStmtAst ast) {
    ast.sourceFile = sourceFile;

    ast._expr.accept(this);
    ast._thenStmt.accept(this);
    if (null != ast._elseStmt) {
      ast._elseStmt.accept(this);
    }
  }

  public void visit(final InfixExprAst ast) {
    ast.sourceFile = sourceFile;

    ast._lhsExpr.accept(this);
    ast._rhsExpr.accept(this);
  }

  public void visit(final ProgramAst ast) {
    ast.sourceFile = sourceFile;

    for (TopLevelAst fdef : ast.funcDefs) {
      fdef.accept(this);
    }
  }

  public void visit(final StringLitAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(final NumAst ast) {
    ast.sourceFile = sourceFile;

  }

  public void visit(Fragment ast) {
    ast.sourceFile = sourceFile;
    for (FragmentElement t : ast.elements) {
      t.accept(this);
    }
  }

  public void visit(Blank ast) {
    ast.sourceFile = sourceFile;
    ast.expr.accept(this);
  }

  public void visit(ObjectToken ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(ListTypeAst ast) {
    ast.sourceFile = sourceFile;
    ast.elementType.accept(this);
  }

  public void visit(DeclStmtAst ast) {
    ast.sourceFile = sourceFile;
    ast.type.accept(this);
    ast.id.accept(this);
    if (ast.expr != null) {
      ast.expr.accept(this);
    }
  }

  public void visit(ObjectId ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(ListAst ast) {
    ast.sourceFile = sourceFile;
    for (ExprAst e : ast.elements) {
      e.accept(this);
    }
  }

  public void visit(final UnaryExprAst ast) {
    ast.sourceFile = sourceFile;
    ast.operand.accept(this);
  }

  public void visit(final UserTypeAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(final FieldRefAst ast) {
    ast.sourceFile = sourceFile;
    ast.fieldName.accept(this);
    ast.objectExpr.accept(this);
  }

  public void visit(final ArrayRefAst ast) {
    ast.sourceFile = sourceFile;
    ast.arrayExpr.accept(this);
    ast.indexExpr.accept(this);
  }

  public void visit(final ListForAst ast) {
    ast.sourceFile = sourceFile;
    ast.ID.accept(this);
    ast.select.accept(this);
    ast.from.accept(this);
    if (ast.cond != null) {
      ast.cond.accept(this);
    }
  }

  public void visit(final AssertStmt ast) {
    ast.sourceFile = sourceFile;
    ast.cond.accept(this);
    if (ast.message != null) {
      ast.message.accept(this);
    }
    if (ast.location != null) {
      ast.location.accept(this);
    }
  }

  public void visit(final VoidTypeAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(final ExterFuncDecl ast) {
    ast.sourceFile = sourceFile;
    ast.ID.accept(this);
    ast.returnType.accept(this);
    for (TypeAst p : ast.paramTypes) {
      p.accept(this);
    }
  }

  public void visit(final ImportDecl ast) {
    ast.sourceFile = sourceFile;
    ast.ID.accept(this);
  }

  public void visit(final TupleTypeAst ast) {
    ast.sourceFile = sourceFile;
    for (AttributeAst a : ast.attributes) {
      a.accept(this);
    }
  }

  public void visit(final TypeDef ast) {
    ast.sourceFile = sourceFile;
    ast.ID.accept(this);
    ast.type.accept(this);
  }

  public void visit(AttributeAst ast) {
    ast.sourceFile = sourceFile;
    ast.ID.accept(this);
    ast.type.accept(this);
  }

  public void visit(final PrimitiveTypeAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(CodeTypeAst ast) {
    ast.sourceFile = sourceFile;
  }

  public void visit(InteractiveAst ast) {
    ast.sourceFile = sourceFile;
    for (StmtAst s : ast.s) {
      s.accept(this);
    }
  }

  public void visit(final ConstDeclAst ast) {
    ast.sourceFile = sourceFile;
    ast.id.accept(this);
    ast.value.accept(this);
  }
}
