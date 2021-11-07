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
package xtc.lang.babble.brooklet;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.13 $
 */
public class BrookletPrinter extends Visitor {
  /** The printer. */
  protected final Printer printer;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public BrookletPrinter(Printer printer) {
    this.printer = printer;
    printer.register(this);
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

  /** Visit the specified identifier node. */
  public void visitIdentifier(GNode n) {
    printer.p(n.getString(0));
  }

  /** Visit the specified uppercase identifier node. */
  public void visitUppercaseIdentifier(GNode n) {
    printer.p(n.getString(0));
  }

  /** Visit the specified inputs node. */
  public void visitInputs(GNode n) {
    printer.p("input ");
    if (n.getNode(0) != null) {
      dispatch(n.getNode(0));
    }
    printer.pln(";");
  }

  /** Visit the specified integer constant node. */
  public void visitIntegerConstant(GNode n) {
    printer.p(n.getString(0));
  }

  /** Visit the specified operator node. */
  public void visitOperator(GNode n) {
    printer.p(n.getString(0));
  }

  /** Visit the specified stream node. */
  public void visitStream(GNode n) {
    printer.p(n.getString(0));
  }

  /** Visit the specified annotated stream node. */
  public void visitAnnotatedStream(GNode n) {
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p(" ");
    }
    printer.p(n.getString(1));
  }

  /** Visit the specified opInvoke node. */
  public void visitOpInvoke(GNode n) {
    if (null != n.getNode(0)) {
      dispatch(n.getNode(0));
      printer.p(" ");
    }
    printer.p("(");
    dispatch(n.getNode(1));
    printer.p(") <- ");
    dispatch(n.getNode(2));
    printer.p(" (");
    dispatch(n.getNode(3));
    printer.p(")");
    printer.pln(";");
  }

  /** Visit the specified outputs node. */
  public void visitOutputs(GNode n) {
    printer.p("output ");
    if (n.getNode(0) != null) {
      dispatch(n.getNode(0));
    }
    printer.pln(";");
  }

  public void visitStreamList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(", ");
      }
      dispatch(n.getNode(i));
    }
  }

  public void visitAnnotatedStreamList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(", ");
      }
      dispatch(n.getNode(i));
    }
  }

  public void visitVarList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(", ");
      }
      dispatch(n.getNode(i));
    }
  }

  /** Visit the specified program node. */
  public void visitProgram(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
  }

  /** Visit the specified opInvoke node. */
  public void visitStreamsAndVars(GNode n) {
    dispatch(n.getNode(0));
    if ((n.size() == 1) || (n.getNode(1) == null)) {
      return;
    }
    printer.p(", ");
    dispatch(n.getNode(1));
  }

  /** Visit the specified var node. */
  public void visitVar(GNode n) {
    printer.p("$");
    printer.p(n.getString(0));
  }

  public void visitAnnotation(GNode n) {
    printer.p("@");
    printer.p(n.getString(0));
    printer.p("(");
    if (n.getNode(1) != null) {
      dispatch(n.getNode(1));
    }
    printer.p(")");    
  }

  public void visitVariable(GNode n) {
    printer.p(n.getString(0));
  }

  public void visitIdentifierList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(", ");
      }
      printer.p(n.getString(i));
    }
  }

  public void visitAnnotations(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(" ");
      }
      dispatch(n.getNode(i));
    }
  }

  public void visitExpressionList(GNode n) {
    for (int i = 0; i < n.size(); i++) {
      if (i > 0) {
        printer.p(", ");
      }
      dispatch(n.getNode(i));
    }
  }
}
