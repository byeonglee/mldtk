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
package xtc.lang.babble.optimizer;

import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;

import xtc.lang.babble.util.Util;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Runtime;
import xtc.util.SymbolTable;

/**
 * A data parallel optimizer for Brooklet
 * 
 * @author Robert Soule
 * @version $Revision: 1.7 $
 */
public class FissionOptimizer extends Visitor implements Optimization {
  /* the symbol table of queue names */
  private SymbolTable table = null;
  /* the root of the optimized program */
  private Node optimized = null;
  /* maps queue names to the operator that they input to */
  private Map<String, Node> queueToInputOp = null;
  /* maps queue names to the operator that they output from */
  private Map<String, Node> queueToOutputOp = null;
  /* maps split to merge */
  private Map<Node, Node> splitToMerge = null;
  /* maps mergeToSplit */
  private Map<Node, Node> mergeToSplit = null;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public FissionOptimizer() {
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
    splitToMerge = new HashMap<Node, Node>();
    mergeToSplit = new HashMap<Node, Node>();
    table = new BookKeeper().analyze(brookletAST, new SymbolTable());
    optimized = new SplitMergeAdder().optimize(brookletAST);
    optimized = new MergeSplitCombiner().merge(optimized);
    return new Optimization.Result(true, optimized, boatAST);
  }

  private Node getVarList(Node n) {
    if (n.size() == 2) {
      return n.getNode(1);
    } else {
      return n.getNode(0);
    }
  }

  private boolean isAnnotated(Node n, String annotation) {
    Node annotations = n.getNode(0);
    if (annotations == null) {
      return false;
    }
    for (int i = 0; i < annotations.size(); i++) {
      if (annotation.equals(annotations.getNode(i).getString(0))) {          
        return true;
      }
    }
    return false;
  }

  private Node getKeysFromAnnotatedStream(Node n) {
    Node annotations = n.getNode(0);
    if (annotations == null) 
      return null;
    for (int i = 0; i < annotations.size(); i++) {
      if ("Keys".equals(annotations.getNode(i).getString(0))) {          
        return annotations.getNode(i);
      }
    }    return null;
  }

  private Node getKeys(Node n) {
    Node annotations = n.getNode(0);
    for (int i = 0; i < annotations.size(); i++) {
      if ("Keys".equals(annotations.getNode(i).getString(0))) {          
        return annotations.getNode(i);
      }
    }
    return null;
  }

  private boolean isStatefull(Node n) {
    if (null != getVarList(n.getNode(3))) {
      return true;
    }
    if (null != getVarList(n.getNode(1))) {
      return true;
    }
    return false;
  }

  private Node createOpInvoke(String name, List<String> inputQueues,
      List<String> outputQueues, List<String> inputVariables,
      List<String> outputVariables, Node annotation) {
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
    opInvoke.add(annotation);
    opInvoke.add(outputs);
    opInvoke.add(GNode.create("Operator", name));
    opInvoke.add(inputs);
    return opInvoke;
  }

  Node makeParallelAnnotation() {
    return GNode.create("Annotations", GNode.create("Annotation", "Parallel"));
  }

  Node makeKeysAnnotation(Node keys) {
    return GNode.create("Annotations", keys);
  }

  private Node makeSplitter(Node optimized, Node n, String splitName) {
    List<String> splitInputQs = new ArrayList<String>();
    List<String> splitOutputQs = new ArrayList<String>();
    List<String> splitInputVs = new ArrayList<String>();
    List<String> splitOutputVs = new ArrayList<String>();
    Node inputs = n.getNode(3);
    if ("StreamList".equals(inputs.getNode(0).getName())) {
      for (int i = 0; i < inputs.getNode(0).size(); i++) {
        splitInputQs.add(inputs.getNode(0).getNode(i).getString(0));
      }
    }
    splitName = splitName + "_" + n.getNode(2).getString(0);
    String splitQueue = Util.freshId(table);
    inputs.getNode(0).set(0, GNode.create("Stream", splitQueue));
    splitOutputQs.add(splitQueue);
    Node splitter = createOpInvoke(splitName, splitInputQs, splitOutputQs,
        splitInputVs, splitOutputVs, null);
    queueToInputOp.put(splitQueue, n);
    queueToInputOp.put(splitter.getNode(3).getNode(0).getNode(0).getString(0),
        splitter);
    queueToOutputOp.put(splitQueue, splitter);
    return splitter;
  }

  private Node makeMerger(Node optimized, Node n, String mergeName) {
    List<String> mergeInputQs = new ArrayList<String>();
    List<String> mergeOutputQs = new ArrayList<String>();
    List<String> mergeInputVs = new ArrayList<String>();
    List<String> mergeOutputVs = new ArrayList<String>();
    Node outputs = n.getNode(1);
    if ("StreamList".equals(outputs.getNode(0).getName())) {
      for (int i = 0; i < outputs.getNode(0).size(); i++) {
        mergeOutputQs.add(outputs.getNode(0).getNode(i).getString(0));
      }
    }
    mergeName = mergeName + "_" + n.getNode(2).getString(0);
    String mergeQueue = Util.freshId(table);
    if ("StreamList".equals(outputs.getNode(0).getName())) {
      outputs.getNode(0).set(0, GNode.create("Stream", mergeQueue));
    } else {
      n.set(1, 
            GNode.create("StreamsAndVars", 
                         GNode.create("StreamList", GNode.create("Stream", mergeQueue)), 
                         outputs.getNode(0)));
    }

    mergeInputQs.add(mergeQueue);

    Node merger = createOpInvoke(mergeName, mergeInputQs, mergeOutputQs,
        mergeInputVs, mergeOutputVs, null);

    queueToInputOp.put(mergeQueue, merger);
    if (merger.getNode(0) != null) {
      queueToOutputOp.put(merger.getNode(1).getNode(0).getNode(0).getString(0),
          merger);
    }
    queueToOutputOp.put(mergeQueue, n);
    return merger;
  }

  private String getSplitName(boolean statefull, boolean keyed) {
    if (!statefull) {
      return "roundrobinsplit";
    } else if (keyed) {
      return "hashsplit";
    } else {
      System.err.println("Can't parallelize a statefull, non-keyed operator");
      return null;
    }
  }

  private String getMergeName(boolean statefull, boolean keyed) {
    if (!statefull) {
      return "roundrobinmerge";
    } else if (keyed) {
      return "simplemerge";
    } else {
      System.err.println("Can't parallelize a statefull, non-keyed operator");
      return null;
    }
  }

  /****************************************************************************
   * MergeSplitCombiner Related Helpers
   ****************************************************************************/
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

  /****************************************************************************
   *
   ****************************************************************************/
  private class MergeSplitCombiner extends Visitor {
    private Node merged = null;
    private Node root = null;
    private Set<Node> skips = null;

    private MergeSplitCombiner() { /* do nothing */
    }

    public Node merge(Node root) {
      this.root = root;
      skips = new HashSet<Node>();
      merged = GNode.create("Program");
      merged.add(root.getNode(0));
      merged.add(root.getNode(1));
      this.dispatch(root);
      return merged;
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

    public void visitInputs(GNode n) {
      Node streamList = n.getNode(0);
      for (int i = 0; i < streamList.size(); i++) {
        Node annotatedStream = streamList.getNode(i);
        Node keys = getKeysFromAnnotatedStream(annotatedStream);
        if (keys == null) {
          continue;
        }
        Node nextNode = queueToInputOp.get(annotatedStream.getString(1));
        boolean keyedSplit = isKeyedSplit(nextNode);
        if (keyedSplit) {
          doInputMerge(skips, root, merged, annotatedStream, nextNode);
        }
      }
    }

    public void visitOpInvoke(GNode n) {

      if (skips.contains(n)) {
        return;
      }


      boolean statelessMerge = isStatelessMerge(n);
      boolean keyedMerge = isKeyedMerge(n);
      boolean isMerge = statelessMerge || keyedMerge;
      if (!isMerge) {
        merged.add(n);
        return;
      }
      if (n.getNode(1) == null) {
        merged.add(n);
        return;
      }
      Node nextNode = queueToInputOp.get(n.getNode(1).getNode(0).getNode(0)
          .getString(0));
      if (nextNode == null) {
        merged.add(n);
        return;
      }

      boolean statelessSplit = isStatelessSplit(nextNode);
      boolean keyedSplit = isKeyedSplit(nextNode);
      // Case 1: If two consecutive Split/Merge sections are both stateless,
      // combine them
      if (statelessMerge && statelessSplit) {
        doCase1(skips, root, merged, n, nextNode);
      }
      // Case 2: If both keyed-stateful with the same key, combine them
      else if (keyedMerge && keyedSplit) {
        /* TODO: add this back */
        doCase2(skips, root, merged, n, nextNode);
      }
      // Case 3: If If the first is stateful and the second is
      // stateless, combine them, using a HashSplit
      else if (keyedMerge && statelessSplit) {
        doCase3(skips, root, merged, n, nextNode);
      }
      // Case 4: If the first Split/Merge section is stateless and the second is
      // keyed-stateful, combine them using a HashSplit if the key is already
      // available before the first section, or is trivial to compute at that
      // point.
      else if (statelessMerge && keyedSplit) {
        doCase4(skips, root, merged, n, nextNode);
      }
    }

    private void doInputMerge(Set<Node> skips, Node root, Node merged,
        Node input, Node splitter) {
      // if (1 < 2) {
      // //merged.add(merger);
      // return;
      // }
      Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
          .getNode(0).getString(0));
      String q = Util.freshId(table);
      afterSplitter.getNode(3).getNode(0).getNode(0).set(0, q);
      GNode mergeAnnotations = GNode.create("Annotations");
      GNode splitAnnotations = GNode.create("Annotations");
      mergeAnnotations.add(GNode.create("Annotation", "Parallel", null));
      splitAnnotations.add(GNode.create("Annotation", "Parallel", null));
      GNode annotations = (GNode) input.getNode(0);
      for (int i = 0; i < annotations.size(); i++) {
        mergeAnnotations.add(annotations.get(i));
      }
      annotations = (GNode) splitter.getNode(0);
      for (int i = 0; i < annotations.size(); i++) {
        splitAnnotations.add(annotations.get(i));
      }
      Node pairedMerge = splitToMerge.get(splitter);
      splitter.set(0, splitAnnotations);
      mergeToSplit.put(pairedMerge, splitter);
      merged.add(splitter);
      skips.add(splitter);
      String mergeName = "simplemerge" + "_" + input.getString(1);
      GNode newMerger = 
        GNode.create("OpInvoke", 
                     mergeAnnotations,
                     afterSplitter.getNode(3),
                     GNode.create("Operator", mergeName), 
                     splitter.getNode(1));
      queueToInputOp.put(q, afterSplitter);
      queueToOutputOp.put(q, newMerger);
      queueToInputOp.put(
          splitter.getNode(1).getNode(0).getNode(0).getString(0), newMerger);
      merged.add(newMerger);
      mergeToSplit.put(newMerger, null);
    }

    // Case 1: If two consecutive Split/Merge sections are both stateless,
    // combine them
    private void doCase1(Set<Node> skips, Node root, Node merged, Node merger,
        Node splitter) {
      //System.out.println("FissionOptimizer::doCase1");
      Node beforeMerger = queueToOutputOp.get(merger.getNode(3).getNode(0)
          .getNode(0).getString(0));
      Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
          .getNode(0).getString(0));
      afterSplitter.getNode(3).set(0, beforeMerger.getNode(1).getNode(0));
      skips.add(splitter);
    }

    // Case 2: If both keyed-stateful with the same key, combine them
    private void doCase2(Set<Node> skips, Node root, Node merged, Node merger,
        Node splitter) {
      //System.out.println("FissionOptimizer::doCase2");
      Node mergeKeys = getKeys(merger);
      Node splitKeys = getKeys(splitter);
      // Check if the merge is a "don't care"
      if (mergeKeys.getNode(1) == null) {
        Node dontCareSplit = mergeToSplit.get(merger);
        Node dontCareKeys = getKeys(dontCareSplit);
        dontCareSplit.set(2, splitter.getNode(2));
        dontCareKeys.set(1, splitKeys.getNode(1));
        Node beforeMerger = queueToOutputOp.get(merger.getNode(3).getNode(0)
            .getNode(0).getString(0));
        Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
            .getNode(0).getString(0));
        afterSplitter.getNode(3).set(0, beforeMerger.getNode(1).getNode(0));
        skips.add(splitter);
        return;
      }


      // If its not the "don't care case", then combine if they have the same
      // key
      List<String> mergeKeysList = new ArrayList<String>();
      List<String> splitKeysList = new ArrayList<String>();
      for (int i = 0; i < mergeKeys.getNode(1).size(); i++) {
        mergeKeysList.add(mergeKeys.getNode(1).getNode(i).getString(0));
      }
      if (splitKeys != null) {
        for (int i = 0; i < splitKeys.getNode(1).size(); i++) {
          splitKeysList.add(splitKeys.getNode(1).getNode(i).getString(0));
        }
      }
      if (mergeKeysList.size() != splitKeysList.size()) {
        merged.add(merger);
        return;
      }
      java.util.Collections.sort(mergeKeysList);
      java.util.Collections.sort(splitKeysList);
      for (int i = 0; i < mergeKeysList.size(); i++) {
        if (!mergeKeysList.get(i).equals(splitKeysList.get(i))) {
          merged.add(merger);
          return;
        }
      }
      Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
          .getNode(0).getString(0));
      Node beforeMerger = queueToOutputOp.get(merger.getNode(3).getNode(0)
          .getNode(0).getString(0));
      afterSplitter.getNode(3).set(0, beforeMerger.getNode(1).getNode(0));
      skips.add(splitter);
    }

    private void doCase3(Set<Node> skips, Node root, Node merged, Node merger,
        Node splitter) {
      //System.out.println("FissionOptimizer::doCase3");
      Node statelesMerger = splitToMerge.get(splitter);
      Node beforeMerger = queueToOutputOp.get(merger.getNode(3).getNode(0)
          .getNode(0).getString(0));
      Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
          .getNode(0).getString(0));
      afterSplitter.getNode(3).set(0, beforeMerger.getNode(1).getNode(0));
      statelesMerger.set(2, merger.get(2));
      statelesMerger.set(0, merger.get(0));
      skips.add(splitter);
    }

    // Case 4: If the first Split/Merge section is stateless and the second is
    // keyed-stateful, combine them using a HashSplit if the key is already
    // available before the first section, or is trivial to compute at that
    // point.
    private void doCase4(Set<Node> skips, Node root, Node merged, Node merger,
        Node splitter) {
      //System.out.println("FissionOptimizer::doCase4");
      Node mergerInputs = merger.getNode(3);
      splitter.set(3, mergerInputs);
      Node statelesSplitter = mergeToSplit.get(merger);
      splitToMerge.put(statelesSplitter, null);
      GNode newAnnotationList = GNode.create("Annotations");
      GNode mergeAnnotationList = GNode.create("Annotations");
      newAnnotationList.add(GNode.create("Annotation", "Parallel", null));
      mergeAnnotationList.add(GNode.create("Annotation", "Parallel", null));


      GNode annotations = (GNode) splitter.getNode(0);
      for (int i = 0; i < annotations.size(); i++) {
        newAnnotationList.add(annotations.get(i));
        mergeAnnotationList.add(annotations.get(i));
      }

      splitter.set(0, newAnnotationList);
      Node afterSplitter = queueToInputOp.get(splitter.getNode(1).getNode(0)
          .getNode(0).getString(0));
      String q = Util.freshId(table);
      afterSplitter.getNode(3).getNode(0).getNode(0).set(0, q);
      merged.add(splitter);
      skips.add(splitter);

      /* stateless merge, keyed split */
      String mergeName = "simplemerge" + "_"
          + splitter.getNode(2).getString(0).substring("hashsplit_".length());      

      /* Todo: getting var here */
      Node simpleMerge = GNode.create("OpInvoke", mergeAnnotationList, 
                                      GNode.create("StreamsAndVars", afterSplitter.getNode(3).getNode(0), null), 
                                      GNode.create("Operator", mergeName), splitter.getNode(1));

      merged.add(simpleMerge);
    }
  }

  /****************************************************************************
   *
   ****************************************************************************/
  private class SplitMergeAdder extends Visitor {
    private Node optimized = null;

    private SplitMergeAdder() { /* do nothing */
    }

    private Node optimize(Node root) {
      this.optimized = GNode.create("Program");
      optimized.add(root.getNode(0));
      optimized.add(root.getNode(1));
      this.dispatch(root);
      return optimized;
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

    public void visitOpInvoke(GNode n) {
      if (null == n.getNode(0)) {
        optimized.add(n);
        return;
      }
      boolean parallel = isAnnotated(n, "Parallel");
      boolean keyed = isAnnotated(n, "Keys");
      Node keys = getKeys(n);
      boolean statefull = isStatefull(n);
      if (!parallel) {
        optimized.add(n);
        return;
      }
      String splitName = getSplitName(statefull, keyed);
      String mergeName = getMergeName(statefull, keyed);
      Node splitter = makeSplitter(optimized, n, splitName);
      Node merger = makeMerger(optimized, n, mergeName);
      if (keyed) {
        Node annotation = makeKeysAnnotation(keys);
        splitter.set(0, annotation);
        merger.set(0, annotation);
      }
      optimized.add(splitter);
      optimized.add(n);
      optimized.add(merger);
      splitToMerge.put(splitter, merger);
      mergeToSplit.put(merger, splitter);
    }
  }

  /****************************************************************************
   *
   ****************************************************************************/
  /**
   * A visitor to collect queue names, and to map queues to operators.
   */
  private class BookKeeper extends Visitor {
    private SymbolTable table = null;

    private BookKeeper() { /* do nothing */
    }

    private SymbolTable analyze(Node root, SymbolTable table) {
      this.table = table;
      this.dispatch(root);
      return this.table;
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
      table.current().define(n.getString(0), n);
    }

    public void visitVar(final GNode n) {
      table.current().define(n.getString(0), n);
    }

    public void visitOpInvoke(GNode n) {
      Node inputs = n.getNode(3);
      if ("StreamList".equals(inputs.getNode(0).getName())) {
        for (int i = 0; i < inputs.getNode(0).size(); i++) {
          queueToInputOp.put(inputs.getNode(0).getNode(i).getString(0), n);
        }
      }
      Node outputs = n.getNode(1);
      if ("StreamList".equals(outputs.getNode(0).getName())) {
        for (int i = 0; i < outputs.getNode(0).size(); i++) {
          queueToOutputOp.put(outputs.getNode(0).getNode(i).getString(0), n);
        }
      }
      dispatch(n.getNode(1));
      dispatch(n.getNode(3));
    }
  }
}
