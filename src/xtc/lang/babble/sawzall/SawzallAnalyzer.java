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
package xtc.lang.babble.sawzall;

import xtc.lang.babble.boat.Analyzer;

import java.util.ArrayList;
import java.util.List;
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
 * A visitor to type check Sawzall.
 * 
 * @author Robert Soule
 * @version $Revision: 1.5 $
 */
public class SawzallAnalyzer extends Visitor {
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
  protected SymbolTable.Scope gammaB;

  /**
   * Create a new analyzer for Sawzall file.
   * 
   * @param runtime
   *          The runtime.
   */
  public SawzallAnalyzer(Runtime runtime) {
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

  public void visitSawzallProgram(final GNode n) {
    /* The first pass populates gamma prime */
    table.setScope(table.root());
    table.enter("gamma");
    gamma = table.current();
    table.exit();
    table.enter("gammaB");
    gammaB = table.current();
    table.exit();
    // analyzer the input
    dispatch(n.getNode(1));
    // analyzer the outputs
    dispatch(n.getNode(0));
    // analyzer the emits
    dispatch(n.getNode(2));
  }

  public Type visitIn(final GNode n) {
    Type recordType = (Type) boatAnalyzer.dispatch(n.getNode(1));
    gammaB.define(n.getString(0), recordType);
    return recordType;
  }

  public Type visitOut(final GNode n) {
    Node keyFieldType = n.getNode(2);
    Node valueFieldType = n.getNode(3);
    String keyName = keyFieldType.getString(0);
    String valueName = valueFieldType.getString(0);
    Type keyType = (Type) boatAnalyzer.dispatch(keyFieldType.getNode(1));
    Type valueType = (Type) boatAnalyzer.dispatch(valueFieldType.getNode(1));
    List<VariableT> members = new ArrayList<VariableT>();
    members.add(new VariableT(null, keyType, VariableT.Kind.FIELD, keyName));
    members
        .add(new VariableT(null, valueType, VariableT.Kind.FIELD, valueName));
    Type recordType = new StructT("record", members);
    gammaB.define(n.getString(0), recordType);
    return recordType;
  }

  public Type visitEmit(final GNode n) {
    Type declaredKeyValType = lookup(gammaB, n.getString(0), n);
    if (declaredKeyValType == ErrorT.TYPE) {
      runtime.error("Undeclared identifer " + n.getString(0)
          + " in emit statement.", n);
      return ErrorT.TYPE;
    }
    boatAnalyzer.setScope(gammaB);
    Type keyType = (Type) boatAnalyzer.dispatch(n.getNode(1));
    Type valueType = (Type) boatAnalyzer.dispatch(n.getNode(2));
    Type declaredKeyType = declaredKeyValType.toStruct().getMember(0)
        .toVariable().getType();
    Type declaredValueType = declaredKeyValType.toStruct().getMember(1)
        .toVariable().getType();
    if (!unify(declaredKeyType, keyType)) {
      runtime.error("Key types do not match. Expected type " + declaredKeyType
          + " got type of " + keyType, n);
      return ErrorT.TYPE;
    }
    if (!unify(declaredValueType, valueType)) {
      runtime.error("Value types do not match. Expected type "
          + declaredValueType + " got type of " + valueType, n);
      return ErrorT.TYPE;
    }
    return UNIT;
  }
}
