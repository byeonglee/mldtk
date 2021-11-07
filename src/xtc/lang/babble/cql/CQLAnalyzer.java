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
package xtc.lang.babble.cql;

import java.util.List;

import xtc.lang.babble.sql.SQLAnalyzer;

import xtc.tree.GNode;
import xtc.type.ErrorT;
import xtc.type.Type;
import xtc.type.StructT;
import xtc.type.VariableT;

import xtc.util.Runtime;
import xtc.util.SymbolTable;

/**
 * A visitor to type check CQL.
 * 
 * @author Robert Soule
 * @version $Revision: 1.16 $
 */
public class CQLAnalyzer extends SQLAnalyzer {
  protected class CQLNameDefAnalyzer extends SQLNameDefAnalyzer {
    public CQLNameDefAnalyzer(Runtime runtime, SymbolTable table) {
      super(runtime, table);
    }

    public Type visitStrType(final GNode n) {
      Type type = (Type) boatAnalyzer.dispatch(n.getNode(0));
      return new StructT("stream", type.toStruct().getMembers());
    }
  }

  /**
   * Create a new analyzer for CQL file.
   * 
   * @param runtime
   *          The runtime.
   */
  public CQLAnalyzer(Runtime runtime) {
    super(runtime);
  }

  public void visitCQLProgram(final GNode n) {
    /* The first pass populates gamma prime */
    table.setScope(table.root());
    table.enter("gamma");
    gamma = table.current();
    table.exit();
    table.enter("gammaPrime");
    gammaPrime = table.current();
    table.exit();
    CQLNameDefAnalyzer nameAnalyzer = new CQLNameDefAnalyzer(runtime, table);
    for (int i = 0; i < n.size(); i++) {
      nameAnalyzer.dispatch(n.getNode(i));
    }
    /* The second pass verifies the types */
    for (int i = 0; i < n.size(); i++) {
      if (UNIT != (Type) dispatch(n.getNode(i))) {
        runtime
            .error("Query does not produce the declared type.", n.getNode(i));
      }
    }
  }

  @Override
  public Type visitFromItem(final GNode n) {
    String itemId = n.getString(0);
    Type itemType = lookup(gammaPrime, itemId, n);
    if (null != n.getNode(1)) {
      if (UNIT != (Type) dispatch(n.getNode(1))) {
        runtime.error("Window produces an error type.", n.getNode(1));
        return ErrorT.TYPE;
      }
    }
    if (n.size() == 3) {
      gammaB.define(n.getString(2), itemType);
    }
    gammaB.define(itemId, itemType);
    return itemType;
  }

  public Type visitNow(final GNode n) {
    return UNIT;
  }

  public Type visitPartition(final GNode n) {
    /* todo: type check group by items */
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(2));
    if (!unify(type, S_INT)) {
      runtime.error("Partition expects an integer parameter.", n.getNode(2));
      return ErrorT.TYPE;
    }
    return UNIT;
  }

  public Type visitRange(final GNode n) {
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(1));
    if (!unify(type, S_INT)) {
      runtime.error("Range expects an integer parameter.", n.getNode(1));
      return ErrorT.TYPE;
    }
    return UNIT;
  }

  public Type visitRows(final GNode n) {
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(1));
    if (!unify(type, S_INT))
      return ErrorT.TYPE;
    return UNIT;
  }

  public Type visitSelectR2S(final GNode n) {
    List<VariableT> members = null;
    if ("Star".equals(n.getNode(2).getName())) {
      members = this.visitStar((GNode) n.getNode(2));
    } else {
      members = this.visitSelectItems((GNode) n.getNode(2));
    }
    return new StructT("stream", members);
  }

  public Type visitSelectStr(final GNode n) {
    List<VariableT> members = null;
    if ("Star".equals(n.getNode(1).getName())) {
      members = this.visitStar((GNode) n.getNode(1));
    } else {
      members = this.visitSelectItems((GNode) n.getNode(1));
    }
    return new StructT("stream", members);
  }

  public Type visitStrQuery(final GNode n) {
    Type type = null;
    String freshId = "strquery" + queryId;
    queryId++;
    // create gamma*
    table.enter("gamma_star_" + freshId);
    gammaStar = table.current();
    table.exit();
    // create gammaB
    table.enter("gamma_B_" + freshId);
    gammaB = table.current();
    table.exit();
    // visit from clause. This will populate gammaStar
    dispatch(n.getNode(1));
    table.enter("gamma_exp_" + freshId);
    gammaExpr = table.current();
    table.exit();
    addAll(gamma, gammaExpr);
    addAll(gammaB, gammaExpr);
    addAll(gammaStar, gammaExpr);
    // visit select clause
    type = (Type) dispatch(n.getNode(0));
    // visit where clause if it exists
    if (n.getNode(2) != null) {
      if (UNIT != (Type) dispatch(n.getNode(2)))
        return ErrorT.TYPE;
    }
    // visit group by clause if it exists
    if (n.getNode(3) != null) {
      if (UNIT != (Type) dispatch(n.getNode(3)))
        return ErrorT.TYPE;
    }
    return type;
  }

  public Type visitStrType(final GNode n) {
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(0));
    return new StructT("stream", type.toStruct().getMembers());
  }

  public Type visitWindow(final GNode n) {
    return (Type) dispatch(n.getNode(0));
  }
}
