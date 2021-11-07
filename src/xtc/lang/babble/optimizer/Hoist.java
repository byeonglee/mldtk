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
package xtc.lang.babble.optimizer;

import java.util.List;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Pair;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.3 $
 */
public class Hoist extends Visitor {
  private int operator;

  /**
   * 
   * 
   * @param printer
   *          The printer.
   */
  public Hoist(int operator) {
    this.operator = operator;
  }

  public Node apply(Node n) {
    this.dispatch(n);
    return n;
  }

  /**
   * Generic catch-all visit method
   */
  public void visit(GNode n) {
    for (Object o : n) {
      if (o instanceof Node) {
        dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
  }

  /** Visit the specified program node. */
  public void visitProgram(GNode n) {
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
    Node op1 = n.<Node> getList(2).get(operator);
    Node op2 = n.<Node> getList(2).get(operator + 1);
    Pair<Node> inputVsTmp = op1.getNode(2).<Node> getList(1);
    Pair<Node> outputVsTmp = op1.getNode(0).<Node> getList(1);
    Pair<Node> inputQsTmp = op1.getNode(2).<Node> getList(0);
    Pair<Node> outputQsTmp = op1.getNode(0).<Node> getList(0);
    op1.getNode(2).set(1, op2.getNode(2).<Node> getList(1));
    op1.getNode(0).set(1, op2.getNode(0).<Node> getList(1));
    op1.getNode(2).set(0, op2.getNode(2).<Node> getList(0));
    op1.getNode(0).set(0, op2.getNode(0).<Node> getList(0));
    op2.getNode(2).set(1, inputVsTmp);
    op2.getNode(0).set(1, outputVsTmp);
    op2.getNode(2).set(0, inputQsTmp);
    op2.getNode(0).set(0, outputQsTmp);
    List<Node> list = n.<Node> getList(2).list();
    list.remove(operator + 1);
    list.add(operator, op2);
    Pair<Node> p = null;
    for (int j = list.size() - 1; j >= 0; j--) {
      Node op = list.get(j);
      if (p == null) {
        p = new Pair<Node>(op);
      } else {
        p = new Pair<Node>(op, p);
      }
    }
    n.set(2, p);
  }
}
