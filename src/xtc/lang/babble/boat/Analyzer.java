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

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.type.BooleanT;
import xtc.type.InternalT;
import xtc.type.NamedParameter;
import xtc.type.NumberT;
import xtc.type.ParameterizedT;
import xtc.type.ErrorT;
import xtc.type.StructT;
import xtc.type.Type;
import xtc.type.UnitT;
import xtc.type.VariableT;
import xtc.type.VoidT;

import xtc.util.Runtime;
import xtc.util.SymbolTable;

/**
 * A visitor to type check BOAT.
 * 
 * @author Robert Soule
 * @version $Revision: 1.25 $
 */
public class Analyzer extends Visitor {
  private class FieldComparator implements Comparator<VariableT> {
    public int compare(VariableT var1, VariableT var2) {
      String t1Id = var1.toVariable().getName();
      String t2Id = var2.toVariable().getName();
      return t1Id.compareTo(t2Id);
    }
  }

  /** The canonical character reference type. */
  public static final Type CHAR;
  /** The canonical boolean type. */
  public static final Type BOOL;
  /** The canonical float type. */
  public static final Type FLOAT;
  /** The canonical signed int type. */
  public static final Type S_INT;
  /** The canonical unit type. */
  public static final Type UNIT;
  /** The canonical void type. */
  public static final Type VOID;
  /** The canonical string type. */
  public static final Type STRING;
  /** The canonical parameterized list type. */
  public static final Type LIST;
  static {
    BOOL = new BooleanT();
    CHAR = NumberT.CHAR;
    FLOAT = NumberT.FLOAT;
    S_INT = NumberT.S_INT;
    UNIT = new UnitT();
    VOID = new VoidT();
    STRING = new InternalT("string");
    LIST = new ParameterizedT(new NamedParameter("element"), new InternalT(
        "list"));
  }
  /** The runtime. */
  private final Runtime runtime;
  /** The symbol table. */
  private SymbolTable table;
  /** The current scope in the symbol table. */
  SymbolTable.Scope currentScope;

  /**
   * Create a new analyzer for BOAT file.
   * 
   * @param runtime
   *          The runtime.
   * @param table
   *          The symbol table.
   */
  public Analyzer(Runtime runtime, SymbolTable table) {
    this.runtime = runtime;
    this.table = table;
    currentScope = table.root();
  }

  /**
   * Create a new analyzer for BOAT file.
   * 
   * @param runtime
   *          The runtime.
   */
  public Analyzer(Runtime runtime) {
    this.runtime = runtime;
    currentScope = table.root();
  }

  /**
   * Process the specified translation unit.
   * 
   * @param unit
   *          The translation unit.
   * @param table
   *          The symbol table.
   */
  public void analyze(Node unit, SymbolTable table) {
    this.table = table;
    dispatch(unit);
  }

  public void setScope(SymbolTable.Scope scope) {
    this.currentScope = scope;
  }

  // =========================================================================
  public Type lookup(String name, final GNode n) {
    if (currentScope == null) {
      runtime.error("Current scope not set " + name, n);
      return ErrorT.TYPE;
    }
    Type type = (Type) currentScope.lookup(name);
    if (type == null) {
      runtime.error("Undeclared Identifier: " + name, n);
      return ErrorT.TYPE;
    } else
      return type;
  }

  public boolean unify(Type t1, Type t2) {
    // System.out.println("xtc.lang.babble.boat.Analyzer::unify " + t1 + " " +
    // t2);
    if (t1 == null || t2 == null) {
      return false;
    } else if (t1.isStruct() && t2.isStruct()) {
      /* todo: if there are no members, this call will be null */
      /* need to check that case */
      if ((t1.toStruct().getMembers() == null)
          && (t2.toStruct().getMembers() == null)) {
        return true;
      } else if (((t1.toStruct().getMembers() == null) && (t2.toStruct()
          .getMembers() != null))
          || ((t1.toStruct().getMembers() != null) && (t2.toStruct()
              .getMembers() == null))) {
        return false;
      }
      /* check that they have the same number of fields */
      if (t1.toStruct().getMembers().size() != t2.toStruct().getMembers()
          .size()) {
        return false;
      }
      /* check that the fields are the same */
      final List<VariableT> t1Members = t1.toStruct().getMembers();
      final List<VariableT> t2Members = t2.toStruct().getMembers();
      int i = 0;
      for (Type lhs : t1Members) {
        Type rhs = t2Members.get(i);
        boolean unified = unify(lhs.toVariable().getType(), rhs.toVariable()
            .getType());
        if (!unified) {
          return false;
        }
        i++;
      }
      return true;
    } else if ((t1.isInternal() && t2.isInternal())
        && ("string".equals(t1.getName()) && "string".equals(t2.getName()))) {
      /* check if they are both string type */
      return true;
    } else {
      /* check that the basic types */
      switch (t1.tag()) {
      case BOOLEAN:
        return t2.isBoolean();
      case INTEGER:
        return t2.isInteger();
      case FLOAT:
        return t2.isFloat();
      default:
        return false;
      }
    }
  }

  // =========================================================================
  /**
   * Generic catch-all visit method
   */
  public Object visit(final GNode n) {
    Object retVal = null;
    for (Object o : n) {
      if (o instanceof Node) {
        retVal = dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
    return retVal;
  }

  // public void visitUnitInterface(final GNode n) {}
  // public void visitUnitImplementation(final GNode n) {}
  // ------------------------------ Type Expressions
  // ------------------------------
  // public void visitAliasedType(final GNode n) {}
  // public void visitFunctionType(final GNode n) {}
  // public void visitTupleType(final GNode n) {}
  // public void visitConstructedType(final GNode n) {}
  // public void visitNaryConstructedType(final GNode n) {}
  // public void visitNaryType(final GNode n) {}
  public Type visitBooleanType(final GNode n) {
    return BOOL;
  }

  public Type visitIntType(final GNode n) {
    return S_INT;
  }

  public Type visitFloat32(final GNode n) {
    return FLOAT;
  }

  public Type visitFloat64(final GNode n) {
    return FLOAT;
  }

  public Type visitStringType(final GNode n) {
    return STRING;
  }

  // public void visitAnyType(final GNode n) {}
  // public void visitUserDefinedType(final GNode n) {}
  // public void visitTypeVariable(final GNode n) {}
  // public void visitNary(final GNode n) {}
  // public void visitVariantDeclaration(final GNode n) {}
  public Type visitRecordDeclaration(final GNode n) {
    return visitFieldTypeList((GNode) n.getNode(0));
  }

  public Type visitFieldTypeList(final GNode n) {
    List<VariableT> members = new ArrayList<VariableT>();
    for (int i = 0; i < n.size(); i++) {
      Node field = n.getNode(i);
      Type fieldType = visitFieldType((GNode) field);
      members.add(new VariableT(null, fieldType, VariableT.Kind.FIELD, field
          .getString(0)));
    }
    java.util.Collections.sort(members, new FieldComparator());
    return new StructT("record", members);
  }

  // public void visitPolyVariantDeclaration(final GNode n) {}
  // public void visitPolyVariantType(final GNode n) {}
  // public void visitTypeConstructor(final GNode n) {}
  public Type visitFieldType(final GNode n) {
    return (Type) dispatch(n.getNode(1));
  }

  // public void visitPolyTypeConstructor(final GNode n) {}
  // -------------------------- Type and Exception Defs
  // ------------------------------
  // public void visitTypeDefinition(final GNode n) {}
  // public void visitTypeDef(final GNode n) {}
  // public void visitTypeRepresentation(final GNode n) {}
  // public void visitTypeParams(final GNode n) {}
  // public void visitConstrDecl(final GNode n) {}
  // public void visitFieldDecl(final GNode n) {}
  // public void visitTypeParam(final GNode n) {}
  // public void visitTypeParamPrefix(final GNode n) {}
  // public void visitTypeConstraint(final GNode n) {}
  // public void visitExceptionDefinition(final GNode n) {}
  // ------------------------- Refering to Named Object
  // --------------------------
  // public void visitValuePath(final GNode n) {}
  // public void visitConstr(final GNode n) {}
  // public void visitTypeConstr(final GNode n) {}
  // public void visitField(final GNode n) {}
  // public void visitModTypePath(final GNode n) {}
  // public void visitClassPath(final GNode n) {}
  // public void visitModulePath(final GNode n) {}
  // ------------------------------ Patterns ------------------------------
  // public void visitParameters(final GNode n) {}
  // public void visitParameter(final GNode n) {}
  // public void visitPatternMatching(final GNode n) {}
  // public void visitPatternMatch(final GNode n) {}
  // public void visitPatterns(final GNode n) {}
  // public void visitTuplePattern(final GNode n) {}
  // public void visitWhenPattern(final GNode n) {}
  // public void visitAsPattern(final GNode n) {}
  // public void visitTypedPattern(final GNode n) {}
  // public void visitConsPattern(final GNode n) {}
  // public void visitVariable(final GNode n) {}
  // public void visitParenthesisedPattern(final GNode n) {}
  // public void visitTypeConstructorPattern(final GNode n) {}
  // public void visitPatternParameters(final GNode n) {}
  // public void visitVariantPattern(final GNode n) {}
  // public void visitListPattern(final GNode n) {}
  // public void visitRecordPattern(final GNode n) {}
  // public void visitFieldPattern(final GNode n) {}
  // public void visitWildCard(final GNode n) {}
  // public void visitSequence(final GNode n) {}
  // public void visitTupleLiteral(final GNode n) {}
  public Type visitLogicalOrExpression(final GNode n) {
    if (!unify((Type) dispatch(n.getNode(0)), (Type) dispatch(n.getNode(1)))) {
      runtime.error("visitLogicalOrExpression type error", n);
      return ErrorT.TYPE;
    }
    return BOOL;
  }

  public Type visitLogicalAndExpression(final GNode n) {
    if (!unify((Type) dispatch(n.getNode(0)), (Type) dispatch(n.getNode(1)))) {
      runtime.error("visitLogicalAndExpression type error", n);
      return ErrorT.TYPE;
    }
    return BOOL;
  }

  public Type visitEqualityExpression(final GNode n) {
    if (!unify((Type) dispatch(n.getNode(0)), (Type) dispatch(n.getNode(2)))) {
      runtime.error("visitEqualityExpression type error", n);
      return ErrorT.TYPE;
    }
    return BOOL;
  }

  public Type visitRelationalExpression(final GNode n) {
    if (!unify((Type) dispatch(n.getNode(0)), (Type) dispatch(n.getNode(2)))) {
      runtime.error("visitRelationalExpression type error", n);
      return ErrorT.TYPE;
    }
    return BOOL;
  }

  public Type visitAdditiveExpression(final GNode n) {
    Type type = (Type) dispatch(n.getNode(0));
    if (!unify(type, (Type) dispatch(n.getNode(2)))) {
      runtime.error("visitAdditiveExpression type error", n);
      return ErrorT.TYPE;
    }
    return type;
  }

  public Type visitMultiplicativeExpression(final GNode n) {
    Type type = (Type) dispatch(n.getNode(0));
    if (!unify(type, (Type) dispatch(n.getNode(2)))) {
      runtime.error("visitMultiplicativeExpression type error", n);
      return ErrorT.TYPE;
    }
    return type;
  }

  // public void visitConcatenationExpression(final GNode n) {}
  // public void visitConsExpression(final GNode n) {}
  // public void visitFunctionApplication(final GNode n) {}
  // public void visitArguments(final GNode n) {}
  // public void visitPredicateArgument(final GNode n) {}
  public Type visitDottedExpression(final GNode n) {
    Type t1 = (Type) dispatch(n.getNode(0));
    if (t1.isStruct()) {
      Type t2 = t1.toStruct().lookup(n.getNode(1).getString(0));
      if (t2 == ErrorT.TYPE) {
        runtime.error("Undefined attribute access", n);
      } else {
        return t2.toVariable().getType();
      }
    }
    return ErrorT.TYPE;
  }

  // public void visitBlock(final GNode n) {}
  // public void visitParenthesized(final GNode n) {}
  // public void visitLetExpression(final GNode n) {}
  // public void visitLetBindings(final GNode n) {}
  // public void visitLetBinding(final GNode n) {}
  // public void visitFunctionExpression(final GNode n) {}
  // public void visitFunExpression(final GNode n) {}
  // public void visitMatchExpression(final GNode n) {}
  // public void visitRequireExpression(final GNode n) {}
  // public void visitRequireArgs(final GNode n) {}
  // public void visitMessageTag(final GNode n) {}
  // public void visitGuardExpression(final GNode n) {}
  // public void visitErrorClause(final GNode n) {}
  // public void visitAssertClause(final GNode n) {}
  public Type visitTupleConstructor(final GNode n) {
    return lookup(n.getString(0), n);
  }

  // public void visitRecordExpression(final GNode n) {}
  // public void visitWithExpression(final GNode n) {}
  // public void visitFieldAssignment(final GNode n) {}
  // public void visitIfExpression(final GNode n) {}
  // public void visitIfElseExpression(final GNode n) {}
  // public void visitListLiteral(final GNode n) {}
  public Type visitLogicalNegationExpression(final GNode n) {
    if (!unify(BOOL, (Type) dispatch(n.getNode(0)))) {
      return ErrorT.TYPE;
    }
    return BOOL;
  }

  // public void visitReduceExpression(final GNode n) {}
  // public void visitReduceOptions(final GNode n) {}
  public Type visitID(final GNode n) {
    return lookup(n.getString(0), n);
  }

  public Type visitLowerID(final GNode n) {
    return lookup(n.getString(0), n);
  }

  public Type visitUpperID(final GNode n) {
    return lookup(n.getString(0), n);
  }

  // ------------------------------ Module types ------------------------------
  // public void visitSpecification(final GNode n) {}
  // ------------------------------ Module Expressions
  // ------------------------------
  // public void visitModulePathExpr(final GNode n) {}
  // public void visitStructExpr(final GNode n) {}
  // public void visitFunctorExpr(final GNode n) {}
  // public void visitParenthesizedExpr(final GNode n) {}
  // public void visitDefinitionOrExpr(final GNode n) {}
  // public void visitLetBindingDef(final GNode n) {}
  // public void visitModuleDeclaration(final GNode n) {}
  // public void visitModName(final GNode n) {}
  // public void visitOpenModule(final GNode n) {}
  // public void visitIncludeModule(final GNode n) {}
  // public void visitExternalDefinition(final GNode n) {}
  // ------------------------------ Constants ------------------------------
  public Type visitFloatingConstant(final GNode n) {
    return FLOAT;
  }

  public Type visitIntegerConstant(final GNode n) {
    return S_INT;
  }

  public Type visitCharacterConstant(final GNode n) {
    return CHAR;
  }

  public Type visitStringConstant(final GNode n) {
    return STRING;
  }

  public Type visitBooleanConstant(final GNode n) {
    return BOOL;
  }

  public Type visitUnitConstant(final GNode n) {
    return UNIT;
  }

  public Type visitEmptyListConstant(final GNode n) {
    // Todo: This should be an alpha list, not just a list
    return LIST;
  }

  public Type visitVoidConstant(final GNode n) {
    return VOID;
  }
}
