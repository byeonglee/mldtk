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

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

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
public class SRAToBrooklet extends Visitor {
  /** The printer. */
  protected final Printer printer;
  /** the root of the returned Brooklet AST */
  private Node brookletRoot = null;
  /** An id number to distinguish operator instances **/
  private int operatorId = 0;
  private Map<String, Integer> splits = null;
  private Node currentDecl = null;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public SRAToBrooklet(Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Translate SRA tree to Brooklet tree.
   * 
   * @return The root node of the Brooklet AST.
   */
  public Node translate(Node root, Set<String> sources, Set<String> sinks,
      Map<String, Integer> splits) {
    this.splits = splits;
    this.initAST();
    for (String source : sources) {
      brookletRoot.getNode(1).getNode(0).add(
                                             GNode.create("AnnotatedStream", null, source));
    }
    for (String sink : sinks) {
      brookletRoot.getNode(0).getNode(0).add(
                                             GNode.create("AnnotatedStream", null, sink));
    }
    this.dispatch(root);
    return brookletRoot;
  }

  /**
   * Create an empty AST.
   */
  private void initAST() {
    GNode outputs = GNode.create("Outputs");
    outputs.add(GNode.create("AnnotatedStreamList", true));
    GNode inputs = GNode.create("Inputs");
    inputs.add(GNode.create("AnnotatedStreamList", true));
    brookletRoot = GNode.create("Program");
    brookletRoot.add(outputs);
    brookletRoot.add(inputs);
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

  public String visitDecl(final GNode n) {
    currentDecl = n;
    if (null != n.getNode(2)) {
      String inputQueue = (String) dispatch(n.getNode(2));
      if (splits.containsKey(n.getString(0))) {
        String name = "dupsplit" + operatorId;
        operatorId++;
        List<String> inputs = new ArrayList<String>();
        inputs.add(0, inputQueue);
        List<String> outputs = new ArrayList<String>();
        int numSplits = splits.get(n.getString(0));
        for (int i = 0; i < numSplits; i++) {
          String dupName = inputQueue + "_dup" + i;
          outputs.add(dupName);
        }
        this.createOpInvoke(name, inputs, outputs);
      }
    }
    return n.getString(0);
  }

  /* Visit RName and SName */
  public String visitStream(final GNode n) {
    String name = n.getString(0);
    operatorId++;
    return name;
  }

  public String visitRelation(final GNode n) {
    String name = n.getString(0);
    operatorId++;
    return name;
  }

  public String visitR2R(String name, final GNode n, final Node relQueryList) {
    operatorId++;
    List<String> inputs = new ArrayList<String>();
    for (int i = 0; i < relQueryList.size(); i++) {
      String queue = (String) dispatch(relQueryList.getNode(i));
      inputs.add(0, queue);
    }
    String outputQueue = null;
    if (n == currentDecl.getNode(2)) {
      outputQueue = currentDecl.getString(0);
    } else {
      outputQueue = Util.freshId();
    }
    List<String> outputs = new ArrayList<String>();
    outputs.add(outputQueue);
    this.createOpInvoke(name, inputs, outputs);
    return outputQueue;
  }

  public String visitOp(String name, final GNode n, final Node relQuery) {
    operatorId++;
    List<String> inputs = new ArrayList<String>();
    String queue = (String) dispatch(relQuery);
    inputs.add(0, queue);
    String outputQueue = null;
    if (n == currentDecl.getNode(2)) {
      outputQueue = currentDecl.getString(0);
    } else {
      outputQueue = Util.freshId();
    }
    List<String> outputs = new ArrayList<String>();
    outputs.add(outputQueue);
    this.createOpInvoke(name, inputs, outputs);
    return outputQueue;
  }

  public String visitStatelessOp(String name, final GNode n, final Node relQuery) {
    operatorId++;
    List<String> inputs = new ArrayList<String>();
    String queue = (String) dispatch(relQuery);
    inputs.add(0, queue);
    String outputQueue = null;
    if (n == currentDecl.getNode(2)) {
      outputQueue = currentDecl.getString(0);
    } else {
      outputQueue = Util.freshId();
    }
    List<String> outputs = new ArrayList<String>();
    outputs.add(outputQueue);
    this.createStatelessOpInvoke(name, inputs, outputs);
    return outputQueue;
  }

  /* R2R Operators */
  public String visitUnion(final GNode n) {
    String name = "union" + operatorId;
    return visitR2R(name, n, n.getNode(0));
  }

  public String visitProject(final GNode n) {
    String name = "project" + operatorId;
    return visitR2R(name, n, n.getNode(1));
  }

  public String visitSelect(final GNode n) {
    String name = "select" + operatorId;
    return visitR2R(name, n, n.getNode(1));
  }

  public String visitJoin(final GNode n) {
    String name = "join" + operatorId;
    return visitR2R(name, n, n.getNode(1));
  }

  public String visitAggregate(final GNode n) {
    String name = "aggregate" + operatorId;
    return visitR2R(name, n, n.getNode(2));
  }

  public String visitDistinct(final GNode n) {
    String name = "distinct" + operatorId;
    return visitR2R(name, n, n.getNode(0));
  }

  /* R2S Operators */
  public String visitIStream(final GNode n) {
    String name = "istream" + operatorId;
    return visitStatelessOp(name, n, n.getNode(0));
  }

  public String visitDStream(final GNode n) {
    String name = "dstream" + operatorId;
    return visitStatelessOp(name, n, n.getNode(0));
  }

  public String visitRStream(final GNode n) {
    String name = "rstream" + operatorId;
    return visitStatelessOp(name, n, n.getNode(0));
  }

  /* S2R Operators */
  public String visitNow(final GNode n) {
    String name = "now" + operatorId;
    return visitStatelessOp(name, n, n.getNode(0));
  }

  public String visitRange(final GNode n) {
    String name = "range" + operatorId;
    return visitOp(name, n, n.getNode(1));
  }

  public String visitRows(final GNode n) {
    String name = "rows" + operatorId;
    return visitOp(name, n, n.getNode(1));
  }

  public String visitPartition(final GNode n) {
    String name = "partition" + operatorId;
    return visitOp(name, n, n.getNode(2));
  }

  /************* Helper functions ******************/
  private void createStatelessOpInvoke(String name, List<String> inputQueues,
      List<String> outputQueues) {
    GNode inputQs = GNode.create("StreamList");
    for (String s : inputQueues) {
      inputQs.add(GNode.create("Stream", s));
    }
    GNode outputQs = GNode.create("StreamList");
    for (String s : outputQueues) {
      outputQs.add(GNode.create("Stream", s));
    }
    brookletRoot.add(GNode.create("OpInvoke", null, GNode.create("StreamsAndVars",
        outputQs, null), GNode.create("Operator", name), GNode.create(
        "StreamsAndVars", inputQs, null)));
  }

  /** Visit the specified Relation2Relation node. */
  private void createOpInvoke(String name, List<String> inputQueues,
      List<String> outputQueues) {
    GNode inputQs = GNode.create("StreamList");
    for (String s : inputQueues) {
      inputQs.add(GNode.create("Stream", s));
    }
    GNode outputQs = GNode.create("StreamList");
    for (String s : outputQueues) {
      outputQs.add(GNode.create("Stream", s));
    }
    List<String> variables = new ArrayList<String>();
    for (int i = 0; i < inputQueues.size(); i++) {
      variables.add(0, Util.freshVar());
    }
    GNode inputVs = GNode.create("VarList");
    GNode outputVs = GNode.create("VarList");
    for (String s : variables) {
      inputVs.add(GNode.create("Var", s));
      outputVs.add(GNode.create("Var", s));
    }
    brookletRoot.add(GNode.create("OpInvoke", null, GNode.create("StreamsAndVars",
        outputQs, outputVs), GNode.create("Operator", name), GNode.create(
        "StreamsAndVars", inputQs, inputVs)));
  }
}
