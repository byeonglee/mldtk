/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2009 New York University
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
package xtc.lang.babble.cql;

import java.util.Map;
import java.util.HashMap;

import xtc.lang.babble.util.Util;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.type.Type;

import xtc.util.SymbolTable;

/**
 * A translator from CQL to SRA.
 * 
 * @author Robert Soule
 * @version $Revision: 1.26 $
 */
public class CQLToSRA extends xtc.lang.babble.boat.Printer {
  /* a mapping from alias name to the table the stand in for */
  protected Map<String, String> aliases;

  private class AliasMapper extends Visitor {
    private Map<String, String> aliases;

    public AliasMapper() { /* do nothing */
    }

    public Map<String, String> map(Map<String, String> aliases, Node AST) {
      this.aliases = aliases;
      this.dispatch(AST);
      return this.aliases;
    }

    public void visit(final GNode n) {
      for (Object o : n) {
        if (o instanceof Node) {
          dispatch((Node) o);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
      }
    }

    public void visitFromItem(final GNode n) {
      if (n.size() > 2) {
        aliases.put(n.getString(2), n.getString(0));
      }
    }
  }

  private class AliasRemover extends Visitor {
    private Map<String, String> aliases;

    public AliasRemover() { /* do nothing */
    }

    public Node remove(Map<String, String> aliases, Node AST) {
      this.aliases = aliases;
      this.dispatch(AST);
      return AST;
    }

    public void visit(final GNode n) {
      for (Object o : n) {
        if (o instanceof Node) {
          dispatch((Node) o);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
      }
    }

    public void visitUpperID(final GNode n) {
      if (aliases.containsKey(n.getString(0))) {
        n.set(0, aliases.get(n.getString(0)));
      }
    }

    public void visitLowerID(final GNode n) {
      if (aliases.containsKey(n.getString(0))) {
        n.set(0, aliases.get(n.getString(0)));
      }
    }
  }

  private class DottedExpressionRemover extends Visitor {
    public Node remove(Node AST) {
      this.dispatch(AST);
      return AST;
    }

    public Node visit(final GNode n) {
      int i = 0;
      for (Object o : n) {
        if (o instanceof Node) {
          Object p = dispatch((Node) o);
          n.set(i, p);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
        i++;
      }
      return n;
    }

    public Node visitDottedExpression(final GNode n) {
      if ("ID".equals(n.getNode(1).getName())) {
        return n.getNode(1);
      } else
        return n;
    }
  }

  /** The printer. */
  protected final xtc.tree.Printer printer;
  /** The populated symbol table */
  private SymbolTable table;
  /** the current subtree root */
  private Node currentLeaf = null;

  /**
   * Create a new printer for CQL file.
   * 
   * @param printer
   *          The printer.
   */
  public CQLToSRA(xtc.tree.Printer printer, SymbolTable table) {
    super(printer);
    this.printer = printer;
    this.table = table;
    printer.register(this);
  }

  /**
   * Translate the CQL AST to SRA.
   * 
   * @param The
   *          root of the CQL AST.
   */
  public Node translate(Node root) {
    aliases = new HashMap<String, String>();
    aliases = new AliasMapper().map(aliases, root);
    return (Node) this.dispatch(root);
  }

  /**
   * Generic catch-all visit method
   */
  @Override
  public void visit(final GNode n) {
    for (Object o : n) {
      if (o instanceof Node) {
        dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
  }

  public Node visitCQLProgram(final GNode n) {
    GNode sraRoot = GNode.create("SRAProgram");
    for (int i = 0; i < n.size(); i++) {
      sraRoot.add(dispatch(n.getNode(i)));
    }
    return sraRoot;
  }

  public Node visitDecl(final GNode n) {
    GNode decl = GNode.create("Decl");
    decl.add(n.getString(0));
    decl.add(n.getNode(1));
    if (n.getNode(2) == null) {
      decl.add(null);
    } else {
      decl.add(dispatch(n.getNode(2)));
    }
    return decl;
  }

  public Node visitUnion(final GNode n) {
    GNode op = GNode.create("Union");
    GNode relQueryList = GNode.create("RelQueryList");
    relQueryList.add(dispatch(n.getNode(0)));
    relQueryList.add(dispatch(n.getNode(1)));
    op.add(relQueryList);
    op.add(Util.freshAlias(table));
    return op;
  }

  public Node visitRelQuery(final GNode n) {
    return visitQuery(n);
  }

  public Node visitStrQuery(final GNode n) {
    return visitQuery(n);
  }

  public Node visitQuery(final GNode n) {
    // visit the where clause
    if (n.getNode(2) != null) {
      dispatch(n.getNode(2));
    }
    Node subtreeRoot = (Node) dispatch(n.getNode(0));
    // This subtreeRoot will be either:
    // case 1: null
    // case 2: IStream/RStream/DStream
    // case 3: IStream/RStream/DStream(Project....)
    // the currentLeaf will be either:
    // case 1: null
    // case 2: IStream/RStream/DStream
    // case 3: RelQueryList
    /************* What do we add to the currentLeaf *************/
    Node op = null;
    // Case 1: There is a join that will be added to either the
    int numTables = n.getNode(1).getNode(0).size();
    if (numTables > 1) {
      op = GNode.create("Join");
      op.add(n.getNode(2));
      GNode relQueryList = GNode.create("RelQueryList");
      Node fromItems = n.getNode(1).getNode(0);
      for (int i = 0; i < fromItems.size(); i++) {
        Node relQuery = (Node) dispatch(fromItems.getNode(i));
        /* Check for implicit now */
        if ("Stream".equals(relQuery.getName())) {
          GNode now = GNode.create("Now");
          now.add(relQuery);
          relQueryList.add(now);
        } else {
          relQueryList.add(relQuery);
        }
      }
      op.add(relQueryList);
      op.add(Util.freshAlias(table));
      // This is a select * from relation, relation
      if (currentLeaf == null) {
        return op;
      }
      // otherwise, we want to add to whatever the leaf is, and return whatever
      // the root is
      currentLeaf.add(op);
      return subtreeRoot;
    }
    // Case 2: We have a selection
    if (n.getNode(2) != null) {
      op = GNode.create("Select");
      op.add(n.getNode(2));
      GNode relQueryList = GNode.create("RelQueryList");
      Node fromItems = n.getNode(1).getNode(0);
      for (int i = 0; i < fromItems.size(); i++) {
        Node relQuery = (Node) dispatch(fromItems.getNode(i));
        /* Check for implicit now */
        if ("Stream".equals(relQuery.getName())) {
          GNode now = GNode.create("Now");
          now.add(relQuery);
          relQueryList.add(now);
        } else {
          relQueryList.add(relQuery);
        }
      }
      op.add(relQueryList);
      if (currentLeaf == null) {
        return op;
      }
      // otherwise, we want to add to whatever the leaf is, and return whatever
      // the root is
      currentLeaf.add(op);
      return subtreeRoot;
    }
    // Case 3: No join or selection
    op = (Node) dispatch(n.getNode(1).getNode(0).getNode(0));
    if (currentLeaf == null) {
      return op;
    }
    // otherwise, we want to add to whatever the leaf is, and return whatever
    // the root is
    /* Check for implicit now */
    if (("Stream".equals(op.getName()))
        && ("RelQueryList".equals(currentLeaf.getName()))) {
      GNode now = GNode.create("Now");
      now.add(op);
      currentLeaf.add(now);
    } else {
      currentLeaf.add(op);
    }
    return subtreeRoot;
  }

  public Node visitSelectRel(final GNode n) {
    currentLeaf = null;
    ;
    if ("Star".equals(n.getNode(1).getName())) {
      currentLeaf = null;
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        currentLeaf = distinct;
        return distinct;
      } else {
        return null;
      }
    }
    boolean isAggregate = false;
    Node selectItems = n.getNode(1);
    for (int i = 0; i < selectItems.size(); i++) {
      String nodeName = selectItems.getNode(i).getName();
      if ("Avg".equals(nodeName) || "Count".equals(nodeName)
          || "Sum".equals(nodeName)) {
        isAggregate = true;
      }
    }
    if (isAggregate) {
      GNode aggregate = GNode.create("Aggregate");
      GNode identifierList = GNode.create("IdentifierList");
      GNode aggregateExpList = GNode.create("AggregateExpList");
      GNode relQueryList = GNode.create("RelQueryList");
      for (int i = 0; i < selectItems.size(); i++) {
        Node selectItem = selectItems.getNode(i);
        String nodeName = selectItem.getName();
        if ("Attribute".equals(nodeName)) {
          identifierList.add(selectItem.getString(0));
        } else if ("Alias".equals(nodeName)) {
          System.err.println("CQLToSRA::visitSelectRel alias in attribute");
        } else {
          String aggregateFunc = null;
          String attribute = null;
          String alias = null;
          if ("Count".equals(nodeName)) {
            aggregateFunc = "count";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(1);
          } else if ("Sum".equals(nodeName)) {
            aggregateFunc = "sum";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(0);
          } else if ("Avg".equals(nodeName)) {
            aggregateFunc = "avg";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(0);
          } else {
            System.err
                .println("CQLToSRA::visitSelectRel unidentified aggregator type.");
            return null;
          }
          GNode aggregateExp = GNode.create("AggregateExp");
          aggregateExp.add(aggregateFunc);
          aggregateExp.add(attribute);
          aggregateExp.add(alias);
          aggregateExpList.add(aggregateExp);
        }
      }
      aggregate.add(identifierList);
      aggregate.add(aggregateExpList);
      aggregate.add(relQueryList);
      currentLeaf = relQueryList;
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        distinct.add(aggregate);
        return distinct;
      } else {
        return aggregate;
      }
    } else {
      GNode project = GNode.create("Project");
      GNode aliasList = GNode.create("AliasList");
      for (int i = 0; i < selectItems.size(); i++) {
        aliasList.add(dispatch(selectItems.getNode(i)));
      }
      project.add(aliasList);
      GNode relQueryList = GNode.create("RelQueryList");
      project.add(relQueryList);
      currentLeaf = relQueryList;
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        distinct.add(project);
        return distinct;
      } else {
        return project;
      }
    }
  }

  public Node visitSelectStr(final GNode n) {
    currentLeaf = null;
    ;
    if ("Star".equals(n.getNode(1).getName())) {
      GNode op = GNode.create("IStream");
      currentLeaf = op;
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        op.add(distinct);
        currentLeaf = distinct;
      }
      return op;
    }
    boolean isAggregate = false;
    Node selectItems = n.getNode(1);
    for (int i = 0; i < selectItems.size(); i++) {
      String nodeName = selectItems.getNode(i).getName();
      if ("Avg".equals(nodeName) || "Count".equals(nodeName)
          || "Sum".equals(nodeName)) {
        isAggregate = true;
        break;
      }
    }
    if (isAggregate) {
      GNode aggregate = GNode.create("Aggregate");
      GNode identifierList = GNode.create("IdentifierList");
      GNode aggregateExpList = GNode.create("AggregateExpList");
      GNode relQueryList = GNode.create("RelQueryList");
      for (int i = 0; i < selectItems.size(); i++) {
        Node selectItem = selectItems.getNode(i);
        String nodeName = selectItem.getName();
        if ("Attribute".equals(nodeName)) {
          identifierList.add(selectItem.getString(0));
        } else if ("Alias".equals(nodeName)) {
          System.err.println("CQLToSRA::visitSelectRel alias in attribute");
        } else {
          String aggregateFunc = null;
          String attribute = null;
          String alias = null;
          if ("Count".equals(nodeName)) {
            aggregateFunc = "count";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(1);
          } else if ("Sum".equals(nodeName)) {
            aggregateFunc = "sum";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(0);
          } else if ("Avg".equals(nodeName)) {
            aggregateFunc = "avg";
            attribute = selectItem.getString(0);
            alias = selectItem.getString(0);
          } else {
            System.err
                .println("CQLToSRA::visitSelectRel unidentified aggregator type.");
            return null;
          }
          GNode aggregateExp = GNode.create("AggregateExp");
          aggregateExp.add(aggregateFunc);
          aggregateExp.add(attribute);
          aggregateExp.add(alias);
          aggregateExpList.add(aggregateExp);
        }
      }
      aggregate.add(identifierList);
      aggregate.add(aggregateExpList);
      aggregate.add(relQueryList);
      currentLeaf = relQueryList;
      GNode istream = GNode.create("IStream");
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        istream.add(distinct);
        distinct.add(aggregate);
      } else {
        istream.add(aggregate);
      }
      return istream;
    } else {
      GNode op = GNode.create("IStream");
      GNode project = GNode.create("Project");
      GNode aliasList = GNode.create("AliasList");
      for (int i = 0; i < selectItems.size(); i++) {
        aliasList.add(dispatch(selectItems.getNode(i)));
      }
      project.add(aliasList);
      GNode relQueryList = GNode.create("RelQueryList");
      project.add(relQueryList);
      if (null != n.getString(0)) {
        GNode distinct = GNode.create("Distinct");
        op.add(distinct);
        distinct.add(project);
      } else {
        op.add(project);
      }
      currentLeaf = relQueryList;
      return op;
    }
  }

  public Node visitAttribute(final GNode n) {
    if (n.getString(1) == null) {
      GNode expr = GNode.create("LowerID", (n.getString(0)));
      return GNode.create("Alias", expr, n.getString(0));
    } else {
      // String str0 = n.getString(0);
      // String str1 = n.getString(1);
      // if (aliases.containsKey(str0)) {
      // str0 = aliases.get(n.getString(0));
      // }
      // GNode expr = GNode.create("DottedExpression",
      // GNode.create("LowerID", str0),
      // GNode.create("LowerID", str1)
      // );
      GNode expr = GNode.create("LowerID", (n.getString(1)));
      return GNode.create("Alias", expr, n.getString(1));
    }
  }

  public Node visitAggregate(final GNode n) {
    System.err.println("CQLToSRA::visitAggregate NOT IMPLEMENTED");
    return n;
  }

  public Node visitAlias(final GNode n) {
    new DottedExpressionRemover().remove(n);
    return n;
  }

  public Node visitSelectR2S(final GNode n) {
    GNode op = null;
    if ("istream".equals(n.getString(1))) {
      op = GNode.create("IStream");
    } else if ("rstream".equals(n.getString(1))) {
      op = GNode.create("RStream");
    } else {
      op = GNode.create("DStream");
    }
    currentLeaf = op;
    if (null != n.getString(0)) {
      GNode distinct = GNode.create("Distinct");
      op.add(distinct);
      currentLeaf = distinct;
    }
    // Is there a select list or a star?
    if (!"Star".equals(n.getNode(2).getName())) {
      GNode project = GNode.create("Project");
      GNode aliasList = GNode.create("AliasList");
      Node selectItems = n.getNode(2);
      for (int i = 0; i < selectItems.size(); i++) {
        aliasList.add(dispatch(selectItems.getNode(i)));
      }
      project.add(aliasList);
      GNode relQueryList = GNode.create("RelQueryList");
      project.add(relQueryList);
      currentLeaf.add(project);
      currentLeaf = relQueryList;
    }
    return op;
  }

  public Node visitFromItem(final GNode n) {
    String typeName = null;
    table.enter("gammaPrime");
    Type type = (Type) table.current().lookup(n.getString(0));
    table.exit();
    if ("record".equals(type.toStruct().getName())) {
      typeName = "Relation";
    } else {
      typeName = "Stream";
    }
    Node streamOrRelation = GNode.create(typeName, n.getString(0));
    if (n.getNode(1) != null) {
      Node window = (Node) dispatch(n.getNode(1));
      window.add(streamOrRelation);
      return window;
    } else {
      return streamOrRelation;
    }
  }

  public Node visitWindow(final GNode n) {
    return (Node) dispatch(n.getNode(0));
  }

  public Node visitNow(final GNode n) {
    return GNode.create("Now");
  }

  public Node visitRange(final GNode n) {
    GNode op = GNode.create("Range");
    op.add(n.getNode(1));
    return op;
  }

  public Node visitRows(final GNode n) {
    GNode op = GNode.create("Rows");
    op.add(n.getNode(1));
    return op;
  }

  public Node visitPartition(final GNode n) {
    GNode op = GNode.create("Partition");
    op.add(n.getString(1));
    op.add(n.getNode(2));
    return op;
  }

  public Node visitWhere(final GNode n) {
    new AliasRemover().remove(aliases, n);
    return n.getNode(0);
  }
}
