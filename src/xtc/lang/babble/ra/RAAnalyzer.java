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
package xtc.lang.babble.ra;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.type.ErrorT;
import xtc.type.NumberT;
import xtc.type.Type;
import xtc.type.UnitT;
import xtc.type.VariableT;

import xtc.type.StructT;
import xtc.util.Runtime;
import xtc.util.SymbolTable;

/*
 * A visitor to type check RA.
 *
 * @author Robert Soule
 * @version $Revision: 1.26 $
 */
public class RAAnalyzer extends Visitor {
  /*
   * Every visit method corresponding to a type rule should return a type and an
   * identifier
   */
  protected class IdAndType {
    public IdAndType(String id, Type type) {
      this.id = id;
      this.type = type;
    }

    public String id;
    public Type type;
  }

  /** The runtime. */
  protected final Runtime runtime;
  /** The symbol table. */
  protected SymbolTable table;
  /** The top level environment with pre-defined functions */
  protected SymbolTable.Scope gamma;
  /** The environment with relation names */
  protected SymbolTable.Scope gammaB;
  /** The type checker for BOAT expressions */
  protected xtc.lang.babble.boat.Analyzer boatAnalyzer;
  /** An id number to distinguish operator instances **/
  protected int operatorId = 0;
  protected Map<String, Integer> splits = null;
  protected Map<String, String> dups = null;
  /** The canonical unit type. */
  public static final Type UNIT;
  /** The canonical signed int type. */
  public static final Type S_INT;
  static {
    UNIT = new UnitT();
    S_INT = NumberT.S_INT;
  }

  /**
   * Create a new analyzer for RA file.
   * 
   * @param runtime
   *          The runtime.
   */
  public RAAnalyzer(Runtime runtime) {
    this.runtime = runtime;
  }

  /**
   * Process the specified translation unit.
   * 
   * @param unit
   *          The translation unit.
   * @param table
   *          The symbol table.
   */
  public void analyze(Node unit, SymbolTable table, Map<String, Integer> splits) {
    this.table = table;
    this.splits = splits;
    dups = new HashMap<String, String>();
    this.boatAnalyzer = new xtc.lang.babble.boat.Analyzer(runtime, this.table);
    dispatch(unit);
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

  public IdAndType visitRAProgram(final GNode n) {
    Type returnType = UNIT;
    // create gamma environment
    table.enter("gamma");
    gamma = table.current();
    table.exit();
    // create gammaB environment
    table.enter("gammaB");
    gammaB = table.current();
    table.exit();
    // populate gammaB with all declared relations
    for (int i = 0; i < n.size(); i++) {
      Node decl = n.getNode(i);
      String id = decl.getString(0);
      Type type = (Type) boatAnalyzer.dispatch(decl.getNode(1).getNode(0));
      gammaB.define(id, type);
    }
    // visit each declaration, assert that each has unit type
    for (int i = 0; i < n.size(); i++) {
      Node decl = n.getNode(i);
      IdAndType iat = (IdAndType) dispatch(decl);
      if (iat.type != UNIT) {
        runtime.error("Query does not produce the declared type.", decl);
        returnType = ErrorT.TYPE;
      }
    }
    return new IdAndType("program", returnType);
  }

  public IdAndType visitDecl(final GNode n) {
    Type returnType = ErrorT.TYPE;
    // If there is no query, then simply retur the UNIT type
    if (n.getNode(2) == null) {
      return new IdAndType(n.getString(0), UNIT);
    }
    // If there is a query, check to see if the query matches
    // the declared type
    IdAndType iat = (IdAndType) dispatch(n.getNode(2));
    Type declaredType = lookup(gammaB, n.getString(0), n);
    if (unify(declaredType, iat.type)) {
      returnType = UNIT;
    }
    if (splits.containsKey(n.getString(0))) {
      int numSplits = splits.get(n.getString(0));
      for (int i = 0; i < numSplits; i++) {
        String name = n.getString(0) + "_dup" + i;
        gammaB.define(name, declaredType);
        dups.put(name, n.getString(0));
      }
      operatorId++;
    }
    return new IdAndType(n.getString(0), returnType);
  }

  public IdAndType visitRelation(final GNode n) {
    operatorId++;
    return new IdAndType(n.getString(0), lookup(gammaB, n.getString(0), n));
  }

  public IdAndType visitSelect(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "select" + operatorId + "_out";
    operatorId++;
    /* Make the gammaExpr */
    table.enter("gamma_" + freshId + "_expr");
    SymbolTable.Scope gammaExpr = table.current();
    table.exit();
    /*
     * Get the input relation. Note that there should be only one, but not
     * enforced
     */
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Select operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      for (Type member : relation.type.toStruct().getMembers()) {
        gammaExpr.define(member.getName(), member.toVariable().getType());
      }
      returnType = new StructT("record", relation.type.toStruct().getMembers());
    }
    boatAnalyzer.setScope(gammaExpr);
    if (ErrorT.TYPE == (Type) boatAnalyzer.dispatch(n.getNode(0))) {
      runtime.error("Select expression does not type check.", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  public IdAndType visitProject(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "project" + operatorId + "_out";
    operatorId++;
    /* make the gammaExpr */
    table.enter("gamma_" + freshId + "_expr");
    SymbolTable.Scope gammaExpr = table.current();
    table.exit();
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Project operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      gammaExpr.define(relation.id, relation.type);
      for (Type member : relation.type.toStruct().getMembers()) {
        gammaExpr.define(member.getName(), member.toVariable().getType());
      }
    }
    boatAnalyzer.setScope(gammaExpr);
    Node aliasList = n.getNode(0);
    List<VariableT> members = new ArrayList<VariableT>();
    for (int i = 0; i < aliasList.size(); i++) {
      Node alias = aliasList.getNode(i);
      Type aliasType = (Type) boatAnalyzer.dispatch(alias.getNode(0));
      members.add(new VariableT(null, aliasType, VariableT.Kind.FIELD, alias
          .getString(1)));
    }
    java.util.Collections.sort(members, new FieldComparator());
    returnType = new StructT("record", members);
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  public IdAndType visitAggregate(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "aggregate" + operatorId + "_out";
    operatorId++;
    /* make the gammaExpr */
    table.enter("gamma_" + freshId + "_expr");
    SymbolTable.Scope gammaExpr = table.current();
    table.exit();
    Node identifierList = n.getNode(0);
    Node aggregateExprList = n.getNode(1);
    Node relQueryList = n.getNode(2);
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Aggregate operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      for (Type member : relation.type.toStruct().getMembers()) {
        gammaExpr.define(member.getName(), member.toVariable().getType());
      }
      returnType = new StructT("record", relation.type.toStruct().getMembers());
    }
    List<VariableT> members = new ArrayList<VariableT>();
    for (int i = 0; i < identifierList.size(); i++) {
      Type identifierType = lookup(gammaExpr, identifierList.getString(i), n);
      members.add(new VariableT(null, identifierType, VariableT.Kind.FIELD,
          identifierList.getString(i)));
    }
    for (int i = 0; i < aggregateExprList.size(); i++) {
      /* todo: special case for count. Should always be int output type */
      Type attributeType = lookup(gammaExpr, aggregateExprList.getNode(i)
          .getString(1), n);
      if ("count".equals(aggregateExprList.getNode(i).getString(0))) {
        attributeType = S_INT;
      }
      members.add(new VariableT(null, attributeType, VariableT.Kind.FIELD,
          aggregateExprList.getNode(i).getString(2)));
    }
    java.util.Collections.sort(members, new FieldComparator());
    returnType = new StructT("record", members);
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  public IdAndType visitUnion(final GNode n) {
    String freshId = Character.toLowerCase(n.getString(1).charAt(0))
        + n.getString(1).substring(1);
    operatorId++;
    Type returnType = ErrorT.TYPE;
    Node relQueryList = n.getNode(0);
    IdAndType lastRelation = null;
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      returnType = relation.type;
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Union operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      if (lastRelation != null) {
        if (!unify(lastRelation.type, relation.type)) {
          runtime.error(
              "Union operator expects input relations to have the same types.",
              n);
          return new IdAndType(freshId, ErrorT.TYPE);
        }
      }
      lastRelation = relation;
    }
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  public IdAndType visitJoin(final GNode n) {
    String freshId = Character.toLowerCase(n.getString(2).charAt(0))
        + n.getString(2).substring(1);
    operatorId++;
    table.enter("gamma_" + freshId + "_expr");
    SymbolTable.Scope gammaExpr = table.current();
    table.exit();
    Map<String, Type> outputAttributes = new HashMap<String, Type>();
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Join operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      gammaExpr.define(relation.id, relation.type);
      if (dups.containsKey(relation.id)) {
        String preDupName = dups.get(relation.id);
        gammaExpr.define(preDupName, relation.type);
      }
      for (Type member : relation.type.toStruct().getMembers()) {
        if (outputAttributes.containsKey(member.getName())) {
          Type t = outputAttributes.get(member.getName());
          if (!unify(t.toVariable().getType(), member.toVariable().getType())) {
            runtime.error(
                "Conflicting type declarations in attributes to join", n);
            return new IdAndType(freshId, ErrorT.TYPE);
          }
        } else {
          outputAttributes.put(member.getName(), member);
          gammaExpr.define(member.getName(), member.toVariable().getType());
        }
      }
    }
    List<VariableT> members = new ArrayList<VariableT>();
    for (Type fieldType : outputAttributes.values()) {
      members.add(fieldType.toVariable());
    }
    boatAnalyzer.setScope(gammaExpr);
    if (ErrorT.TYPE == (Type) boatAnalyzer.dispatch(n.getNode(0))) {
      System.out.println("Name of node is " + n.getNode(0).getName());
      runtime.error("Join condition doesn't type check.", n);
    }
    java.util.Collections.sort(members, new FieldComparator());
    StructT result = new StructT("record", members);
    gammaB.define(freshId, result);
    return new IdAndType(freshId, result);
  }

  public IdAndType visitDistinct(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "distinct" + operatorId + "_out";
    operatorId++;
    List<VariableT> members = null;
    Node relQueryList = n.getNode(0);
    for (int i = 0; i < relQueryList.size(); i++) {
      Node relQuery = relQueryList.getNode(i);
      IdAndType relation = (IdAndType) dispatch(relQuery);
      if (!"record".equals(relation.type.getName())) {
        runtime.error("Distinct operator expects record types as input", n);
        return new IdAndType(freshId, ErrorT.TYPE);
      }
      members = relation.type.toStruct().getMembers();
    }
    returnType = new StructT("record", members);
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  // =========================================================================
  /*
   * A comparator for field types in a StrucT
   */
  private class FieldComparator implements Comparator<VariableT> {
    public int compare(VariableT var1, VariableT var2) {
      String t1Id = var1.toVariable().getName();
      String t2Id = var2.toVariable().getName();
      return t1Id.compareTo(t2Id);
    }
  }

  /**
   * Lookup a symbol in the symbol table. If it isn't there, signal an error.
   * 
   * @param scope
   *          The envornment in which to lookup the symbol
   * @param name
   *          The symbol to lookup
   * @param n
   *          The AST node conraining the symbol
   * @return The type of symbol, or ErrorT.TYPE if symbol is not found.
   */
  protected Type lookup(SymbolTable.Scope scope, String name, final GNode n) {
    Type type = (Type) scope.lookup(name);
    if (type == null) {
      runtime.error("Undeclared Identifier: " + name, n);
      return ErrorT.TYPE;
    } else
      return type;
  }

  /**
   * Returns true if two types are the same, false otherwise.
   * 
   * @param t1
   *          The first type.
   * @param t2
   *          The second type.
   * @return True if the types are the same, false otherwise.
   */
  protected boolean unify(Type t1, Type t2) {
    if (t1 == null || t2 == null) {
      return false;
    } else if (t1.isStruct() && t2.isStruct()) {
      /* ensure that they are both streams or both relations */
      if (!t1.toStruct().getName().equals(t2.toStruct().getName())) {
        return false;
      }
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
}
