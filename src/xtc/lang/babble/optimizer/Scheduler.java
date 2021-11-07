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

import java.lang.reflect.Constructor;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Runtime;

/**
 * 
 * 
 * @author Robert Soule
 * @version $Revision: 1.1 $
 */
public class Scheduler extends Visitor {

  private Map<String, Optimization> symbolTable;
  private List<Optimization> schedule;

  public Scheduler() {
    symbolTable = new HashMap<String, Optimization>();
    schedule = new ArrayList<Optimization>();
  }
  
  public List<Optimization> schedule(Node root) {
    this.dispatch(root);
    return schedule;
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

  public void visitOptDecl(final GNode n) {
    String constr = n.getString(1);
    String classname = "xtc.lang.babble.optimizer." + constr ;
    try {
      Class optDefinition = Class.forName(classname);
      Constructor[] optConstrs = optDefinition.getConstructors(); 
      Node paramList = n.getNode(2);      
      if (paramList != null) {
        int numArgs = paramList.size();
        Object[] initArgs = new Object[numArgs];
        for (int i = 0; i < numArgs; i++) {
          initArgs[i] = dispatch(paramList.getNode(i));
        }
        symbolTable.put(n.getString(0), (Optimization)optConstrs[0].newInstance(initArgs));
      } else {
        symbolTable.put(n.getString(0), (Optimization)optConstrs[0].newInstance());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  public void visitOrdering(final GNode n) {
    int size = n.size();
    for (int i = 0; i < size; i++) {
      Node order = n.getNode(i);
      if (!symbolTable.containsKey(order.getString(0))) {
        System.err.println("Optimization " + order.getString(0) + "was not found.");
      } else {
        schedule.add(symbolTable.get(order.getString(0)));
      }
    }
  }

  public Object visitParam(final GNode n) {
    return dispatch(n.getNode(0));
  }

  public Float visitFloatingPointLiteral(final GNode n) {
    return Float.parseFloat(n.getString(0));
  }

  public Integer visitIntegerLiteral(final GNode n) {
    return Integer.parseInt(n.getString(0));
  }

  public Character visitCharacterLiteral(final GNode n) {
    return n.getString(0).charAt(0);
  }

  public String visitStringLiteral(final GNode n) {
    return n.getString(0);
  }

  public Boolean visitBooleanLiteral(final GNode n) {
    return Boolean.valueOf(n.getString(0));
  }

  public Object visitNullLiteral(final GNode n) {
    return null;
  }


}
