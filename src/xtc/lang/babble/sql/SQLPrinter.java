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
package xtc.lang.babble.sql;

import xtc.tree.GNode;
import xtc.tree.Node;

/**
 * A pretty printer for SQL.
 * 
 * @author Robert Soule
 * @version $Revision: 1.11 $
 */
public class SQLPrinter extends xtc.lang.babble.boat.Printer {
  /** The printer. */
  protected final xtc.tree.Printer printer;

  /**
   * Create a new printer for SQL file.
   * 
   * @param printer
   *          The printer.
   */
  public SQLPrinter(xtc.tree.Printer printer) {
    super(printer);
    this.printer = printer;
    printer.register(this);
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

  // Identifier void:":":Symbol RelType (void:"=":Symbol Query)? void:";":Symbol
  // ;
  public void visitDecl(final GNode n) {
    printer.p(n.getString(0));
    printer.p(" : ");
    dispatch(n.getNode(1));
    if (n.getNode(2) != null) {
      printer.pln(" = ");
      dispatch(n.getNode(2));
    }
    printer.pln(";");
  }

  // RecordDeclaration void:"relation":Keyword ;
  public void visitRelType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" relation");
  }

  // <Union> Query void:"union":Keyword Union
  public void visitUnion(final GNode n) {
    dispatch(n.getNode(0));
    printer.pln("union");
    dispatch(n.getNode(1));
  }

  // void:"select":Keyword SelectList ;
  public void visitSelectRel(final GNode n) {
    printer.p("select ");
    if (null != n.getString(0)) {
      printer.p("distinct ");
    }
    dispatch(n.getNode(1));
  }

  public void visitStar(final GNode n) {
    printer.p("* ");
  }

  // = SelectItem (void:",":Symbol SelectItem)* ;
  public void visitSelectItems(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
    printer.p(" ");
  }

  // Identifier (void:".":Symbol Identifier)? ;
  public void visitAttribute(final GNode n) {
    printer.p(n.getString(0));
    if (n.getString(1) != null) {
      printer.p(".");
      printer.p(n.getString(1));
      printer.p(" ");
    }
  }

  public void visitAvg(final GNode n) {
    printer.p("avg");
    printer.p("(");
    printer.p(n.getString(0));
    printer.p(")");
  }

  public void visitCount(final GNode n) {
    printer.p("count");
    printer.p("(");
    printer.p(n.getString(0));
    printer.p(")");
    printer.p(" as ");
    printer.p(n.getString(1));
    ;
  }

  public void visitSum(final GNode n) {
    printer.p("sum");
    printer.p("(");
    printer.p(n.getString(0));
    printer.p(")");
  }

  // Expression void:"as":Keyword Identifier ;
  public void visitAlias(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" as ");
    printer.p(n.getString(1));
    printer.p(" ");
  }

  // void:"from":Keyword FromItem_pc;
  public void visitFrom(final GNode n) {
    printer.p("from ");
    dispatch(n.getNode(0));
  }

  // FromItem (void:",":Symbol FromItem)* ;
  public void visitFromItems(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
    printer.p(" ");
  }

  // Identifier void:"as":Keyword Identifier
  // Identifier ;
  public void visitFromItem(final GNode n) {
    printer.p(n.getString(0));
    if (n.size() > 1) {
      printer.p(" as ");
      printer.p(n.getString(1));
      printer.p(" ");
    }
  }

  // void:"where":Keyword Expression ;
  public void visitWhere(final GNode n) {
    printer.p("where ");
    dispatch(n.getNode(0));
  }

  // void:"group":Keyword void:"by":Keyword GroupByItem_pc ;
  public void visitGroup(final GNode n) {
    printer.p(" group by ");
    dispatch(n.getNode(0));
  }

  // GroupByItem (void:",":Symbol GroupByItem)* ;
  public void visitGroupByItems(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
    printer.p(" ");
  }

  // = Identifier void:".":Symbol Identifier
  // / Identifier ;
  public void visitGroupByItem(final GNode n) {
    printer.p(n.getString(0));
    if (n.size() > 1) {
      printer.p(".");
      printer.p(n.getString(1));
      printer.p(" ");
    }
  }
}