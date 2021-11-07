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
package xtc.lang.babble.sawzall;

import java.util.List;
import java.util.ArrayList;

import xtc.lang.babble.util.Util;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */
public class SawzallToBrooklet extends Visitor {
  /** The printer. */
  protected final Printer printer;
  /** the root of the returned Brooklet AST */
  private Node brookletRoot = null;
  /** unique id for operators */
  private int operatorId = 0;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   * @param r
   *          The number of reducers.
   */
  public SawzallToBrooklet(Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Return the root of the translated AST.
   * 
   * @return The root node of the Brooklet AST.
   */
  public Node translate(Node root) {
    this.initAST();
    this.dispatch(root);
    return brookletRoot;
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

  public void visitSawzallProgram(GNode n) {
    String inputName = n.getNode(1).getString(0);
    brookletRoot.getNode(1).getNode(0).add(
                                           GNode.create("AnnotatedStream", null, inputName));
    List<String> mapInputQs = new ArrayList<String>();
    List<String> mapOutputQs = new ArrayList<String>();
    List<String> mapInputVs = new ArrayList<String>();
    List<String> mapOutputVs = new ArrayList<String>();
    mapInputQs.add(inputName);
    String queue = Util.freshId();
    mapOutputQs.add(queue);
    String operatorName = "map" + operatorId;
    operatorId++;
    this.createOpInvoke(operatorName, mapInputQs, mapOutputQs, mapInputVs,
        mapOutputVs);
    String variable = Util.freshVar();
    List<String> reduceInputQs = new ArrayList<String>();
    List<String> reduceOutputQs = new ArrayList<String>();
    List<String> reduceInputVs = new ArrayList<String>();
    List<String> reduceOutputVs = new ArrayList<String>();
    reduceInputQs.add(queue);
    reduceInputVs.add(variable);
    reduceOutputVs.add(variable);
    operatorName = "reduce" + operatorId;
    operatorId++;
    this.createOpInvoke(operatorName, reduceInputQs, reduceOutputQs,
        reduceInputVs, reduceOutputVs);
  }

  /********************** Private Helper Functions *************************/
  /** Create an empty AST. */
  private void initAST() {
    GNode outputs = GNode.create("Outputs");
    outputs.add(GNode.create("AnnotatedStreamList", true));
    GNode inputs = GNode.create("Inputs");
    inputs.add(GNode.create("AnnotatedStreamList", true));
    brookletRoot = GNode.create("Program");
    brookletRoot.add(outputs);
    brookletRoot.add(inputs);
  }

  private void createOpInvoke(String name, List<String> inputQueues,
      List<String> outputQueues, List<String> inputVariables,
      List<String> outputVariables) {
    GNode inputQs = GNode.create("StreamList");
    for (String s : inputQueues) {
      inputQs.add(GNode.create("Stream", s));
    }
    GNode outputQs = GNode.create("StreamList");
    for (String s : outputQueues) {
      outputQs.add(GNode.create("Stream", s));
    }
    GNode inputVs = GNode.create("VarList");
    for (String s : inputVariables) {
      inputVs.add(GNode.create("Var", s));
    }
    GNode outputVs = GNode.create("VarList");
    for (String s : outputVariables) {
      outputVs.add(GNode.create("Var", s));
    }
    if (inputVs.size() == 0)
      inputVs = null;
    if (outputVs.size() == 0)
      outputVs = null;
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
    opInvoke.add(null);
    opInvoke.add(outputs);
    opInvoke.add(GNode.create("Operator", name));
    opInvoke.add(inputs);
    brookletRoot.add(opInvoke);
  }
}
