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
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,1
 * USA.
 */
package xtc.lang.babble.optimizer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Pair;
import xtc.util.Runtime;


/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.3 $
 */
public class FuseAnnotationOptimizer extends Visitor implements Optimization {
  
  /* maps queue names to the operator that they input to */
  private Map<String, Node> queueToInputOp = null;

  /* maps queue names to the operator that they output from */
  private Map<String, Node> queueToOutputOp = null;

  private Set<String> fuseIdSet = null;

  /* A flag indicating that the optimizer made a change */
  private boolean changeInputsFlag = false;

  /* The root of the optimized Brooklet AST */
  private Node optimizedBrooklet = null;

  private int fuseId = 0;

  public FuseAnnotationOptimizer() {
    /* do nothing */
  }

 /**
   * Produce an optimized River program.
   *
   * @param runtime The runtime.
   * @param brookletAST The root of the Brooklet AST to be optimized.
   * @param boatAST The root of the Boat AST to be optimized.
   * @return A triple of a boolean indicating a change to the AST, the root of the optimized 
   * Brooklet AST, and the root of the optimized Boat AST.
   */
  public Result optimize(final Runtime runtime, final Node brookletAST, final Node boatAST) {
    queueToInputOp = new HashMap<String, Node>();
    queueToOutputOp = new HashMap<String, Node>();
    fuseIdSet = new HashSet<String>();
    new BookKeeper().analyze(brookletAST);
    this.optimizedBrooklet = GNode.create("Program");    
    this.dispatch(brookletAST);
    return new Optimization.Result(changeInputsFlag, brookletAST, boatAST);
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

  public void visitOutputs(GNode n) {
    optimizedBrooklet.add(n);
  }

  public void visitInputs(GNode n) {
    optimizedBrooklet.add(n);
  }

  public void visitOpInvoke(GNode n) {
    /* TODO: Check to see if we should add the annotation */

    /* Is this a split or a merge? */
    boolean isSplit = isKeyedSplit(n) || isStatelessSplit(n);
    boolean isMerge = isStatelessMerge(n) || isKeyedMerge(n);
    if (isSplit) {
      Node inputs = n.getNode(3);
      assert inputs != null;
      String inputQueueName = inputs.getNode(0).getNode(0).getString(0);
      Node previous = queueToOutputOp.get(inputQueueName);
      if ((previous != null) && (isUnaryOutput(previous))) {
          String id = getNewFuseGroup();
          addFuseAnnotation(previous, id);
          addFuseAnnotation(n, id);
      }
    } else if (isMerge) {
      /* check the next node */
      Node outputs = n.getNode(1);
      if (outputs != null) {
        String outputQueueName = outputs.getNode(0).getNode(0).getString(0);
        Node next = queueToInputOp.get(outputQueueName);
        if ((next != null) && (isUnaryInput(next))) {
          String id = getNewFuseGroup();
          addFuseAnnotation(next, id);
          addFuseAnnotation(n, id);          
        }
      }      
    }
    optimizedBrooklet.add(n);
  }    

  private boolean isUnaryInput(Node n) {
    Node inputs = n.getNode(3);
    if (inputs == null) {
      return true;
    }
    if ("StreamList".equals(inputs.getNode(0).getName())) {
      if (1 == inputs.getNode(0).size()) {
        return true;
      }
    }
    return false;
  }

  private boolean isUnaryOutput(Node n) {
    Node outputs = n.getNode(1);
    if (outputs == null) {
      return true;
    }
    if ("StreamList".equals(outputs.getNode(0).getName())) {
      if (1 == outputs.getNode(0).size()) {
        return true;
      }
    }
    return false;
  }

  private boolean isUnionMerge(Node n) {
    if (n.getNode(2).getString(0).startsWith("unionmerge")) {
      return true;
    }
    return false;
  }

  private boolean isStatelessMerge(Node n) {
    if (n.getNode(2).getString(0).startsWith("roundrobinmerge")) {
      return true;
    }
    return false;
  }

  private boolean isKeyedMerge(Node n) {
    if (n.getNode(2).getString(0).startsWith("simplemerge")) {
      return true;
    }
    return false;
  }

  private boolean isStatelessSplit(Node n) {
    if (n.getNode(2).getString(0).startsWith("roundrobinsplit")) {
      return true;
    }
    return false;
  }

  private boolean isKeyedSplit(Node n) {
    if (n.getNode(2).getString(0).startsWith("hashsplit")) {
      return true;
    }
    return false;
  }

  private void addFuseAnnotation(Node n, String fuseId) {
    Node fuseAnnotation =  GNode.create("Annotation", "Fuse",
                                        GNode.create("ExpressionList",                                                                   
                                                     GNode.create("Variable", fuseId)));
    if (n.getNode(0) == null) {
      n.set(0, GNode.create("Annotations", fuseAnnotation));
    }
    else {
      Node annotations = n.getNode(0);
      annotations = GNode.ensureVariable((GNode)annotations);
      n.set(0, annotations);
      annotations.add(fuseAnnotation);
    }
  }

  private String getNewFuseGroup() {
    String fuseGroupId = "fusegroup" + fuseId;
    while (fuseIdSet.contains(fuseGroupId)) {
      fuseId++;
      fuseGroupId = "fusegroup" + fuseId;
    }
    fuseId++;
    fuseIdSet.add(fuseGroupId);
    return fuseGroupId;
  }

 /**
   * A visitor to collect queue names, and to map queues to operators.
   */
  private class BookKeeper extends Visitor {

    private BookKeeper() { /* do nothing */ }

    private void analyze(Node root) {
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

    public void visitAnnotation(final GNode n) {
      if ("Fuse".equals(n.getString(0))) {
        fuseIdSet.add(n.getNode(1).getNode(1).getString(0));
      }
    }
    
    public void visitOpInvoke(final GNode n) {
      Node inputs = n.getNode(3);
      if ("StreamList".equals(inputs.getNode(0).getName())) {
        for (int i = 0; i < inputs.getNode(0).size(); i++) {
          queueToInputOp.put(inputs.getNode(0).getNode(i).getString(0), n);
        }
      }
      Node outputs = n.getNode(1);
      if (outputs != null) {
        if ("StreamList".equals(outputs.getNode(0).getName())) {
          for (int i = 0; i < outputs.getNode(0).size(); i++) {
            queueToOutputOp.put(outputs.getNode(0).getNode(i).getString(0), n);
          }
        }
      }
    }
  }
}
