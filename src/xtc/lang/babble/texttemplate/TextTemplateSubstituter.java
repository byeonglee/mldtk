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
package xtc.lang.babble.texttemplate;

import java.util.Map;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class TextTemplateSubstituter extends Visitor {
  /** The printer. */
  protected final Printer printer;
  private Map<String, String> substitutions;

  /**
   * Create a new printer for Text templates.
   * 
   * @param printer
   *          The printer.
   */
  public TextTemplateSubstituter(Map<String, String> substitutions,
      Printer printer) {
    this.substitutions = substitutions;
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

  public void visitText(GNode n) {
    printer.p(n.getString(0));
  }

  public void visitVar(GNode n) {
    String str = substitutions.get(n.getString(0));
    if (null != str) {
      printer.p(str);
    } else {
      printer.p(n.getString(0));
    }
  }
}
