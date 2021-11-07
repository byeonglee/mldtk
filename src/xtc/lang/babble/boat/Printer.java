/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2010 New York University
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 * USA.
 */
package xtc.lang.babble.boat;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

/**
 * A pretty printer for OCaml
 * 
 * @author Robert Soule
 * @version $Revision: 1.34 $
 */
public class Printer extends Visitor {
  /** The printer. */
  protected final xtc.tree.Printer printer;

  /**
   * Create a new printer for OCaml
   * 
   * @param printer
   *          The printer.
   */
  public Printer(xtc.tree.Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Generic catch-all visit method
   */
  public void visit(final GNode n) {
    for (Object o : n) {
      if (o instanceof Node) {
        dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
  }

  public void visitUnitInterface(final GNode n) {
    dispatch(n.getNode(0));
    if (n.get(1) != null) {
      printer.p(";;");
    }
    printer.pln().pln();
  }

  public void visitUnitImplementation(final GNode n) {
    dispatch(n.getNode(0));
    if (n.get(1) != null) {
      printer.p(";;");
    }
    printer.pln().pln();
  }

  // ------------------------------ Type Expressions
  // ------------------------------
  public void visitAliasedType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" as ");
    dispatch(n.getNode(1));
  }

  public void visitFunctionType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" -> ");
    dispatch(n.getNode(1));
  }

  public void visitTupleType(final GNode n) {
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(" * ");
      i++;
    }
    dispatch(n.getNode(i));
  }

  public void visitConstructedType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    dispatch(n.getNode(1));
  }

  public void visitNaryConstructedType(final GNode n) {
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
  }

  public void visitNaryType(final GNode n) {
    printer.p("(");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(", ");
      i++;
    }
    dispatch(n.getNode(i));
    printer.p(")");
    printer.p(" ");
  }

  public void visitParenthesizedType(final GNode n) {
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitBooleanType(final GNode n) {
    printer.p("bool");
  }

  public void visitIntType(final GNode n) {
    printer.p("int");
  }

  public void visitFloatType(final GNode n) {
    printer.p("float");
  }

  public void visitFloat32(final GNode n) {
    printer.p("float32");
  }

  public void visitFloat64(final GNode n) {
    printer.p("float64");
  }

  public void visitStringType(final GNode n) {
    printer.p("string");
  }

  public void visitAnyType(final GNode n) {
    printer.p("any");
  }

  public void visitUserDefinedType(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitTypeVariable(final GNode n) {
    printer.p("'");
    printer.p(n.getString(0));
  }

  public void visitNary(final GNode n) {
    printer.p("(");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(", ");
      i++;
    }
    dispatch(n.getNode(i));
    printer.p(")");
  }

  public void visitVariantDeclaration(final GNode n) {
    printer.p("|");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(" | ");
      i++;
    }
    dispatch(n.getNode(i));
  }

  public void visitRecordDeclaration(final GNode n) {
    printer.p("{");
    dispatch(n.getNode(0));
    printer.p("}");
  }

  public void visitPolyVariantDeclaration(final GNode n) {
    printer.p("[");
    printer.p("|");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(" | ");
      i++;
    }
    dispatch(n.getNode(i));
    printer.p("]");
  }

  public void visitPolyVariantType(final GNode n) {
    printer.p("[");
    printer.p("|");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(" | ");
      i++;
    }
    dispatch(n.getNode(i));
    printer.p("]");
  }

  public void visitTypeConstructor(final GNode n) {
    printer.p(n.getString(0));
    if (n.size() > 1) {
      printer.p(" of ");
      dispatch(n.getNode(1));
    }
  }

  public void visitFieldType(final GNode n) {
    printer.p(n.getString(0));
    printer.p(" : ");
    dispatch(n.getNode(1));
  }

  public void visitPolyTypeConstructor(final GNode n) {
    printer.p("`");
    printer.p(n.getString(0));
    printer.p(" of ");
    printer.p(n.getString(1));
  }

  // //-------------------------- Type and Exception Defs
  // ------------------------------
  public void visitTypeDefinition(final GNode n) {
    printer.p("type ");
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(" and ");
      i++;
    }
    dispatch(n.getNode(i));
  }

  public void visitTypeDef(final GNode n) {
    if (null != n.get(0)) {
      dispatch(n.getNode(0));
    }
    dispatch(n.getNode(1));
    dispatch(n.getNode(2));
  }

  public void visitTypeConstrName(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitTypeRepresentation(final GNode n) {
    printer.p(" = ");
    if ("ConstrDeclList".equals(n.getNode(0).getName())) {
      // ConstrDeclList
      dispatch(n.getNode(0));
    } else {
      // FieldDeclList
      printer.incr();
      printer.pln("{").indent();
      dispatch(n.getNode(0));
      printer.decr();
      printer.p("}");
    }
  }

  /* TODO : There is a printing error here. Missing the ()s on the second case */
  public void visitTypeParams(final GNode n) {
    if (n.size() == 1) {
      dispatch(n.getNode(0));
    } else {
      dispatch(n.getNode(0));
    }
  }

  public void visitConstrDecl(final GNode n) {
    printer.p(n.getString(0));
    if (null != n.getNode(1)) {
      printer.p(" of ");
      dispatch(n.getNode(1));
    }
  }

  public void visitFieldDecl(final GNode n) {
    if (n.get(0) != null) {
      printer.p("mutable ");
    }
    printer.p(n.getString(1));
    printer.p(":");
    dispatch(n.getNode(2));
  }

  public void visitTypeParam(final GNode n) {
    if (n.get(0) != null) {
      dispatch(n.getNode(0));
    }
    printer.p(":");
    printer.p(n.getString(1));
  }

  public void visitTypeParamPrefix(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitTypeConstraint(final GNode n) {
    printer.p("constraint ");
    printer.p("'");
    printer.p(n.getString(0));
    printer.p(" = ");
    dispatch(n.getNode(1));
  }

  public void visitExceptionDefinitionEqual(final GNode n) {
    printer.p("exception ");
    dispatch(n.getNode(0));
    printer.p(" = ");
    dispatch(n.getNode(1));
  }

  public void visitExceptionDefinitionOf(final GNode n) {
    printer.p("exception ");
    dispatch(n.getNode(0));
    if (n.getNode(1) != null) {
      printer.p(" of ");
      dispatch(n.getNode(1));
    }
  }

  // ------------------------- Refering to Named Object
  // --------------------------
  public void visitValuePath(final GNode n) {
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p(".");
    }
    dispatch(n.getNode(1));
  }

  public void visitConstr(final GNode n) {
    int i = 0;
    while (i < n.size() - 1) {
      printer.p(n.getString(i));
      printer.p(".");
      i++;
    }
    printer.p(n.getString(i));
  }

  public void visitTypeConstr(final GNode n) {
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(".");
      i++;
    }
    printer.p(n.getString(i));
  }

  public void visitField(final GNode n) {
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p(".");
    }
    printer.p(n.getString(1));
  }

  public void visitModTypePath(final GNode n) {
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p(".");
    }
    dispatch(n.getNode(1));
  }

  public void visitClassPath(final GNode n) {
    int i = 0;
    while (i < n.size() - 1) {
      dispatch(n.getNode(i));
      printer.p(".");
      i++;
    }
    printer.p(n.getString(i));
  }

  public void visitModulePath(final GNode n) {
    int i = 0;
    while (i < n.size() - 1) {
      printer.p(n.getString(i));
      printer.p(".");
      i++;
    }
    printer.p(n.getString(i));
  }

  // generic ExtendedModulePath = ExtendedModulePath void:".":Symbol ModuleName
  // / ExtendedModulePath void:"(":Symbol ExtendedModulePath void:")":Symbol
  // / ModuleName ;
  // //------------------------------ Patterns ------------------------------
  public void visitLazyPattern(final GNode n) {
    printer.p("lazy ");
    dispatch(n.getNode(0));
  }

  public void visitBracketBarPattern(final GNode n) {
    printer.p("[|");
    dispatch(n.getNode(0));
    printer.p("|]");
  }

  public void visitPatternList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p("; ");
      dispatch(n.getNode(i));
    }
  }

  public void visitDoubleColonPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p("::");
    dispatch(n.getNode(1));
  }

  public void visitBracketPattern(final GNode n) {
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
  }

  public void visitRecordPattern(final GNode n) {
    printer.p("{");
    dispatch(n.getNode(0));
    printer.p("}");
  }

  public void visitFieldPatternList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p("; ");
      dispatch(n.getNode(i));
    }
  }

  public void visitFieldPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" = ");
    dispatch(n.getNode(1));
  }

  public void visitCommaPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(", ");
    dispatch(n.getNode(1));
  }

  public void visitTypeConstrPattern(final GNode n) {
    printer.p("#");
    dispatch(n.getNode(0));
  }

  public void visitTagPattern(final GNode n) {
    printer.p("'");
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
  }

  public void visitConstructorPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    dispatch(n.getNode(1));
  }

  public void visitBarPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" | ");
    dispatch(n.getNode(1));
  }

  public void visitParenthesisedPattern(final GNode n) {
    printer.p("(");
    dispatch(n.getNode(0));
    if (n.getNode(1) != null) {
      printer.p(":");
      dispatch(n.getNode(1));
    }
    printer.p(")");
  }

  public void visitAsPattern(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" as ");
    dispatch(n.getNode(1));
  }

  public void visitVariable(final GNode n) {
    dispatch(n.getNode(0));
  }

  public void visitWildCard(final GNode n) {
    printer.p("_");
  }

  public void visitPatternMatching(final GNode n) {
    if (null != n.get(0)) {
      printer.p(" | ");
    }
    dispatch(n.getNode(1));
  }

  public void visitMultipleMatching(final GNode n) {
    dispatch(n.getNode(0));
    if (null != n.getNode(1)) {
      dispatch(n.getNode(1));
    }
    printer.p(" -> ");
    dispatch(n.getNode(2));
  }

  public void visitMultipleParameters(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitPatternMatchList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.pln().indent().p(" | ");
      dispatch(n.getNode(i));
    }
  }

  public void visitPatternMatch(final GNode n) {
    dispatch(n.getNode(0));
    if (n.getNode(1) != null) {
      dispatch(n.getNode(1));
    }
    printer.p(" -> ");
    dispatch(n.getNode(2));
  }

  public void visitWhenClause(final GNode n) {
    printer.p(" when ");
    dispatch(n.getNode(0));
  }

  public void visitParameter(final GNode n) {
    if (n.size() == 1) {
      dispatch(n.getNode(0));
    } else {
      dispatch(n.getNode(0));
      if (n.getNode(1) != null) {
        printer.p(":");
        dispatch(n.getNode(1));
      }
    }
  }

  // ------------------------------ Expressions ------------------------------
  public void visitLetExpression(final GNode n) {
    printer.p("let ");
    if (n.getString(0) != null) {
      printer.p(" rec ");
    }
    dispatch(n.getNode(1));
    printer.incr();
    printer.pln(" in").indent();
    dispatch(n.getNode(2));
    printer.decr();
  }

  public void visitLetBindingList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i != 0)
        printer.p(" and ");
      dispatch(n.getNode(i));
    }
  }

  public void visitLetBinding(final GNode n) {
    if (n.size() == 2) {
      dispatch(n.getNode(0));
      printer.incr();
      printer.pln(" = ").indent();
      dispatch(n.getNode(1));
      printer.decr();
    } else {
      dispatch(n.getNode(0));
      printer.p(" ");
      dispatch(n.getNode(1));
      if (n.getNode(2) != null) {
        dispatch(n.getNode(2));
      }
      printer.p(" = ");
      printer.incr();
      printer.pln().indent();
      dispatch(n.getNode(3));
      printer.decr();
    }
  }

  public void visitType(final GNode n) {
    printer.p(":");
    dispatch(n.getNode(0));
  }

  public void visitTryExpression(final GNode n) {
    printer.incr();
    printer.pln("try").indent();
    dispatch(n.getNode(0));
    printer.decr();
    printer.pln().indent();
    printer.incr();
    printer.pln("with").indent();
    dispatch(n.getNode(1));
    printer.decr();
  }

  public void visitFunExpression(final GNode n) {
    printer.p("fun ");
    dispatch(n.getNode(0));
  }

  public void visitFunctionExpression(final GNode n) {
    printer.p("function ");
    dispatch(n.getNode(0));
  }

  public void visitMatchExpression(final GNode n) {
    printer.incr();
    printer.pln("match").indent();
    dispatch(n.getNode(0));
    printer.decr();
    printer.pln().indent();
    printer.incr();
    printer.pln("with").indent();
    dispatch(n.getNode(1));
    printer.decr();
  }

  public void visitSemiExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.pln(";").indent();
    dispatch(n.getNode(1));
  }

  public void visitForExpression(final GNode n) {
    printer.p("for ");
    dispatch(n.getNode(0)); // i
    printer.p(" = ");
    dispatch(n.getNode(1)); // 0
    printer.p(" ");
    dispatch(n.getNode(2)); // to
    printer.p(" ");
    dispatch(n.getNode(3)); // to
    printer.incr();
    printer.pln(" do").indent();
    dispatch(n.getNode(4));
    printer.decr();
    printer.pln().indent();
    printer.pln("done");
  }

  public void visitDirection(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitWhileExpression(final GNode n) {
    printer.p("while ");
    dispatch(n.getNode(0));
    printer.pln().indent();
    printer.p("do ");
    dispatch(n.getNode(1));
    printer.pln().indent();
    printer.p("done ");
  }

  public void visitIfElseExpression(final GNode n) {
    printer.p("if ");
    dispatch(n.getNode(0));
    printer.pln().indent();
    printer.p("then ");
    dispatch(n.getNode(1));
    printer.pln().indent();
    printer.p("else ");
    dispatch(n.getNode(2));
  }

  public void visitIfExpression(final GNode n) {
    printer.p("if ");
    dispatch(n.getNode(0));
    printer.pln().indent();
    printer.p("then ");
    dispatch(n.getNode(1));
  }

  public void visitArrowClause(final GNode n) {
    printer.p(" <- ");
    dispatch(n.getNode(0));
  }

  public void visitCommaExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(", ");
    dispatch(n.getNode(1));
  }

  public void visitLogicalOrExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" || ");
    dispatch(n.getNode(1));
  }

  public void visitLogicalAndExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" && ");
    dispatch(n.getNode(1));
  }

  public void visitEqualityExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    printer.p(n.getString(1));
    printer.p(" ");
    dispatch(n.getNode(2));
  }

  public void visitRelationalExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    printer.p(n.getString(1));
    printer.p(" ");
    dispatch(n.getNode(2));
  }

  public void visitAdditiveExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    printer.p(n.getString(1));
    printer.p(" ");
    dispatch(n.getNode(2));
  }

  public void visitConcatenationExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(n.getString(1));
    dispatch(n.getNode(2));
  }

  public void visitMultiplicativeExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    printer.p(n.getString(1));
    printer.p(" ");
    dispatch(n.getNode(2));
  }

  public void visitAssignmentExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" := ");
    dispatch(n.getNode(1));
  }

  public void visitAssertExpression(final GNode n) {
    printer.p("assert ");
    dispatch(n.getNode(0));
  }

  public void visitLazyExpression(final GNode n) {
    printer.p("lazy ");
    dispatch(n.getNode(0));
  }

  public void visitApplicationExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    dispatch(n.getNode(1));
  }

  public void visitArgumentList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i != 0)
        printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitArgument(final GNode n) {
    dispatch(n.getNode(0));
  }

  public void visitDottedBracketExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(".[");
    dispatch(n.getNode(1));
    printer.p("]");
    if (n.getNode(2) != null) {
      dispatch(n.getNode(2));
    }
  }

  public void visitDottedParenExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(".(");
    dispatch(n.getNode(1));
    printer.p(")");
    if (n.getNode(2) != null) {
      dispatch(n.getNode(2));
    }
  }

  public void visitDottedExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(".");
    dispatch(n.getNode(1));
    if (n.size() > 2) {
      dispatch(n.getNode(2));
    }
  }

  public void visitPrefixExpression(final GNode n) {
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
  }

  public void visitPrefixOp(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitRecordWithExpression(final GNode n) {
    printer.p("{");
    printer.p(" with ");
    dispatch(n.getNode(0));
    printer.p("}");
  }

  public void visitRecordExpression(final GNode n) {
    printer.p("{");
    dispatch(n.getNode(0));
    printer.p("}");
  }

  public void visitFieldAssignment(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" = ");
    dispatch(n.getNode(1));
  }

  public void visitFieldAssignmentList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p("; ");
      dispatch(n.getNode(i));
    }
  }

  public void visitBracketBarExpression(final GNode n) {
    printer.p("[|");
    dispatch(n.getNode(0));
    printer.p("|]");
  }

  public void visitListExpression(final GNode n) {
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
  }

  public void visitExpressionSemiList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.pln("; ");
      dispatch(n.getNode(i));
    }
  }

  public void visitColonColonExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p("::");
    dispatch(n.getNode(1));
  }

  public void visitTagNameExpression(final GNode n) {
    printer.p("'");
    dispatch(n.getNode(0));
    printer.p(" ");
    dispatch(n.getNode(1));
  }

  public void visitConstrExpression(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" ");
    dispatch(n.getNode(1));
  }

  public void visitTypedExpression(final GNode n) {
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(":");
    dispatch(n.getNode(1));
    printer.p(")");
  }

  public void visitBeginExpression(final GNode n) {
    printer.p("begin ");
    dispatch(n.getNode(0));
    printer.p(" end");
  }

  public void visitParenthesizedExpression(final GNode n) {
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitID(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitLowerID(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitUpperID(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitOperator(final GNode n) {
    printer.p(n.getString(0));
  }

  // //------------------------------ Module types
  // ------------------------------
  // generic ModuleType = "todo":Word;
  // generic Specification =
  // void:"open":Keyword ModulePath
  // / void:"include":Keyword ModuleExpr
  // / void:"external":Keyword ValueName void:":":Symbol TypeExpr
  // void:"=":Symbol ExternalDeclaration
  // ;
  public void visitSpecification(final GNode n) {
    if (n.size() == 1) {
      if ("ModulePath".equals(n.getNode(0).getName())) {
        printer.p("open ");
      } else {
        printer.p("include ");
      }
      dispatch(n.getNode(0));
    } else {
      printer.p("external ");
      printer.p(n.getString(0));
      printer.p(" : ");
      dispatch(n.getNode(1));
      printer.p(" = ");
      dispatch(n.getNode(2));
    }
  }

  public void visitExternalDeclaration(final GNode n) {
    printer.p(n.getString(0));
  }

  // ------------------------------ Module Expressions
  // ------------------------------
  public void visitModulePathExpr(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitStructExpr(final GNode n) {
    printer.incr();
    printer.pln("struct").indent();
    dispatch(n.getNode(0));
    printer.decr();
    printer.p("end");
  }

  public void visitFunctorExpr(final GNode n) {
    printer.p("functor");
    printer.p("(");
    printer.p(n.getString(0));
    printer.p(" : ");
    dispatch(n.getNode(1));
    printer.p(")");
    printer.p(" -> ");
    dispatch(n.getNode(2));
  }

  public void visitParenthesizedExpr(final GNode n) {
    printer.p("(");
    dispatch(n.getNode(0));
    if (n.size() > 1) {
      printer.p(" : ");
      dispatch(n.getNode(1));
    }
    printer.p(")");
  }

  public void visitDefinitionOrExpr(final GNode n) {
    dispatch(n.getNode(0));
    if (n.getNode(1) != null) {
      printer.p(";;");
    }
    printer.p("\n");
  }

  public void visitLetBindingDef(final GNode n) {
    printer.p("let ");
    if (null != n.getString(0)) {
      printer.p("rec ");
    }
    dispatch(n.getNode(1));
  }

  public void visitModuleDeclaration(final GNode n) {
    printer.p("module ");
    dispatch(n.getNode(0));
    printer.p(" = ");
    dispatch(n.getNode(1));
  }

  public void visitModName(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitOpenModule(final GNode n) {
    printer.p("open ");
    dispatch(n.getNode(0));
  }

  public void visitIncludeModule(final GNode n) {
    printer.p("include ");
    dispatch(n.getNode(0));
  }

  public void visitExternalDefinition(final GNode n) {
    printer.p("external ");
    printer.p(n.getString(0));
    printer.p(" : ");
    dispatch(n.getNode(1));
    printer.p(" = ");
    dispatch(n.getNode(2));
  }

  // ------------------------------ Undefined for now
  // ------------------------------
  // generic ExternalDeclaration = "todo":Word;
  // ------------------------------ Constants ------------------------------
  public void visitFloatingConstant(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitIntegerConstant(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitCharacterConstant(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitStringConstant(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitBooleanConstant(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitUnitConstant(final GNode n) {
    printer.p("()");
  }

  public void visitEmptyListConstant(final GNode n) {
    printer.p("[]");
  }

  public void visitVoidConstant(final GNode n) {
    printer.p("void");
  }

  // ------------------------------ FactoryFactory
  // ------------------------------
  public void visitNodeVariable(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitNodeListVariable(final GNode n) {
    printer.p("#");
    printer.p("[");
    printer.p(n.getString(0));
    printer.p("]");
  }

  // ------------------------------ Lists ------------------------------
  public void visitFieldTypeList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p("; ");
      dispatch(n.getNode(i));
    }
  }

  public void visitTypeDefList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" and ");
      dispatch(n.getNode(i));
    }
  }

  public void visitFieldDeclList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
      printer.pln(";").indent();
    }
  }

  public void visitTypeParamList(final GNode n) {
    int i = 0;
    for (Node constrDecl : n.<Node> getList(0)) {
      if (i > 0)
        printer.p(", ");
      dispatch(constrDecl);
      i++;
    }
  }

  public void visitConstrDeclList(final GNode n) {
    printer.incr();
    printer.pln().indent().p("   ");
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.pln().indent().p(" | ");
      dispatch(n.getNode(i));
    }
    printer.pln();
    printer.decr();
  }

  public void visitTypeExprList(final GNode n) {
    int i = 0;
    for (Node typeExpr : n.<Node> getList(0)) {
      if (i > 0)
        printer.p(" * ");
      dispatch(typeExpr);
      i++;
    }
  }

  public void visitParameters(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitPatterns(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.pln(" | ");
      dispatch(n.getNode(i));
    }
  }
}
