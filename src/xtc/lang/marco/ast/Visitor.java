package xtc.lang.marco.ast;

public abstract class Visitor {
  public abstract void visit(final InteractiveAst ast);

  public abstract void visit(final Blank ast);

  public abstract void visit(final BlockStmtAst ast);

  public abstract void visit(final BoolLitAst ast);

  public abstract void visit(final CallExprAst ast);

  public abstract void visit(final Fragment ast);

  public abstract void visit(final ForStmtAst ast);

  public abstract void visit(final FormalParamAst ast);

  public abstract void visit(final FuncDefinition ast);

  public abstract void visit(final NameAst ast);

  public abstract void visit(final IfStmtAst ast);

  public abstract void visit(final InfixExprAst ast);

  public abstract void visit(final ObjectToken ast);

  public abstract void visit(final ProgramAst ast);

  public abstract void visit(final StringLitAst ast);

  public abstract void visit(final NumAst ast);

  public abstract void visit(final ReturnStmt ast);

  public abstract void visit(final ListTypeAst ast);

  public abstract void visit(final DeclStmtAst ast);

  public abstract void visit(final AssignStmtAst ast);

  public abstract void visit(final ExprStmtAst ast);

  public abstract void visit(final ObjectId ast);

  public abstract void visit(final ListAst ast);

  public abstract void visit(final UnaryExprAst ast);

  public abstract void visit(final UserTypeAst ast);

  public abstract void visit(final FieldRefAst ast);

  public abstract void visit(final ArrayRefAst ast);

  public abstract void visit(final ListForAst ast);

  public abstract void visit(final AssertStmt ast);

  public abstract void visit(final VoidTypeAst ast);

  public abstract void visit(final CodeTypeAst ast);

  public abstract void visit(final ExterFuncDecl ast);

  public abstract void visit(final ImportDecl ast);

  public abstract void visit(final TupleTypeAst ast);

  public abstract void visit(final TypeDef ast);

  public abstract void visit(final AttributeAst ast);

  public abstract void visit(final PrimitiveTypeAst ast);

  public abstract void visit(final ConstDeclAst ast);
}
