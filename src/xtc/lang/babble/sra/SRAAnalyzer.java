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
package xtc.lang.babble.sra;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.type.ErrorT;
import xtc.type.Type;
import xtc.type.StructT;
import xtc.util.Runtime;

/**
 * A visitor to type check SRA.
 * 
 * @author Robert Soule
 * @version $Revision: 1.13 $
 */
public class SRAAnalyzer extends xtc.lang.babble.ra.RAAnalyzer {
  /**
   * Create a new analyzer for SRA file.
   * 
   * @param runtime
   *          The runtime.
   */
  public SRAAnalyzer(Runtime runtime) {
    super(runtime);
  }

  public IdAndType visitSRAProgram(final GNode n) {
    Type returnType = UNIT;
    // create gamma environment
    table.enter("gamma");
    gamma = table.current();
    table.exit();
    // create gammaB environment
    table.enter("gammaB");
    gammaB = table.current();
    table.exit();
    // populate gammaB with all declared relations
    for (int i = 0; i < n.size(); i++) {
      Node decl = n.getNode(i);
      String id = decl.getString(0);
      Type type = (Type) boatAnalyzer.dispatch(decl.getNode(1).getNode(0));
      if ("StrType".equals(decl.getNode(1).getName())) {
        type = new StructT("stream", type.toStruct().getMembers());
      }
      gammaB.define(id, type);
    }
    /* The second pass verifies the types */
    for (int i = 0; i < n.size(); i++) {
      Node decl = n.getNode(i);
      IdAndType iat = (IdAndType) dispatch(decl);
      if (iat.type != UNIT) {
        runtime.error("Query does not produce the declared type.", decl);
        returnType = ErrorT.TYPE;
      }
    }
    return new IdAndType("program", returnType);
  }

  public IdAndType visitStream(final GNode n) {
    operatorId++;
    return new IdAndType(n.getString(0), lookup(gammaB, n.getString(0), n));
  }

  public IdAndType visitIStream(final GNode n) {
    return r2sOp("istream", n);
  }

  public IdAndType visitDStream(final GNode n) {
    return r2sOp("dstream", n);
  }

  public IdAndType visitRStream(final GNode n) {
    return r2sOp("rstream", n);
  }

  public IdAndType visitNow(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "now" + operatorId + "_out";
    operatorId++;
    IdAndType relation = (IdAndType) dispatch(n.getNode(0));
    if (!"stream".equals(relation.type.getName())) {
      runtime.error("now operator expects stream type as input", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    returnType = new StructT("record", relation.type.toStruct().getMembers());
    gammaB.define(freshId, returnType);
    return new IdAndType(relation.id, returnType);
  }

  private IdAndType r2sOp(String name, final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = name + operatorId + "_out";
    operatorId++;
    IdAndType relation = (IdAndType) dispatch(n.getNode(0));
    if (!"record".equals(relation.type.getName())) {
      runtime.error(name + " operator expects record types as input", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    returnType = new StructT("stream", relation.type.toStruct().getMembers());
    gammaB.define(freshId, returnType);
    return new IdAndType(freshId, returnType);
  }

  public IdAndType visitRange(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "range" + operatorId + "_out";
    operatorId++;
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(0));
    if (!type.isInteger()) {
      runtime.error("range operator expects integer parameter", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    IdAndType relation = (IdAndType) dispatch(n.getNode(1));
    if (!"stream".equals(relation.type.getName())) {
      runtime.error("range operator expects stream type as input", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    returnType = new StructT("record", relation.type.toStruct().getMembers());
    gammaB.define(freshId, returnType);
    return new IdAndType(relation.id, returnType);
  }

  public IdAndType visitRows(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "rows" + operatorId + "_out";
    operatorId++;
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(0));
    if (!type.isInteger()) {
      runtime.error("rows operator expects integer parameter", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    IdAndType relation = (IdAndType) dispatch(n.getNode(1));
    if (!"stream".equals(relation.type.getName())) {
      runtime.error("rows operator expects stream type as input", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    returnType = new StructT("record", relation.type.toStruct().getMembers());
    gammaB.define(freshId, returnType);
    return new IdAndType(relation.id, returnType);
  }

  public IdAndType visitPartition(final GNode n) {
    Type returnType = ErrorT.TYPE;
    String freshId = "partition" + operatorId + "_out";
    operatorId++;
    Type type = (Type) boatAnalyzer.dispatch(n.getNode(1));
    if (!type.isInteger()) {
      runtime.error("partition operator expects integer parameter", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    IdAndType relation = (IdAndType) dispatch(n.getNode(2));
    if (!"stream".equals(relation.type.getName())) {
      runtime.error("partition operator expects stream type as input", n);
      return new IdAndType(freshId, ErrorT.TYPE);
    }
    returnType = new StructT("record", relation.type.toStruct().getMembers());
    gammaB.define(freshId, returnType);
    return new IdAndType(relation.id, returnType);
  }
}
