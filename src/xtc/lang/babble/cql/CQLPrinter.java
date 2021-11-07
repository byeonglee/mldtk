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

import xtc.tree.GNode;
import xtc.tree.Node;

/**
 * A pretty printer for CQL.
 * 
 * @author Robert Soule
 * @version $Revision: 1.12 $
 */
public class CQLPrinter extends xtc.lang.babble.sql.SQLPrinter {
  /** The printer. */
  protected final xtc.tree.Printer printer;

  /**
   * Create a new printer for CQL file.
   * 
   * @param printer
   *          The printer.
   */
  public CQLPrinter(xtc.tree.Printer printer) {
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

  public void visitSelectStr(final GNode n) {
    printer.p("select ");
    if (null != n.getString(0)) {
      printer.p("distinct ");
    }
    dispatch(n.getNode(1));
  }

  public void visitSelectR2S(final GNode n) {
    printer.p("select ");
    if (null != n.getString(0)) {
      printer.p("distinct ");
    }
    printer.p(n.getString(1));
    printer.p("(");
    dispatch(n.getNode(2));
    printer.p(")");
    printer.p(" ");
  }

  @Override
  public void visitFromItem(final GNode n) {
    printer.p(n.getString(0));
    if (n.getNode(1) != null) {
      dispatch(n.getNode(1));
    }
    if (n.size() > 2) {
      printer.p(" as ");
      printer.p(n.getString(2));
      printer.p(" ");
    }
  }

  public void visitWindow(final GNode n) {
    printer.p("[");
    dispatch(n.getNode(0));
    printer.p("]");
  }

  public void visitNow(final GNode n) {
    printer.p(n.getString(0));
  }

  public void visitRange(final GNode n) {
    printer.p(n.getString(0));
    dispatch(n.getNode(1));
  }

  public void visitRow(final GNode n) {
    printer.p(n.getString(0));
    dispatch(n.getNode(1));
  }

  public void visitPartition(final GNode n) {
    printer.p(n.getString(0));
    printer.p(" by ");
    printer.p(n.getString(1));
    printer.p(" rows ");
    dispatch(n.getNode(2));
  }
}
