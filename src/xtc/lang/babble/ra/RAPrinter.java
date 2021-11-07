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
package xtc.lang.babble.ra;

import xtc.tree.GNode;
import xtc.tree.Node;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */
public class RAPrinter extends xtc.lang.babble.boat.Printer {
  /** The printer. */
  protected final xtc.tree.Printer printer;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public RAPrinter(xtc.tree.Printer printer) {
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

  public void visitRelType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" relation");
  }

  public void visitRelation(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitUnion(final GNode n) {
    printer.p("union");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(") as ");
    printer.p(n.getString(1));
  }

  public void visitProject(final GNode n) {
    printer.p("project");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(")");
  }

  public void visitSelect(final GNode n) {
    printer.p("select");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(")");
  }

  public void visitJoin(final GNode n) {
    printer.p("join");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(") as ");
    printer.p(n.getString(2));
  }

  public void visitDistinct(final GNode n) {
    printer.p("distinct");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitAggregate(final GNode n) {
    printer.p("aggregate");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("; ");
    dispatch(n.getNode(1));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(2));
    printer.p(")");
  }

  public void visitAggregateExp(final GNode n) {
    printer.p(n.getString(0));
    printer.p("(");
    printer.p(n.getString(1));
    printer.p(")");
    printer.p(" as ");
    printer.p(n.getString(2));
  }

  public void visitAlias(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" as ");
    printer.p(n.getString(1));
  }

  public void visitRelQueryList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
  }

  public void visitAggregateExpList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
  }

  public void visitAliasList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
  }

  public void visitIdentifierList(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      printer.p(n.getString(i));
    }
  }
}
