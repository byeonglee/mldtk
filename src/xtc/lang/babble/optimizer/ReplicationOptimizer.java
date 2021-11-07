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
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

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
 * @version $Revision: 1.8 $
 */
public class ReplicationOptimizer extends Visitor implements Optimization {
  /* the symbol table of queue names */
  private SymbolTable names = null;
  /* the root of the optimized brooklet program */
  private Node optimized = null;
  /* the root of the ocaml implementation */
  private Node boatRoot = null;
  /* the root of the augmented ocaml implementation */
  protected Node unitImplementation = null;
  /* the ocaml factory */
  protected OperatorFactory factory = null;
  private boolean changeInputsFlag;
  /* the number of replicas specified */
  private int replicas;
  private List<List<String>> inputQueues;
  private List<List<String>> outputQueues;
  /* maps queue names to the operator that they input to */
  private Map<String, Node> queueToInputOp = null;
  /* maps queue names to the operator that they output from */
  private Map<String, Node> queueToOutputOp = null;

  public ReplicationOptimizer(int n) {
    this.replicas = n;
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
    this.boatRoot = boatAST;
    this.unitImplementation = boatRoot.getNode(0);
    this.unitImplementation = GNode.ensureVariable((GNode) unitImplementation);
    queueToInputOp = new HashMap<String, Node>();
    queueToOutputOp = new HashMap<String, Node>();
    new SetHashSplitReplicator().dispatch(unitImplementation);
    factory = new OperatorFactory();
    this.optimized = GNode.create("Program");
    changeInputsFlag = false;
    inputQueues = new ArrayList<List<String>>();
    outputQueues = new ArrayList<List<String>>();
    for (int i = 0; i < replicas; i++) {
      inputQueues.add(new ArrayList<String>());
      outputQueues.add(new ArrayList<String>());
    }
    names = new BookKeeper().analyze(brookletAST, new SymbolTable());
    this.dispatch(brookletAST);
    optimized = new SinkSourceCleanup().cleanup(optimized);
    boatRoot.set(0, unitImplementation);
    return new Optimization.Result(true, optimized, boatRoot);
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

  public void visitOutputs(GNode n) {
    optimized.add(n);
  }

  public void visitInputs(GNode n) {
    optimized.add(n);
  }

  public void visitOpInvoke(GNode n) {

    boolean parallel = isAnnotated(n, "Parallel");
    boolean isSplit = isKeyedSplit(n) || isStatelessSplit(n);
    boolean isMerge = isStatelessMerge(n) || isKeyedMerge(n);
    if (isSplit) {
      generateSplit(n);
      replicateSplit(optimized, n);
    } else if (isMerge) {
      replicateMerge(optimized, n);
    } else if ((!parallel) && (!changeInputsFlag)) {
      optimized.add(n);
    } else if ((!parallel) && (changeInputsFlag)) {
      optimized.add(n);
    } else if (parallel) {
      replicateParallel(optimized, n);
    }
  }

  /****************************************************************************
   * ReplicationOptimizer Helper Functions
   ****************************************************************************/
  private void replicateSplit(Node optimized, Node splitter) {
    List<String> splitInputQs = new ArrayList<String>();
    List<String> splitOutputQs = new ArrayList<String>();
    List<String> splitInputVs = new ArrayList<String>();
    List<String> splitOutputVs = new ArrayList<String>();
    clearQueues(outputQueues);
    boolean parallel = isAnnotated(splitter, "Parallel");
    int repeat = parallel ? replicas : 1;
    for (int i = 0; i < repeat; i++) {
      if (!changeInputsFlag) {
        splitInputQs
            .add(splitter.getNode(3).getNode(0).getNode(0).getString(0));
      } else {
        splitInputQs = inputQueues.get(i);
      }
      for (int j = 0; j < replicas; j++) {
        String queueName = Util.freshId(names);
        outputQueues.get(j).add(queueName);
        splitOutputQs.add(queueName);
      }
      
      GNode annotations =  GNode.create("Annotations");
      annotations.add(makeGroupAnnotation(i));
      Node oldAnnotations = splitter.getNode(0);
      if (oldAnnotations != null) {
        for (int k = 0; k < oldAnnotations.size(); k++) {
          Node annotation = oldAnnotations.getNode(k);
          if ("Fuse".equals(annotation.getString(0))) {
            String fuseId = annotation.getNode(1).getNode(0).getString(0);
            fuseId += "_" + i;
            Node fuseAnnotation =  GNode.create("Annotation", "Fuse",
                                                GNode.create("ExpressionList",                                                                   
                                                             GNode.create("Variable", fuseId)));
            annotations.add(fuseAnnotation);
          } else {
            annotations.add(annotation);
          }
        }
      }

      optimized.add(this.createOpInvoke(splitter.getNode(2).getString(0),
          splitInputQs, splitOutputQs, splitInputVs, splitOutputVs,
         annotations));
      splitInputQs.clear();
      splitOutputQs.clear();
    }
    changeInputsFlag = true;
    inputQueues = new ArrayList<List<String>>();
    inputQueues.addAll(outputQueues);
  }

  private void generateSplit(Node splitter) {
    if (isKeyedSplit(splitter)) {
      Node beforeSplit = queueToOutputOp.get(splitter.getNode(3).getNode(0)
                                             .getNode(0).getString(0));
    }
  }

  private void replicateMerge(Node optimized, Node merger) {
    boolean parallel = isAnnotated(merger, "Parallel");
    List<String> mergeInputQs;
    List<String> mergeOutputQs;
    List<String> mergeInputVs = new ArrayList<String>();
    List<String> mergeOutputVs = new ArrayList<String>();
    clearQueues(outputQueues);
    if (!parallel) {
      mergeInputQs = new ArrayList<String>();
      mergeOutputQs = new ArrayList<String>();
      for (int k = 0; k < replicas; k++) {
        mergeInputQs.addAll(inputQueues.get(k));
      }
      if (merger.getNode(1) != null) {
        if (merger.getNode(1).getNode(0).getNode(0).size() > 0) {
          String queueName = merger.getNode(1).getNode(0).getNode(0).getString(
              0);
          outputQueues.get(0).add(queueName);
          mergeOutputQs.add(queueName);
        }
      }
      optimized.add(this.createOpInvoke(merger.getNode(2).getString(0),
          mergeInputQs, mergeOutputQs, mergeInputVs, mergeOutputVs, null));
    } else {
      for (int i = 0; i < replicas; i++) {
        mergeInputQs = new ArrayList<String>();
        mergeOutputQs = new ArrayList<String>();
        mergeInputQs.addAll(inputQueues.get(i));
        if (merger.getNode(1) != null) {
          String queueName = Util.freshId(names);
          outputQueues.get(i).add(queueName);
          mergeOutputQs.add(queueName);
        }

        GNode annotations =  GNode.create("Annotations");
        annotations.add(makeGroupAnnotation(i));
        Node oldAnnotations = merger.getNode(0);
        if (oldAnnotations != null) {
          for (int k = 0; k < oldAnnotations.size(); k++) {
            Node annotation = oldAnnotations.getNode(k);
            if ("Fuse".equals(annotation.getString(0))) {
              String fuseId = annotation.getNode(1).getNode(0).getString(0);
              fuseId += "_" + i;
            Node fuseAnnotation =  GNode.create("Annotation", "Fuse",
                                                GNode.create("ExpressionList",                                                                   
                                                             GNode.create("Variable", fuseId)));
            annotations.add(fuseAnnotation);
            } else {
              annotations.add(annotation);
            }
          }
        }

        optimized.add(this.createOpInvoke(merger.getNode(2).getString(0),
            mergeInputQs, mergeOutputQs, mergeInputVs, mergeOutputVs,
            annotations));
      }
    }
    inputQueues = new ArrayList<List<String>>();
    inputQueues.addAll(outputQueues);
  }

  private void replicateParallel(Node optimized, Node op) {
    List<String> opInputQs;
    List<String> opOutputQs;
    List<String> opInputVs;
    List<String> opOutputVs;
    clearQueues(outputQueues);
    for (int i = 0; i < replicas; i++) {
      opInputQs = new ArrayList<String>();
      opOutputQs = new ArrayList<String>();
      opInputVs = new ArrayList<String>();
      opOutputVs = new ArrayList<String>();

      opInputQs.addAll(inputQueues.get(i));

      Node outputStreamsAndVars = op.getNode(1);
      Node outputVarList = null;
      if (outputStreamsAndVars != null) {
        if ("VarList".equals(outputStreamsAndVars.getNode(0).getName())) {
          outputVarList = outputStreamsAndVars.getNode(0);
        } else if (outputStreamsAndVars.getNode(1) != null) {
          outputVarList = outputStreamsAndVars.getNode(1);
        }
        if (outputVarList != null) {
          for (int j=0; j < outputVarList.size(); j++) {
            String varName = outputVarList.getNode(j).getString(0);
            varName += "_" + i;
            opOutputVs.add(varName);
          }
        }
      }

      Node inputStreamsAndVars = op.getNode(1);
      Node inputVarList = null;
      if (inputStreamsAndVars != null) {
        if ("VarList".equals(inputStreamsAndVars.getNode(0).getName())) {
          inputVarList = inputStreamsAndVars.getNode(0);
        } else if (inputStreamsAndVars.getNode(1) != null) {
          inputVarList = inputStreamsAndVars.getNode(1);
        }
        if (inputVarList != null) {
          for (int j=0; j < inputVarList.size(); j++) {
            String varName = inputVarList.getNode(j).getString(0);
            varName += "_" + i;
            opInputVs.add(varName);
          }
        }
      }


      for (int k = 0; k < op.getNode(1).getNode(0).size(); k++) {
        String q = Util.freshId(names);
        opOutputQs.add(q);
        outputQueues.get(i).add(q);
      }
      
      GNode annotations =  GNode.create("Annotations");
      annotations.add(makeGroupAnnotation(i));
      Node oldAnnotations = op.getNode(0);
      if (oldAnnotations != null) {
        for (int k = 0; k < oldAnnotations.size(); k++) {
          Node annotation = oldAnnotations.getNode(k);
          if ("Fuse".equals(annotation.getString(0))) {
            String fuseId = annotation.getNode(1).getNode(0).getString(0);
            fuseId += "_" + i;
            Node fuseAnnotation =  GNode.create("Annotation", "Fuse",
                                                GNode.create("ExpressionList",                                                                   
                                                             GNode.create("Variable", fuseId)));
            annotations.add(fuseAnnotation);
          } else {
            annotations.add(annotation);
          }
        }
      }

      optimized.add(this.createOpInvoke(op.getNode(2).getString(0), opInputQs,
          opOutputQs, opInputVs, opOutputVs, annotations));
    }
    changeInputsFlag = true;
    inputQueues = new ArrayList<List<String>>();
    inputQueues.addAll(outputQueues);
  }

  private boolean isAnnotated(Node n, String annotation) {
    if (n.getNode(0) == null) {
      return false;
    }
    Node annotations = n.getNode(0);
    for (int i = 0; i < annotations.size(); i++) {
      if (annotation.equals(annotations.getNode(i).getString(0))) {
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
      // if ("roundrobinsplit".equals(n.getNode(1).getString(0))) {
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
   * NameCollector
   ****************************************************************************/
  /**
   * A visitor to collect queue names, and to map queues to operators.
   */
  private class BookKeeper extends Visitor {
    private SymbolTable names = null;

    private BookKeeper() { /* do nothing */
    }

    private SymbolTable analyze(Node root, SymbolTable names) {
      this.names = names;
      this.dispatch(root);
      return this.names;
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
      names.current().define(n.getString(0), n);
    }

    public void visitVar(final GNode n) {
      names.current().define(n.getString(0), n);
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
      dispatch(n.getNode(1));
      dispatch(n.getNode(3));
    }
  }

  /****************************************************************************
   * SetHashSplitReplicator
   ****************************************************************************/
  /* visit the boat ast and change the number of replicas */
  private class SetHashSplitReplicator extends Visitor {
    private SetHashSplitReplicator() { /* do nothing */
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

    public void visitLetBindingDef(final GNode n) {
      if ("Variable".equals(n.getNode(1).getNode(0).getNode(0).getName())) {
        if (n.getNode(1).getNode(0).getNode(0).getNode(0).getString(0).startsWith("parallelism")) {
          n.getNode(1).getNode(0).getNode(1).getNode(1).getNode(0).getNode(0).set(0, Integer.toString(replicas));
        }
      }
    }
  }

  /****************************************************************************
   * SinkSourceCleanup
   ****************************************************************************/
  private class SinkSourceCleanup extends Visitor {
    private Node cleaned;
    private Node root;
    private int index = -1;
    private Set<String> outputs;
    private Set<String> inputs;

    private SinkSourceCleanup() { /* Do nothing */
    }

    private Node cleanup(Node root) {
      this.root = root;
      this.cleaned = GNode.create("Program");
      outputs = new HashSet<String>();
      inputs = new HashSet<String>();
      this.dispatch(root);
      return cleaned;
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

    public void visitOutputs(GNode n) {
      index++;
      cleaned.add(n);
      if (n.getNode(0) == null) {
        return;
      }
      for (int i = 0; i < n.getNode(0).size(); i++) {
        outputs.add(n.getNode(0).getNode(i).getString(1));
      }
    }

    public void visitInputs(GNode n) {
      index++;
      cleaned.add(n);
      if (n.getNode(0) == null) {
        return;
      }
      for (int i = 0; i < n.getNode(0).size(); i++) {
        inputs.add(n.getNode(0).getNode(i).getString(1));
      }
    }

    public void visitOpInvoke(GNode n) {
      index++;
      boolean isSplit = isKeyedSplit(n) || isStatelessSplit(n);
      boolean isMerge = isStatelessMerge(n) || isKeyedMerge(n);
      if (isSplit) {
        cleanUpSplit(root, cleaned, n);
      } else if (isMerge) {
        cleanUpMerge(root, cleaned, n);
      } else {
        cleaned.add(n);
      }
    }

    /****************************************************************************
     * SinkSourceCleanup Helpers
     ****************************************************************************/
    private boolean isSourceSplit(Node split) {
      Node streamList = split.getNode(3).getNode(0);
      for (int i = 0; i < streamList.size(); i++) {
        String source = streamList.getNode(i).getString(0);
        if (inputs.contains(source)) {
          return true;
        }
      }
      return false;
    }

    private void cleanUpSplit(Node root, Node cleaned, Node split) {
      boolean isSourceSplit = isSourceSplit(split);
      boolean isKeyedSplit = isKeyedSplit(split);
      boolean isStatelessSplit = isStatelessSplit(split);
      String source = split.getNode(3).getNode(0).getNode(0).getString(0);
      if (isSourceSplit) {
        Node inputStreamList = GNode.create("AnnotatedStreamList");
        for (int i = 0; i < replicas; i++) {
          String name = source + "_" + i;
          Node annotatedStream = GNode.create("AnnotatedStream", 
                                              makeGroupAnnotations(i), 
                                              name);
          Node stream = GNode.create("Stream", name);
          int j = index + i;
          if (isStatelessSplit) {
            j = index + i + 1;
          }
          root.getNode(j).getNode(3).getNode(0).set(0, stream);
          inputStreamList.add(annotatedStream);
          addSourceToBoat(source, name);
        }
        if (isKeyedSplit) {
          cleaned.add(split);
        }
        root.getNode(1).set(0, inputStreamList);
      } else {
        cleaned.add(split);
      }
    }

    private boolean isSinkMerge(Node merge) {
      Node streamList = merge.getNode(1).getNode(0);
      for (int i = 0; i < streamList.size(); i++) {
        String sink = streamList.getNode(i).getString(0);
        if (outputs.contains(sink)) {
          return true;
        }
      }
      return false;
    }

    private void cleanUpMerge(Node root, Node cleaned, Node merge) {
      /* special case for a merge with empty output queues */
      if ((merge.getNode(1) == null)) {
        int cleanedIndex = cleaned.size() - 1;
        for (int i = 0; i < replicas; i++) {          
          Node outputStreamsAndVars = cleaned.getNode(cleanedIndex - i).getNode(1);
          if (outputStreamsAndVars.getNode(1) == null) {
            cleaned.getNode(cleanedIndex - i).set(1, null);
          } else {
            cleaned.getNode(cleanedIndex - i).set(1, GNode.create("StreamsAndVars", outputStreamsAndVars.getNode(1)));
          }          
        }
        return;
      }
      boolean isSinkMerge = isSinkMerge(merge);
      String sink = merge.getNode(1).getNode(0).getNode(0).getString(0);
      if (isSinkMerge) {
        Node inputStreamList = GNode.create("AnnotatedStreamList");
        int cleanedIndex = cleaned.size() - replicas;
        for (int i = 0; i < replicas; i++) {
          String name = sink + "_" + i;
          Node annotatedStream = GNode.create("AnnotatedStream", 
                                              makeGroupAnnotations(i),
                                              name);
          Node stream = GNode.create("Stream", name);
          inputStreamList.add(annotatedStream);
          cleaned.getNode(cleanedIndex + i).getNode(1).set(0, stream);
          addSinkToBoat(sink, name);
        }
        root.getNode(0).set(0, inputStreamList);
      } else {
        cleaned.add(merge);
      }
    }

    public void addSourceToBoat(String oldName, String name) {
      String wrapper = "ocaml_wrap_" + name;
      String maybe = "maybe_" + name;
      String shutdown = name + "_shutdown";
      String file = "\"/tmp/" + name + ".data\"";
      String module = Character.toUpperCase(oldName.charAt(0))
          + oldName.substring(1);
      unitImplementation.add(factory.maybeSource(
          GNode.create("LowerID", maybe), GNode.create("StringConstant", "\""
              + name + "\""), GNode.create("StringConstant", file)));
      unitImplementation.add(factory.source(GNode.create("LowerID", wrapper),
          GNode.create("LowerID", maybe), GNode.create("LowerID", module),
          GNode.create("LowerID", oldName)));
      unitImplementation.add(factory
          .shutdown(GNode.create("LowerID", shutdown)));
      unitImplementation.add(factory.callback(GNode.create("StringConstant",
          "\"" + wrapper + "\""), GNode.create("LowerID", wrapper)));
      unitImplementation.add(factory.callback(GNode.create("StringConstant",
          "\"" + shutdown + "\""), GNode.create("LowerID", shutdown)));
    }

    public void addSinkToBoat(String oldName, String name) {
      String wrapper = "ocaml_wrap_" + name;
      String maybe = "maybe_" + name;
      String shutdown = name + "_shutdown";
      String file = "\"/tmp/" + name + "\"";
      unitImplementation.add(factory.maybeSink(GNode.create("LowerID", maybe),
          GNode.create("StringConstant", "\"" + name + "\""), GNode.create(
              "StringConstant", file)));
      unitImplementation.add(factory.sink(GNode.create("LowerID", wrapper),
          GNode.create("LowerID", maybe)));
      ;
      unitImplementation.add(factory.sinkShutdown(GNode.create("LowerID",
          shutdown), GNode.create("LowerID", maybe)));
      ;
      unitImplementation.add(factory.callback(GNode.create("StringConstant",
          "\"" + wrapper + "\""), GNode.create("LowerID", wrapper)));
      unitImplementation.add(factory.callback(GNode.create("StringConstant",
          "\"" + shutdown + "\""), GNode.create("LowerID", shutdown)));
    }
  }

  /****************************************************************************
   * Helper Functions
   ****************************************************************************/
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
    } else if (inputVs != null) {
      inputs = GNode.create("StreamsAndVars", inputVs);
    } else {
      inputs = null;
    }
    if (outputQs.size() > 0) {
      outputs = GNode.create("StreamsAndVars", outputQs, outputVs);      
    } else if (outputVs != null) {
      outputs = GNode.create("StreamsAndVars", outputVs);
    } else {
      outputs = null;
    }
    opInvoke = GNode.create("OpInvoke");
    opInvoke.add(annotation);
    opInvoke.add(outputs);
    opInvoke.add(GNode.create("Operator", name));
    opInvoke.add(inputs);
    return opInvoke;
  }

  private void clearQueues(List<List<String>> l) {
    for (int i = 0; i < replicas; i++) {
      l.set(i, new ArrayList<String>());
    }
  }

  Node makeGroupAnnotations(int groupId) {
    return GNode.create("Annotations", GNode.create("Annotation", "Group",
                                                    GNode.create("ExpressionList",                                                                   
                                                                 GNode.create("IntegerConstant", Integer
                                                                              .toString(groupId)))));
  }

  Node makeGroupAnnotation(int groupId) {
    return GNode.create("Annotation", "Group",
                        GNode.create("ExpressionList",                                                                   
                                     GNode.create("IntegerConstant", Integer
                                                  .toString(groupId))));
  }

}
