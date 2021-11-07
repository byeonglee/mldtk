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

import java.util.Map;
import java.util.Hashtable;
import java.util.Set;
import java.util.HashSet;
import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class SRASourceSinkSplitFinder extends Visitor {
  /** The sinks */
  protected Map<String, Integer> usage = null;
  protected Set<String> sinks = null;
  protected Set<String> sources = null;
  protected Map<String, Integer> splits = null;

  public SRASourceSinkSplitFinder() {
    /** do nothing */
  }

  Set<String> getSinks() {
    return sinks;
  }

  Set<String> getSources() {
    return sources;
  }

  Map<String, Integer> getSplits() {
    return splits;
  }

  public Node analyze(Node root) {
    usage = new Hashtable<String, Integer>();
    sinks = new HashSet<String>();
    sources = new HashSet<String>();
    splits = new Hashtable<String, Integer>();
    this.dispatch(root);
    Set<String> keys = usage.keySet();
    for (String key : keys) {
      int used = usage.get(key);
      if (used == 0) {
        sinks.add(key);
      } else if (used > 1) {
        splits.put(key, used);
      }
    }
    return root;
  }

  /****************************************************************************/
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

  public void visitSRAProgram(final GNode n) {
    for (int i = 0; i < n.size(); i++) {
      Node decl = n.getNode(i);
      usage.put(decl.getString(0), 0);
      if (null == decl.getNode(2)) {
        sources.add(decl.getString(0));
      }
    }
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
  }

  public void visitStream(final GNode n) {
    int oldUsage = usage.get(n.getString(0));
    usage.put(n.getString(0), oldUsage + 1);
  }

  public void visitRelation(final GNode n) {
    int oldUsage = usage.get(n.getString(0));
    usage.put(n.getString(0), oldUsage + 1);
  }
}