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
package xtc.lang.babble.sql;

import xtc.lang.babble.boat.Analyzer;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Iterator;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.type.ErrorT;
import xtc.type.NumberT;
import xtc.type.Type;
import xtc.type.UnitT;
import xtc.type.StructT;
import xtc.type.VariableT;

import xtc.util.Runtime;
import xtc.util.SymbolTable;

/**
 * A visitor to type check SQL.
 * 
 * @author Robert Soule
 * @version $Revision: 1.43 $
 */
public class SQLAnalyzer extends Visitor {
  protected class FieldComparator implements Comparator<VariableT> {
    public int compare(VariableT var1, VariableT var2) {
      String t1Id = var1.toVariable().getName();
      String t2Id = var2.toVariable().getName();
      return t1Id.compareTo(t2Id);
    }
  }

  protected class SQLNameDefAnalyzer extends Visitor {
    protected final Runtime runtime;
    /** The symbol table. */
    protected SymbolTable table;
    /** The type checker for BOAT expressions */
    protected Analyzer boatAnalyzer;

    /**
     * Create a new analyzer for SQL file.
     * 
     * @param runtime
     *          The runtime.
     */
    public SQLNameDefAnalyzer(Runtime runtime, SymbolTable table) {
      this.runtime = runtime;
      this.table = table;
      this.boatAnalyzer = new Analyzer(runtime, this.table);
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

    public void visitDecl(final GNode n) {
      final String id = n.getString(0);
      Type type = (Type) dispatch(n.getNode(1));
      gammaPrime.define(id, type);
      dispatch(n.getNode(1));
      if (n.getNode(2) != null) {
        dispatch(n.getNode(2));
      }
    }

    public Type visitRelType(final GNode n) {
      return (Type) boatAnalyzer.dispatch(n.getNode(0));
    }
  }

  /** The canonical unit type. */
  public static final Type UNIT;
  /** The canonical signed int type. */
  public static final Type S_INT;
  static {
    UNIT = new UnitT();
    S_INT = NumberT.S_INT;
  }
  /** The runtime. */
  protected final Runtime runtime;
  /** The symbol table. */
  protected SymbolTable table;
  /** The type checker for BOAT expressions */
  protected Analyzer boatAnalyzer;
  /** The number of the query. */
  protected int queryId = 0;
  /** The scopes used during type analysis */
  protected SymbolTable.Scope gamma;
  protected SymbolTable.Scope gammaPrime;
  protected SymbolTable.Scope gammaB;
  protected SymbolTable.Scope gammaStar;
  protected SymbolTable.Scope gammaExpr;

  /**
   * Create a new analyzer for SQL file.
   * 
   * @param runtime
   *          The runtime.
   */
  public SQLAnalyzer(Runtime runtime) {
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
  public void analyze(Node unit, SymbolTable table) {
    this.table = table;
    this.boatAnalyzer = new Analyzer(runtime, this.table);
    dispatch(unit);
  }

  // =========================================================================
  public Type lookup(SymbolTable.Scope scope, String name, final GNode n) {
    Type type = (Type) scope.lookup(name);
    if (type == null) {
      runtime.error("Undeclared Identifier: " + name, n);
      return ErrorT.TYPE;
    } else
      return type;
  }

  public boolean unify(Type t1, Type t2) {
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

  // =========================================================================
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

  public void visitSQLProgram(final GNode n) {
    /* The first pass populates gamma prime */
    table.setScope(table.root());
    table.enter("gamma");
    gamma = table.current();
    table.exit();
    table.enter("gammaPrime");
    gammaPrime = table.current();
    table.exit();
    /* The first pass populates gamma prime */
    SQLNameDefAnalyzer nameAnalyzer = new SQLNameDefAnalyzer(runtime, table);
    for (int i = 0; i < n.size(); i++) {
      nameAnalyzer.dispatch(n.getNode(i));
    }
    /* The second pass verifies the types */
    for (int i = 0; i < n.size(); i++) {
      if (UNIT != (Type) dispatch(n.getNode(i))) {
        runtime
            .error("Query does not produce the declared type.", n.getNode(i));
      }
    }
  }

  public Type visitDecl(final GNode n) {
    // If this decl has a query, then type check the query, and unify
    Type declaredType = lookup(gammaPrime, n.getString(0), n);
    if (n.getNode(2) != null) {
      Type queryType = (Type) dispatch(n.getNode(2));
      if (!unify(declaredType, queryType)) {
        runtime.error("Declaration types does not match query: "
            + queryType.toStruct().getName() + " "
            + queryType.toStruct().getMembers() + " is not "
            + declaredType.toStruct().getName() + " "
            + declaredType.toStruct().getMembers(), n);
        return ErrorT.TYPE;
      }
    }
    return UNIT;
  }

  public Type visitRelType(final GNode n) {
    return (Type) boatAnalyzer.dispatch(n.getNode(0));
  }

  public Type visitUnion(final GNode n) {
    Type t1 = (Type) dispatch(n.getNode(0));
    Type t2 = (Type) dispatch(n.getNode(1));
    if (!unify(t1, t2)) {
      runtime.error("Union input types do not match.", n);
      return ErrorT.TYPE;
    }
    return t1;
  }

  public Type visitRelQuery(final GNode n) {
    Type type = null;
    String freshId = "relquery" + queryId;
    queryId++;
    // create gamma*
    table.enter("gamma_star_" + freshId);
    gammaStar = table.current();
    table.exit();
    // create gammaB
    table.enter("gamma_B_" + freshId);
    gammaB = table.current();
    table.exit();
    // visit from clause. This will populate gammaStar
    dispatch(n.getNode(1));
    table.enter("gamma_exp_" + freshId);
    gammaExpr = table.current();
    table.exit();
    addAll(gamma, gammaExpr);
    addAll(gammaB, gammaExpr);
    addAll(gammaStar, gammaExpr);
    // visit select clause
    type = (Type) dispatch(n.getNode(0));
    // visit where clause if it exists
    if (n.getNode(2) != null) {
      if (UNIT != (Type) dispatch(n.getNode(2)))
        return ErrorT.TYPE;
    }
    // visit group by clause if it exists
    if (n.getNode(3) != null) {
      if (UNIT != (Type) dispatch(n.getNode(3)))
        return ErrorT.TYPE;
    }
    return type;
  }

  public Type visitSelectRel(final GNode n) {
    List<VariableT> members = null;
    if ("Star".equals(n.getNode(1).getName())) {
      members = this.visitStar((GNode) n.getNode(1));
    } else {
      members = this.visitSelectItems((GNode) n.getNode(1));
    }
    return new StructT("record", members);
  }

  public List<VariableT> visitStar(final GNode n) {
    List<VariableT> members = new ArrayList<VariableT>();
    String id;
    Type type;
    for (final Iterator<String> iter = gammaStar.symbols(); iter.hasNext();) {
      id = iter.next();
      type = (Type) gammaStar.lookup(id);
      members.add(new VariableT(null, type, VariableT.Kind.FIELD, id));
    }
    java.util.Collections.sort(members, new FieldComparator());
    return members;
  }

  public List<VariableT> visitSelectItems(final GNode n) {
    List<VariableT> members = new ArrayList<VariableT>();
    for (int i = 0; i < n.size(); i++) {
      Node item = n.getNode(i);
      // We have a few possibilities here:
      String itemId = null;
      Type type = null;
      if ("Alias".equals(item.getName())) {
        itemId = item.getString(1);
        boatAnalyzer.setScope(gammaExpr);
        type = (Type) boatAnalyzer.dispatch(item.getNode(0));
        /* todo: unify with the declared type */
      } else if ("Attribute".equals(item.getName())) {
        if ((item.size() == 1) || (null == item.get(1))) {
          itemId = item.getString(0);
          type = (Type) gammaExpr.lookup(itemId);
        } else {
          String structId = item.getString(0);
          itemId = item.getString(1);
          Type structType = (Type) gammaExpr.lookup(structId);
          if (structType == null) {
            runtime.error("Undeclared identifier " + structId, item);
            type = ErrorT.TYPE;
            continue;
          }
          type = structType.toStruct().lookup(itemId).toVariable().getType();
        }
      } else if ("Count".equals(item.getName())) {
        itemId = item.getString(1);
        type = S_INT;
        // type = (Type)gammaStar.lookup(item.getString(0));
      } else if ("Avg".equals(item.getName())) {
        itemId = item.getString(0);
      } else if ("Sum".equals(item.getName())) {
        itemId = item.getString(0);
      }
      // check gamma, gammaB, gammaStar
      if (type == null) {
        type = (Type) gammaB.lookup(itemId);
        if (type == null) {
          type = (Type) gammaStar.lookup(itemId);
        }
      }
      if (type == null) {
        runtime.error("Undeclared identifier " + itemId, n);
      } else {
        members.add(new VariableT(null, type, VariableT.Kind.FIELD, itemId));
      }
    }
    java.util.Collections.sort(members, new FieldComparator());
    return members;
  }

  public void visitAvg(final GNode n) {
    // printer.p(n.getString(0));
  }

  public void visitCount(final GNode n) {
    gammaExpr.define(n.getString(1), S_INT);
  }

  public void visitSum(final GNode n) {
    // printer.p(n.getString(0));
  }

  public Type visitFrom(final GNode n) {
    dispatch(n.getNode(0));
    return UNIT;
  }

  public Type visitFromItems(final GNode n) {
    // For each item that we get, we want to look it up in gammaPrime. It will
    // be a
    // relation type. We want to get the members of that relation, and check
    // that
    // each id, if it exists in another relation, has the same type;
    table.setScope(table.root());
    for (int i = 0; i < n.size(); i++) {
      Node item = n.getNode(i);
      String itemId = item.getString(0);
      Type itemType = lookup(gammaPrime, itemId, n);
      if (!itemType.isStruct()) {
        runtime.error("Unexpected typing error", n);
        return ErrorT.TYPE;
      }
      final List<VariableT> members = itemType.toStruct().getMembers();
      for (VariableT member : members) {
        String memberId = member.getName();
        Type memberType = member.getType();
        for (int j = 0; j < n.size(); j++) {
          Node relation = n.getNode(i);
          String relationId = relation.getString(0);
          Type relationType = lookup(gammaPrime, relationId, n);
          Type fieldType = relationType.toStruct().lookup(memberId);
          if (fieldType != ErrorT.TYPE) {
            if (!unify(memberType, fieldType.toVariable().getType())) {
              runtime
                  .error(memberId + " has conflicting type declarations ", n);
              continue;
            }
          }
          gammaStar.define(memberId, memberType);
        }
      }
      // build the gammaB
      dispatch(item);
    }
    return UNIT;
  }

  public Type visitFromItem(final GNode n) {
    String itemId = n.getString(0);
    Type itemType = lookup(gammaPrime, itemId, n);
    if (n.size() > 1) {
      gammaB.define(n.getString(1), itemType);
    }
    return itemType;
  }

  public void addAll(SymbolTable.Scope src, SymbolTable.Scope dst) {
    String id;
    Type type;
    for (final Iterator<String> iter = src.symbols(); iter.hasNext();) {
      id = iter.next();
      type = (Type) src.lookup(id);
      dst.define(id, type);
    }
  }

  public Type visitWhere(final GNode n) {
    boatAnalyzer.setScope(gammaExpr);
    if (ErrorT.TYPE == (Type) boatAnalyzer.dispatch(n.getNode(0))) {
      return ErrorT.TYPE;
    }
    return UNIT;
  }

  public Type visitGroup(final GNode n) {
    if (ErrorT.TYPE == (Type) dispatch(n.getNode(0))) {
      return ErrorT.TYPE;
    }
    return UNIT;
  }

  public Type visitGroupByItems(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (ErrorT.TYPE == (Type) dispatch(n.getNode(i))) {
        return ErrorT.TYPE;
      }
    }
    return UNIT;
  }

  public Type visitGroupByItem(final GNode n) {
    if (n.size() == 1) {
      return lookup(gammaExpr, n.getString(0), n);
    } else {
      Type relationType = lookup(gammaExpr, n.getString(0), n);
      Type fieldType = relationType.toStruct().lookup(n.getString(1));
      if (fieldType != ErrorT.TYPE) {
        return fieldType.toVariable().getType();
      }
      return ErrorT.TYPE;
    }
  }
}
