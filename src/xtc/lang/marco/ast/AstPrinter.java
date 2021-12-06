package xtc.lang.marco.ast;

import java.io.PrintWriter;
import java.util.Stack;

import xtc.lang.marco.type.CodeType;

public class AstPrinter extends Visitor {
  PrintWriter _writer;
  Stack<StrongAst> _stack;

  public AstPrinter(final PrintWriter writer) {
    _writer = writer;
    _stack = new Stack<StrongAst>();
  }

  private void push(final StrongAst ast) {
    push(ast, null);
  }

  private void push(final StrongAst ast, final String attrib) {
    for (int i = 0, n = _stack.size(); i < n; i++)
      _writer.print("  ");
    _stack.push(ast);
    _writer.print(ast.getClass().getSimpleName());
    if (null != attrib) {
      _writer.print(" ");
      _writer.print(attrib);
    }
    _writer.println();
  }

  private void pop(final StrongAst ast) {
    StrongAst top = _stack.pop();
    assert top == ast;
  }

  public void visit(final ProgramAst ast) {
    push(ast);
    for (final TopLevelAst i : ast.funcDefs)
      i.accept(this);
    pop(ast);
  }

  public void visit(final InteractiveAst ast) {
    push(ast);
    for (final StmtAst i : ast.s)
      i.accept(this);
    pop(ast);
  }

  public void visit(final ImportDecl ast) {
    push(ast);
    ast.ID.accept(this);
    pop(ast);
  }

  public void visit(final TypeDef ast) {
    push(ast);
    ast.ID.accept(this);
    ast.type.accept(this);
    pop(ast);
  }

  public void visit(final UserTypeAst ast) {
    push(ast);
    ast.id.accept(this);
    pop(ast);
  }

  public void visit(final VoidTypeAst ast) {
    push(ast);
    pop(ast);
  }

  public void visit(final CodeTypeAst ast) {
    push(ast, ast.codeType.lang + ", " + ast.codeType.phrase);
    pop(ast);
  }

  public void visit(final PrimitiveTypeAst ast) {
    push(ast, ast.text);
    pop(ast);
  }

  public void visit(final TupleTypeAst ast) {
    push(ast);
    for (final AttributeAst i : ast.attributes)
      i.accept(this);
    pop(ast);
  }

  public void visit(final ListTypeAst ast) {
    push(ast);
    ast.elementType.accept(this);
    pop(ast);
  }

  public void visit(final AttributeAst ast) {
    push(ast);
    ast.type.accept(this);
    ast.ID.accept(this);
    pop(ast);
  }

  public void visit(final ExterFuncDecl ast) {
    push(ast);
    ast.returnType.accept(this);
    ast.ID.accept(this);
    for (final TypeAst i : ast.paramTypes)
      i.accept(this);
    pop(ast);
  }

  public void visit(final FuncDefinition ast) {
    push(ast);
    ast.returnType.accept(this);
    ast.name.accept(this);
    for (final FormalParamAst i : ast.formals)
      i.accept(this);
    ast.body.accept(this);
    pop(ast);
  }

  public void visit(final FormalParamAst ast) {
    push(ast);
    ast.type.accept(this);
    ast.name.accept(this);
    pop(ast);
  }

  public void visit(final ConstDeclAst ast) {
    push(ast);
    ast.id.accept(this);
    ast.value.accept(this);
    pop(ast);
  }

  public void visit(final BlockStmtAst ast) {
    push(ast);
    for (final StmtAst i : ast._stmts)
      i.accept(this);
    pop(ast);
  }

  public void visit(final DeclStmtAst ast) {
    push(ast);
    ast.type.accept(this);
    ast.id.accept(this);
    if (null != ast.expr)
      ast.expr.accept(this);
    pop(ast);
  }

  public void visit(final AssignStmtAst ast) {
    push(ast, ast.op.toString());
    ast._name.accept(this);
    ast._expr.accept(this);
    pop(ast);
  }

  public void visit(final ExprStmtAst ast) {
    push(ast);
    ast._expr.accept(this);
    pop(ast);
  }

  public void visit(final IfStmtAst ast) {
    push(ast);
    ast._expr.accept(this);
    ast._thenStmt.accept(this);
    if (null != ast._elseStmt)
      ast._elseStmt.accept(this);
    pop(ast);
  }

  public void visit(final ForStmtAst ast) {
    push(ast);
    ast._type.accept(this);
    ast._name.accept(this);
    ast._expr.accept(this);
    if (null != ast._v)
      ast._v.accept(this);
    ast._stmt.accept(this);
    pop(ast);
  }

  public void visit(final ReturnStmt ast) {
    push(ast);
    if (null != ast.expr)
      ast.expr.accept(this);
    pop(ast);
  }

  public void visit(final AssertStmt ast) {
    push(ast);
    ast.cond.accept(this);
    ast.message.accept(this);
    ast.location.accept(this);
    pop(ast);
  }

  public void visit(final InfixExprAst ast) {
    push(ast, ast._op.toString());
    ast._lhsExpr.accept(this);
    ast._rhsExpr.accept(this);
    pop(ast);
  }

  public void visit(final UnaryExprAst ast) {
    push(ast, ast.op.toString());
    ast.operand.accept(this);
    pop(ast);
  }

  public void visit(final ArrayRefAst ast) {
    push(ast);
    ast.arrayExpr.accept(this);
    ast.indexExpr.accept(this);
    pop(ast);
  }

  public void visit(final FieldRefAst ast) {
    push(ast);
    ast.objectExpr.accept(this);
    ast.fieldName.accept(this);
    pop(ast);
  }

  public void visit(final CallExprAst ast) {
    push(ast);
    ast._name.accept(this);
    for (final ExprAst i : ast._exprs)
      i.accept(this);
    pop(ast);
  }

  public void visit(final BoolLitAst ast) {
    push(ast, Boolean.toString(ast._val));
    pop(ast);
  }

  public void visit(final NumAst ast) {
    push(ast, Integer.toString(ast._val));
    pop(ast);
  }

  public void visit(final StringLitAst ast) {
    push(ast, ast._val);
    pop(ast);
  }

  public void visit(final NameAst ast) {
    push(ast, ast._name);
    pop(ast);
  }

  public void visit(final ListForAst ast) {
    push(ast);
    ast.select.accept(this);
    ast.type.accept(this);
    ast.ID.accept(this);
    ast.from.accept(this);
    if (null != ast.cond)
      ast.cond.accept(this);
    pop(ast);
  }

  public void visit(final ListAst ast) {
    push(ast);
    for (final ExprAst i : ast.elements)
      i.accept(this);
    pop(ast);
  }

  public void visit(final Fragment ast) {
    final StringBuilder s = new StringBuilder();
    for (final String key : ast.properties.keySet()) {
      s.append(", ");
      s.append(key);
      final String[] value = ast.properties.get(key);
      if (0 < value.length) {
        s.append(" = [");
        for (int i = 0, n = value.length; i < n; i++) {
          if (0 < i)
            s.append(", ");
          s.append(value[i]);
        }
        s.append("]");
      }
    }
    final CodeType codeType = (CodeType) ast.resolvedType;
    push(ast, codeType.lang + ", " + codeType.phrase + s);
    for (final FragmentElement i : ast.elements)
      i.accept(this);
    pop(ast);
  }

  public void visit(final ObjectToken ast) {
    push(ast, "`[" + ast.value + "]");
    pop(ast);
  }

  public void visit(final ObjectId ast) {
    push(ast, ast.name);
    pop(ast);
  }

  public void visit(final Blank ast) {
    push(ast);
    ast.expr.accept(this);
    pop(ast);
  }
}
