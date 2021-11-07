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
package xtc.lang.babble.streamit;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.6 $
 */
public class StreamItPrinter extends xtc.lang.babble.boat.Printer {
  /** The printer. */
  protected final Printer printer;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public StreamItPrinter(Printer printer) {
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

  /** Visit the specified A node. */
  public void visitA(GNode n) {
    dispatch(n.getNode(0));
    printer.p(" <- ");
    printer.p(n.getString(1));
    printer.p("(");
    if (null != n.getNode(2)) {
      dispatch(n.getNode(2));
    }
    dispatch(n.getNode(3));
    printer.p("); ");
  }

  /** Visit the specified feedbackloop node. */
  public void visitFl(GNode n) {
    printer.incr();
    printer.pln("feedbackloop { ").indent();
    dispatch(n.getNode(0));
    printer.p(" body ");
    dispatch(n.getNode(1));
    printer.p(" loop ");
    dispatch(n.getNode(2));
    dispatch(n.getNode(3));
    printer.decr();
    printer.pln("}");
  }

  /** Visit the specified filter node. */
  public void visitFt(GNode n) {
    printer.p("filter { ");
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p("; ");
    }
    printer.p(" work { ");
    dispatch(n.getNode(1));
    dispatch(n.getNode(2));
    dispatch(n.getNode(3));
    printer.pln("} }").indent();
  }

  /** Visit the specified join node. */
  public void visitJn(GNode n) {
    printer.p("join ");
    printer.p(n.getString(0));
    printer.pln(";");
  }

  /** Visit the specified peek node. */
  public void visitPk(GNode n) {
    printer.p("peek(");
    dispatch(n.getNode(0));
    printer.p(")");
  }

  /** Visit the specified pipeline node. */
  public void visitPl(GNode n) {
    printer.incr();
    printer.pln("pipeline { ").indent();
    dispatch(n.getNode(0));
    printer.pln("}");
    printer.decr();
  }

  /** Visit the specified pop node. */
  public void visitPp(GNode n) {
    printer.p("pop(");
    printer.p("); ");
  }

  /** Visit the specified program node. */
  public void visitProgram(GNode n) {
    dispatch(n.getNode(0));
  }

  /** Visit the specified push node. */
  public void visitPs(GNode n) {
    printer.p("push(");
    printer.p(n.getString(0));
    printer.p("); ");
  }

  /** Visit the specified splitjoin node. */
  public void visitSj(GNode n) {
    printer.incr();
    printer.pln("splitjoin { ").indent();
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
    dispatch(n.getNode(2));
    printer.indent().pln("}").indent();
    printer.decr();
  }

  /** Visit the specified split node. */
  public void visitSp(GNode n) {
    printer.p("split ");
    printer.p(n.getString(0));
    printer.pln(";").indent();
  }

  public void visitPList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      // if (i > 0) printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitIdList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" ");
      printer.p(n.getString(i));
    }
  }

  public void visitPsList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitPpList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(" ");
      dispatch(n.getNode(i));
    }
  }

  public void visitPkList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      dispatch(n.getNode(i));
    }
  }

  public void visitIdCommaList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p(", ");
      printer.p(n.getString(i));
    }
  }

  public void visitIdSemiList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0)
        printer.p("; ");
      printer.p(n.getString(i));
    }
  }
}
