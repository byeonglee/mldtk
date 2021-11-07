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
 * @version $Revision: 1.6 $
 */
public class FusionOptimizer extends Visitor implements Optimization {

  /* maps fuse group ids to the operators in that group */
  private Map<String, Set<Node>> idToOps = null;

  /* groupIds already visited */
  private Set<String> alreadySeen = null;

  /* A mapping from the function name to its node in the BOAT AST */
  Map<String, Node> functions = null;

  /* the root of the optimized program */
  private Node optimized = null;
  
  /* A visitor to optimize the boat code */
  BoatFuse boatFuse = null;

  /* maps queue names to the operator that they input to */
  private Map<String, Node> queueToInputOp = null;

  /* maps queue names to the operator that they output from */
  private Map<String, Node> queueToOutputOp = null;

  /**
   * A private class to discover the topology of the data flow graph
   */
  private class Topology extends Visitor {    

    private Map<String, Set<Node> > idToOps = null;
    private Map<String, Node> queueToInputOp = null;
    private Map<String, Node> queueToOutputOp = null;

    public Topology() {
      /* do nothing */
    }

    public void analyze(Node root, 
                        Map<String, Set<Node>> idToOps,
                        Map<String, Node> queueToInputOp,
                        Map<String, Node> queueToOutputOp) {
      this.idToOps = idToOps;
      this.queueToInputOp = queueToInputOp;
      this.queueToOutputOp = queueToOutputOp;
      this.dispatch(root);
    }

    public void visitOpInvoke(GNode n) {
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
      boolean fuse = false;
      String groupId = null;
      Node annotations = n.getNode(0);
      if (annotations != null) {
        for (int i = 0; i < annotations.size(); i++) {
          if ("Fuse".equals(annotations.getNode(i).getString(0))) {          
            groupId = annotations.getNode(i).getNode(1).getNode(0).getString(0);
            fuse = true;
          }
        }
      }
      if (!fuse) {
        return;
      }
      if (!idToOps.containsKey(groupId)) {
        idToOps.put(groupId, new HashSet<Node>());
      }
      idToOps.get(groupId).add(n);
    }

    public void visit(GNode n) {
      for (Object o : n) {
        if (o instanceof Node) {
          dispatch((Node) o);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
      }
    }
  } 
  
  /****************************************************************************/

  public FusionOptimizer() {
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
    idToOps = new HashMap<String, Set<Node> >();
    alreadySeen = new HashSet<String>();
    functions = new HashMap<String, Node>();
    queueToInputOp = new HashMap<String, Node>();
    queueToOutputOp = new HashMap<String, Node>();
    new Topology().analyze(brookletAST, idToOps, queueToInputOp, queueToOutputOp);
    boatFuse = new BoatFuse();
    functions = boatFuse.findFunctions(boatAST, functions);
    optimized = GNode.create("Program");
    optimized.add(brookletAST.getNode(0));
    optimized.add(brookletAST.getNode(1));
    this.dispatch(brookletAST);
    return new Optimization.Result(false, optimized, boatAST);
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

  public void visitOpInvoke(GNode n) {
    if (null == n.getNode(0)) {
      optimized.add(n);
      return;
    }
    boolean fuse = false;
    String groupId = null;
    Node annotations = n.getNode(0);
    for (int i = 0; i < annotations.size(); i++) {
      if ("Fuse".equals(annotations.getNode(i).getString(0))) {          
        groupId = annotations.getNode(i).getNode(1).getNode(0).getString(0);
        fuse = true;
      }
    }    
    if (!fuse) {
      optimized.add(n);
      return;
    }

    /* change the call from ocaml_wrap_output to the next function */
    Node outputOps = n.getNode(1);
    if (outputOps != null) {
      if ("StreamList".equals(outputOps.getNode(0).getName())) {
        for (int i = 0; i < outputOps.getNode(0).size(); i++) {
          Node outputOp = queueToInputOp.get(outputOps.getNode(0).getNode(i).getString(0));         
          if (outputOp == null) {
            continue;
          }
          String outputOpName = outputOp.getNode(2).getString(0);
          if (idToOps.get(groupId).contains(outputOp)) {          
            Node functionNode = functions.get(n.getNode(2).getString(0));
            boatFuse.replaceFunctionCall(functionNode, "ocaml_wrap_output" , outputOpName);            
            // Append the call for the shutdown 
            Node shutdownFunctionNode = functions.get(n.getNode(2).getString(0) + "_shutdown");
            if (shutdownFunctionNode == null) {
              System.err.println("Implementation file does not include shutdown function: " + 
                                 n.getNode(2).getString(0) + "_shutdown");
              System.exit(1);
            }
            Node expression = shutdownFunctionNode.getNode(1).getNode(0).getNode(3);
            Node applicationExpression = GNode.create("ApplicationExpression",
                                                      GNode.create("LowerID", outputOpName + "_shutdown"),
                                                      GNode.create("ArgumentList", 
                                                                   GNode.create("Argument",
                                                                                GNode.create("LowerID", "ptr"))));
            Node semiExpression = GNode.create("SemiExpression", applicationExpression, expression);
            shutdownFunctionNode.getNode(1).getNode(0).set(3, semiExpression);
          }
        }
      }
    }
    if (alreadySeen.contains(groupId)) {
      return;
    }
    alreadySeen.add(groupId);
    Set<Node> fuseSet = idToOps.get(groupId);
    GNode inputQs = GNode.create("StreamList");
    GNode outputQs = GNode.create("StreamList");
    GNode inputVs = null;
    GNode outputVs = null;
    for (Node op : fuseSet) {
      Node inputStreamsAndVars = op.getNode(3);
      Node outputStreamsAndVars = op.getNode(1);
      if (inputStreamsAndVars != null) {
        Node streamList = null;
        Node varList = null;
        if (inputStreamsAndVars.size() == 2) {
          streamList = inputStreamsAndVars.getNode(0);
          varList = inputStreamsAndVars.getNode(1);
        } else {
          varList = inputStreamsAndVars.getNode(0);
        }
        if (streamList != null) {
          for (int i = 0; i < streamList.size(); i++) {
            if (!fuseSet.contains(queueToOutputOp.get(streamList.getNode(i).getString(0)))) {
              inputQs.add(streamList.getNode(i));
            }
          }
        }
        if (varList != null) {
          inputVs = GNode.create("VarList");
          for (int i = 0; i < varList.size(); i++) {
            inputVs.add(varList.getNode(i));
          }
        }      
      }
      if (outputStreamsAndVars != null) {
        Node streamList = null;
        Node varList = null;
        if (outputStreamsAndVars.size() == 2) {
          streamList = outputStreamsAndVars.getNode(0);
          varList = outputStreamsAndVars.getNode(1);
        } else {
          varList = outputStreamsAndVars.getNode(0);
        }
        if (streamList != null) {
          for (int i = 0; i < streamList.size(); i++) {
            if (!fuseSet.contains(queueToInputOp.get(streamList.getNode(i).getString(0)))) {
              outputQs.add(streamList.getNode(i));
            }
          }
        }
        if (varList != null) {
          outputVs = GNode.create("VarList");
          for (int i = 0; i < varList.size(); i++) {
            outputVs.add(varList.getNode(i));
          }
        }      
      }
    }    
    Node opInvoke = null;
    Node inputs = null;
    Node outputs = null;
    if (inputQs.size() > 0) {
      inputs = GNode.create("StreamsAndVars", inputQs, inputVs);
    } else {
      inputs = inputVs;
    }
    if (outputQs.size() > 0) {
      outputs = GNode.create("StreamsAndVars", outputQs, outputVs);
    } else {
      outputs = outputVs;
    }
    opInvoke = GNode.create("OpInvoke");
    opInvoke.add(n.getNode(0));
    opInvoke.add(outputs);
    /* it might be nicer to use the group id, instead of the first function */
    opInvoke.add(GNode.create("Operator", n.getNode(2).getString(0)));
    opInvoke.add(inputs);
    optimized.add(opInvoke);  
  }    
}
