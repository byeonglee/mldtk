/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
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
package xtc.oop;

import java.util.Iterator;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Runtime;

/**
 * A visitor to collect statistics on a Java program.
 *
 * @author Robert Grimm
 * @version $Revision: 1.2 $
 */
public class Counter extends Visitor {

  /** The counter's runtime. */
  private Runtime runtime;

  /** The method and field counts. */
  private int methodCount, fieldCount;

  /**
   * Create a new counter.
   *
   * @param runtime The runtime.
   */
  public Counter(Runtime runtime) {
    this.runtime = runtime;
  }

  /** Clear this counter's statistics. */
  private void clear() {
    methodCount = 0;
    fieldCount = 0;
  }

  /** Print this counter's statistics. */
  private void print() {
    runtime.console().pln().sep().pln();

    runtime.console().p("// Number of methods: ").p(methodCount).pln();
    runtime.console().p("// Number of fields:  ").p(fieldCount).pln();

    runtime.console().pln().sep().pln().flush();
  }

  public void visitCompilationUnit(GNode n) {
    clear();
    visit(n);
    print();
  }

  public void visitClassBody(GNode n) {
    for (Iterator iter = n.iterator(); iter.hasNext(); ) {
      Object o = iter.next();
      
      if (o instanceof Node) {
        Node child = (Node)o;

        // We look for field declarations inside the class body, b/c
        // the AST simplifier uses FieldDeclaration nodes for both
        // real field declarations and variable declarations.  We add
        // the number of children of the 3rd child, b/c each field
        // declaration can declare more than one field.
        if (child.hasName("FieldDeclaration")) {
          fieldCount += ((Node)child.get(2)).size();
        }

        dispatch(child);
      }
    }
  }

  public void visitMethodDeclaration(GNode n) {
    methodCount++;
    visit(n);
  }

  public void visit(GNode n) {
    for (Iterator iter = n.iterator(); iter.hasNext(); ) {
      Object o = iter.next();
      if (o instanceof Node) dispatch((Node)o);
    }
  }

}
