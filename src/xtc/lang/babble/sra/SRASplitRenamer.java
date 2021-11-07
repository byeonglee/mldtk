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
import java.util.concurrent.ConcurrentHashMap;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class SRASplitRenamer extends Visitor {
  Map<String, Integer> splits = null;
  Map<String, Integer> splitId = null;

  public SRASplitRenamer() {
    /** do nothing */
  }

  public void rename(Node root, Map<String, Integer> splits) {
    this.splits = splits;
    splitId = new ConcurrentHashMap<String, Integer>();
    this.dispatch(root);
  }

  public void visit(final GNode n) {
    for (Object o : n) {
      if (o instanceof Node) {
        dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
  }

  public void visitStream(final GNode n) {
    String stream = n.getString(0);
    if (splits.containsKey(stream)) {
      if (!splitId.containsKey(stream)) {
        splitId.put(stream, 0);
      }
      int dupNum = splitId.get(stream);
      String name = stream + "_dup" + dupNum;
      n.set(0, name);
      splitId.put(stream, dupNum + 1);
    }
  }

  public void visitRelation(final GNode n) {
    String rel = n.getString(0);
    if (splits.containsKey(rel)) {
      if (!splitId.containsKey(rel)) {
        splitId.put(rel, 0);
      }
      int dupNum = splitId.get(rel);
      String name = rel + "_dup" + dupNum;
      n.set(0, name);
      splitId.put(rel, dupNum + 1);
    }
  }
}
