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
package xtc.lang.babble.streamit;

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
 * @version $Revision: 1.14 $
 */
public class StreamItToBrooklet extends Visitor {
  /** The printer. */
  protected final Printer printer;
  /** the root of the returned Brooklet AST */
  private Node brookletRoot = null;
  /** the input queue for the operator */
  private String queueIn = null;
  /** the output queue for the operator */
  private String queueOut = null;
  /** the input queues for the operator */
  private List<String> queueInList = null;
  /** the output queues for the operator */
  private List<String> queueOutList = null;
  private int operatorId = 0;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public StreamItToBrooklet(Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Return the root of the translated AST.
   * 
   * @return The root node of the Brooklet AST.
   */
  public Node translate(Node root) {
    operatorId = 0;
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

  /** Visit the specified feedbackloop node. */
  public void visitFl(GNode n) {
    String q0 = queueIn;
    String q1 = Util.freshId();
    String q2 = Util.freshId();
    String q3 = Util.freshId();
    String q4 = Util.freshId();
    String q5 = queueOut;
    queueOutList = new ArrayList<String>();
    queueInList = new ArrayList<String>();
    queueOut = q1;
    queueInList.add(q0);
    queueInList.add(q4);
    dispatch(n.getNode(0));
    queueIn = q1;
    queueOut = q2;
    Node pList = n.getNode(1);
    for (int i = 0; i < pList.size(); i++) {
      queueOut = Util.freshId();
      dispatch(pList.getNode(i));
      queueIn = queueOut;
    }
    queueIn = q3;
    queueOut = q4;
    Node pList2 = n.getNode(2);
    for (int i = 0; i < pList.size(); i++) {
      queueOut = Util.freshId();
      dispatch(pList2.getNode(i));
      queueIn = queueOut;
    }
    queueIn = q2;
    queueOutList.add(q3);
    queueOutList.add(q5);
    dispatch(n.getNode(2));
    queueOut = q5;
  }

  /** Visit the specified filter node. */
  public void visitFt(GNode n) {
    List<String> inputVs = new ArrayList<String>();
    List<String> outputVs = new ArrayList<String>();
    List<String> inputQs = new ArrayList<String>();
    List<String> outputQs = new ArrayList<String>();
    inputQs.add(queueIn);
    outputQs.add(queueOut);
    String tmpVar = Util.freshVar();
    inputVs.add(tmpVar);
    outputVs.add(tmpVar);
    if (n.getNode(0) != null) {
      Node idList = n.getNode(0);
      for (int i = 0; i < idList.size(); i++) {
        inputVs.add(idList.getString(i));
        outputVs.add(idList.getString(i));
      }
    }
    String name = n.getNode(1).getString(1) + operatorId;
    operatorId++;
    createOpInvoke(name, inputQs, outputQs, inputVs, outputVs);
  }

  /** Visit the specified join node. */
  public void visitJn(GNode n) {
    List<String> inputVs = new ArrayList<String>();
    List<String> outputVs = new ArrayList<String>();
    List<String> inputQs = queueInList;
    List<String> outputQs = new ArrayList<String>();
    outputQs.add(queueOut);
    ;
    for (int i = 0; i < queueInList.size(); i++) {
      String varName = Util.freshVar();
      inputVs.add(varName);
      outputVs.add(varName);
    }
    String name = "join" + n.getString(0) + operatorId;
    operatorId++;
    createOpInvoke(name, inputQs, outputQs, inputVs, outputVs);
  }

  /** Visit the specified pipeline node. */
  public void visitPl(GNode n) {
    Node pList = n.getNode(0);
    String queueOutTmp = queueOut;
    for (int i = 0; i < pList.size(); i++) {
      if (i == pList.size() - 1) {
        queueOut = queueOutTmp;
      } else {
        queueOut = Util.freshId();
      }
      dispatch(pList.getNode(i));
      queueIn = queueOut;
    }
    queueOut = queueOutTmp;
  }

  /** Visit the specified program node. */
  public void visitStreamItProgram(GNode n) {
    this.initAST();
    queueIn = Util.freshId();
    queueOut = Util.freshId();
    brookletRoot.getNode(1).getNode(0).add(
                                           GNode.create("AnnotatedStream", null, queueIn));
    brookletRoot.getNode(0).getNode(0).add(
                                           GNode.create("AnnotatedStream", null, queueOut));
    dispatch(n.getNode(0));
  }

  /** Visit the specified splitjoin node. */
  public void visitSj(GNode n) {
    List<String> queueInListTmp = queueInList;
    List<String> queueOutListTmp = queueOutList;
    queueOutList = new ArrayList<String>();
    queueInList = new ArrayList<String>();
    Node pList = n.getNode(1);
    for (int i = 0; i < pList.size(); i++) {
      queueOutList.add(0, Util.freshId());
    }
    for (int i = 0; i < pList.size(); i++) {
      queueInList.add(0, Util.freshId());
    }
    String queueOutTmp = queueOut;
    dispatch(n.getNode(0));
    for (int i = 0; i < pList.size(); i++) {
      queueIn = queueOutList.get(i);
      queueOut = queueInList.get(i);
      dispatch(pList.getNode(i));
    }
    queueOut = queueOutTmp;
    dispatch(n.getNode(2));
    queueInList = queueInListTmp;
    queueOutList = queueOutListTmp;
  }

  /** Visit the specified split node. */
  public void visitSp(GNode n) {
    String varName = Util.freshVar();
    List<String> inputVs = new ArrayList<String>();
    List<String> outputVs = new ArrayList<String>();
    List<String> inputQs = new ArrayList<String>();
    List<String> outputQs = queueOutList;
    inputVs.add(varName);
    outputVs.add(varName);
    inputQs.add(queueIn);
    String name = "split" + n.getString(0) + operatorId;
    operatorId++;
    createOpInvoke(name, inputQs, outputQs, inputVs, outputVs);
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
