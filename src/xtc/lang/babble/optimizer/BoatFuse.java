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
package xtc.lang.babble.optimizer;

import java.util.Map;
import java.util.HashMap;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

/**
 * A class for applying the fuse optimization to Boat code
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class BoatFuse extends Visitor {

  /* A flag to change the behavior from find to replace */
  boolean findFlag = false;

  /* A flag to change the behavior from find to replace */
  boolean replaceFlag = false;

  /* A mapping from the function name to its node in the AST */
  Map<String, Node> functions = null;

  /* the function name to be replaced */
  String src = null;

  /* the new function after the replacement */
  String dst = null;

  /**
   * Create a new Boat Fuser
   */
  public BoatFuse() {
    // do nothing
  }

  /**
   * Produce the optimized Brooklet code
   * 
   * @param root
   *          The root node of the annotated Brooklet code
   * @return the root node of the optimized tree
   */
  public Map<String, Node> findFunctions(Node root, Map<String, Node> functions) {
    findFlag = true;
    this.functions = functions;
    this.dispatch(root);
    findFlag = false;
    return this.functions;
  }

  public void replaceFunctionCall(Node root, String src, String dst) {
    replaceFlag = true;
    this.src = src;
    this.dst = dst;
    this.dispatch(root);
    replaceFlag = false;   
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

  public void visitLetBindingDef(final GNode n) {
    if (findFlag) {
      if ("LowerID".equals(n.getNode(1).getNode(0).getNode(0).getName())) {
        String funcName = n.getNode(1).getNode(0).getNode(0).getString(0);
        functions.put(funcName, n);
      }
    }
    dispatch(n.getNode(1));
  }

  public void visitApplicationExpression(final GNode n) {
    if (replaceFlag) {
      if ("LowerID".equals(n.getNode(0).getName())) {
        String funcApp = n.getNode(0).getString(0);
        if (src.equals(funcApp)) {
          n.getNode(0).set(0, dst);   
        }
      }
    }
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
  }

}
