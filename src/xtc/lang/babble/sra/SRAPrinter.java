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
package xtc.lang.babble.sra;

import xtc.tree.GNode;
import xtc.tree.Node;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */
public class SRAPrinter extends xtc.lang.babble.ra.RAPrinter {
  /** The printer. */
  protected final xtc.tree.Printer printer;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public SRAPrinter(xtc.tree.Printer printer) {
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

  public void visitStrType(final GNode n) {
    dispatch(n.getNode(0));
    printer.p(" stream");
  }

  public void visitStream(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitIStream(final GNode n) {
    printer.p("istream");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitDStream(final GNode n) {
    printer.p("dstream");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitRStream(final GNode n) {
    printer.p("rstream");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitR2SOp(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitNow(final GNode n) {
    printer.p("now");
    printer.p("(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  public void visitRange(final GNode n) {
    printer.p("range");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(")");
  }

  public void visitRows(final GNode n) {
    printer.p("rows");
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(")");
  }

  public void visitPartition(final GNode n) {
    printer.p("partition");
    printer.p("[");
    printer.p(n.getString(0));
    printer.p(", ");
    dispatch(n.getNode(1));
    printer.p("]");
    printer.p("(");
    dispatch(n.getNode(2));
    printer.p(")");
  }
}
