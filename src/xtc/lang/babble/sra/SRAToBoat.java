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

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

import xtc.type.Type;
import xtc.type.VariableT;
import xtc.type.ErrorT;

import xtc.util.SymbolTable;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.75 $
 */
public class SRAToBoat extends Visitor {
  /** Factory to create the implementation of operators. */
  private OperatorFactory factory = null;
  /** An id number to distinguish operator instances **/
  private int operatorId = 0;
  /* The root of the operator implementation file */
  private GNode unitImplementation = null;
  /*
   * The root of the tool which translates from Marshal format to human readable
   * format
   */
  private GNode m2hRoot = null;
  /* The let binding for registering callbacks */
  Node registerLetBinding = null;
  /* The populated symbol table */
  SymbolTable table = null;
  /** The sinks */
  private Set<String> sinks = null;
  private Set<String> sources = null;
  private Map<String, Integer> splits = null;

  /* Map the final node of a declaration to the type is generates */
  private Map<Node, String> declRoots = null;

  /* all of the type declarations */
  private List<Node> typeDecls = null;

  /* all of the type declaration printers */
  private List<Node> typePrinters = null;


  /**
   * Create a new printer for the simply typed lambda calculus. * @param printer
   * The printer.
   */
  public SRAToBoat(SymbolTable table) {
    factory = new OperatorFactory();
    this.table = table;
  }

  /**
   * Produce the BOAT operators for the input SRA program.
   * 
   * @param root
   *          The root node of the SRA program AST.
   * @return true if translation succeeded, false otherwise.
   */
  public boolean translate(Node root, String outputDir, Set<String> sources,
      Set<String> sinks, Map<String, Integer> splits) {
    this.sinks = sinks;
    this.sources = sources;
    this.splits = splits;
    unitImplementation = GNode.create("UnitImplementationList");
    m2hRoot = GNode.create("UnitImplementationList");
    m2hRoot.add(factory.openPrintf());
    typeDecls = new ArrayList<Node>();
    typePrinters = new ArrayList<Node>();
    declRoots = new HashMap<Node, String>();
    dispatch(root);
    for (Node n : typePrinters) {
      unitImplementation.add(0, n);
      m2hRoot.add(0,n);
    }
    for (Node n : typeDecls) {
      unitImplementation.add(0, n);
      m2hRoot.add(0,n);
    }
    unitImplementation.add(0, factory.parallelism());
    unitImplementation.add(0, factory.outputWrap());
    unitImplementation.add(0, factory.declarePut());
    unitImplementation.add(0, factory.openPrintf());
    unitImplementation.add(registerLetBinding);
    m2hRoot.add(factory.readMarsh());
    m2hRoot.add(factory.readHum());
    m2hRoot.add(factory.m2hMain());
    writeToFile(outputDir);
    return true;
  }

  /****************************************************************************/
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

  public void visitDecl(final GNode n) {
    if (n.getNode(2) != null) {
      declRoots.put(n.getNode(2), n.getString(0));
      dispatch(n.getNode(2));
      if (sinks.contains(n.getString(0))) {
        makeSink(n);
      }
      if (splits.containsKey(n.getString(0))) {
        String name = "dupsplit" + operatorId;
        String wrapper = "ocaml_wrap_" + name;
        String shutdown = name + "_shutdown";
        int numSplits = splits.get(n.getString(0)) - 1;
        operatorId++;
        unitImplementation.add(0, factory.shutdown(GNode.create("LowerID",
            shutdown)));
        unitImplementation.add(0, factory.dupSplitWrap(GNode.create("LowerID",
                                                                      wrapper), GNode.create("LowerID", name)));
        unitImplementation.add(0, factory.dupSplit(GNode.create("LowerID",
            name), GNode.create("IntegerConstant", Integer
            .toString(numSplits))));
        this.register(wrapper);
        this.register(shutdown);
      }
    }
  }

  public String visitRelation(final GNode n) {
    String name = n.getString(0);
    String wrapper = "ocaml_wrap_" + name;
    String maybe = "maybe_" + name;
    String shutdown = name + "_shutdown";
    String file = "\"/tmp/" + name + ".data\"";
    String module = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    String out = name;
    String merge = "simplemerge_" + name;
    String mergeWrapper = "ocaml_wrap_" + merge;
    String mergeState = merge + "_state";
    String mergeArraySize = merge + "_array_size";
    String mergeMinTime = merge + "_min_time";
    String mergeResize = merge + "_resize";
    String mergeShutdown = merge + "_shutdown";
    operatorId++;
    if (sources.contains(name)) {
      unitImplementation.add(0, factory.shutdown(GNode.create("LowerID",
          mergeShutdown)));
      unitImplementation.add(0, factory.unionMergeWrap(GNode.create("LowerID",
          mergeWrapper), GNode.create("LowerID", merge)));
      unitImplementation.add(0, factory.unionMerge(GNode.create("LowerID", merge),
                                                GNode.create("LowerID", mergeMinTime),
                                                GNode.create("LowerID", mergeArraySize),
                                                GNode.create("LowerID", mergeResize),
                                                GNode.create("LowerID", mergeState)));
      unitImplementation.add(0, factory.unionMergeResize(GNode.create("LowerID", mergeResize),
                                                      GNode.create("LowerID", mergeArraySize),
                                                      GNode.create("LowerID", mergeState)));
      unitImplementation.add(0, factory.unionMergeState(GNode.create("LowerID", mergeState), 
                                                     GNode.create("LowerID", module), 
                                                     GNode.create("LowerID", out), 
                                                     GNode.create("LowerID", mergeArraySize)));
      unitImplementation.add(0, factory.unionMergeTime(GNode.create("LowerID", mergeMinTime)));
      unitImplementation.add(0, factory.unionMergeArray(GNode.create("LowerID", mergeArraySize)));
      unitImplementation.add(0, factory
          .shutdown(GNode.create("LowerID", shutdown)));
      unitImplementation.add(0, factory.source(GNode.create("LowerID", wrapper),
          GNode.create("LowerID", maybe), GNode.create("LowerID", module),
          GNode.create("LowerID", name)));
      unitImplementation.add(0, factory.maybeSource(
          GNode.create("LowerID", maybe), GNode.create("StringConstant", "\""
              + name + "\""), GNode.create("StringConstant", file)));
      this.register(wrapper);
      this.register(shutdown);
      this.register(mergeWrapper);
      this.register(mergeShutdown);
    }
    addType(out);
    return out;
  }

  public String visitStream(final GNode n) {
    String name = n.getString(0);
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String maybe = "maybe_" + name;
    String file = "\"/tmp/" + name + ".data\"";
    String module = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    String out = name;
    String merge = "simplemerge_" + name;
    String mergeWrapper = "ocaml_wrap_" + merge;
    String mergeState = merge + "_state";
    String mergeArraySize = merge + "_array_size";
    String mergeMinTime = merge + "_min_time";
    String mergeResize = merge + "_resize";
    String mergeShutdown = merge + "_shutdown";
    operatorId++;
    if (sources.contains(name)) {

      unitImplementation.add(0, factory.shutdown(GNode.create("LowerID",
          mergeShutdown)));
      unitImplementation.add(0, factory.unionMergeWrap(GNode.create("LowerID",
          mergeWrapper), GNode.create("LowerID", merge)));
      unitImplementation.add(0, factory.unionMerge(GNode.create("LowerID", merge),
                                                GNode.create("LowerID", mergeMinTime),
                                                GNode.create("LowerID", mergeArraySize),
                                                GNode.create("LowerID", mergeResize),
                                                GNode.create("LowerID", mergeState)));
      unitImplementation.add(0, factory.unionMergeResize(GNode.create("LowerID", mergeResize),
                                                      GNode.create("LowerID", mergeArraySize),
                                                      GNode.create("LowerID", mergeState)));
      unitImplementation.add(0, factory.unionMergeState(GNode.create("LowerID", mergeState), 
                                                     GNode.create("LowerID", module), 
                                                     GNode.create("LowerID", out), 
                                                     GNode.create("LowerID", mergeArraySize)));
      unitImplementation.add(0, factory.unionMergeTime(GNode.create("LowerID", mergeMinTime)));
      unitImplementation.add(0, factory.unionMergeArray(GNode.create("LowerID", mergeArraySize)));
      unitImplementation.add(0, factory
          .shutdown(GNode.create("LowerID", shutdown)));
      unitImplementation.add(0, factory.source(GNode.create("LowerID", wrapper),
          GNode.create("LowerID", maybe), GNode.create("LowerID", module),
          GNode.create("LowerID", name)));
      unitImplementation.add(0, factory.maybeSource(
          GNode.create("LowerID", maybe), GNode.create("StringConstant", "\""
              + name + "\""), GNode.create("StringConstant", file)));
      this.register(wrapper);
      this.register(shutdown);
      this.register(mergeWrapper);
      this.register(mergeShutdown);
    }
    addType(out);
    return out;
  }

  public String visitUnion(final GNode n) {
    String name = "union" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String port1buffer = name + "_port1_buffer";
    String out = Character.toLowerCase(n.getString(1).charAt(0))
        + n.getString(1).substring(1);
    operatorId++;
    List<String> inputTypes = new ArrayList<String>();
    Node relQueryList = n.getNode(0);
    for (int i = 0; i < relQueryList.size(); i++) {
      inputTypes.add((String) dispatch(relQueryList.getNode(i)));
    }
    // Make sure to use the same type here. This is okay because:
    // 1. We've already checked the types
    // 2. Marshalling loses the type information
    String port0typeName = inputTypes.get(0);
    String port1typeName = inputTypes.get(0);
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    String port1module = Character.toUpperCase(port1typeName.charAt(0))
        + port1typeName.substring(1);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.unionWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", port0buffer), GNode.create("LowerID",
            port1buffer), GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.union(GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.stateExpr(GNode.create("LowerID",
        port1buffer), GNode.create("LowerID", port1module), GNode.create(
        "LowerID", port1typeName)));
    unitImplementation.add(0, factory.stateExpr(GNode.create("LowerID",
        port0buffer), GNode.create("LowerID", port0module), GNode.create(
        "LowerID", port0typeName)));
    this.register(wrapper);
    this.register(shutdown);
    addType(out);
    return out;
  }

  public String visitProject(final GNode n) {
    String name = "project" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    boolean isDeclRoot = declRoots.containsKey(n);
    if (isDeclRoot) {
      out = declRoots.get(n);
    }
    operatorId++;
    String inputType = null;
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      inputType = (String) dispatch(relQueryList.getNode(i));
    }
    String module = Character.toUpperCase(inputType.charAt(0))
        + inputType.substring(1);
    String outModule = Character.toUpperCase(out.charAt(0)) + out.substring(1);
    Node aliasList = n.getNode(0);
    GNode fieldAssignmentList = GNode.create("FieldAssignmentList");
    for (int i = 0; i < aliasList.size(); i++) {
      Node alias = aliasList.getNode(i);
      Node normalizedExpr = (Node) new ProjectionExprNormalizer(module)
          .dispatch(alias.getNode(0));
      GNode fieldAssignment = GNode.create("FieldAssignment", GNode.create(
          "Field", GNode.create("ModulePath", outModule), alias.getString(1)),
          normalizedExpr);
      fieldAssignmentList.add(fieldAssignment);
    }
    GNode recordExpression = GNode.create("RecordExpression",
        fieldAssignmentList);
    Node expr = factory.lambdaExpr(GNode.create("Variable", GNode.create(
        "LowerID", "x")), GNode.create("LowerID", module), GNode.create(
        "UserDefinedType", inputType), recordExpression);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.projectWrap(GNode.create("NodeVariable",
        wrapper), GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.projection(GNode
        .create("NodeVariable", name), expr));
    this.register(wrapper);
    this.register(shutdown);
    if (!isDeclRoot) {
      addType(out);
    }
    return out;
  }

  public String visitSelect(final GNode n) {
    String name = "select" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    if (declRoots.containsKey(n)) {
      out = declRoots.get(n);
    }
    operatorId++;
    String inputType = null;
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      inputType = (String) dispatch(relQueryList.getNode(i));
    }
    String module = Character.toUpperCase(inputType.charAt(0))
        + inputType.substring(1);
    Node normalizedExpr = (Node) new SelectExprNormalizer(module).dispatch(n
        .getNode(0));
    Node expr = factory.lambdaExpr(GNode.create("Variable", GNode.create(
        "LowerID", "x")), GNode.create("LowerID", module), GNode.create(
        "UserDefinedType", inputType), normalizedExpr);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.selectWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.select(GNode.create("LowerID", name), expr));
    this.register(wrapper);
    this.register(shutdown);
    return inputType;
  }

  private Node createVarAssignmentExpression(String fromAttribute,
      String toModule, String toAttribute) {
    GNode id = GNode.create("LowerID", fromAttribute);
    GNode fieldAssignment = GNode.create("FieldAssignment", GNode.create(
        "Field", GNode.create("ModulePath", toModule), toAttribute), id);
    return fieldAssignment;
  }

  private Node createAvgAssignmentExpression(String v1, String v2,
      String toModule, String toAttribute) {
    Node avgCall = factory.avgCall(GNode.create("LowerID", v1), GNode.create(
        "LowerID", v2));
    GNode fieldAssignment = GNode.create("FieldAssignment", GNode.create(
        "Field", GNode.create("ModulePath", toModule), toAttribute), avgCall);
    return fieldAssignment;
  }

  private Node createJoinAssignmentExpression(String fromTuple,
      String fromModule, String fromAttribute, String toModule,
      String toAttribute) {
    GNode dotted = GNode.create("DottedExpression", GNode.create(
        "DottedExpression", GNode.create("LowerID", fromTuple), GNode.create(
            "UpperID", fromModule), null), GNode.create("LowerID",
        fromAttribute), null);
    GNode fieldAssignment = GNode.create("FieldAssignment", GNode.create(
        "Field", GNode.create("ModulePath", toModule), toAttribute), dotted);
    return fieldAssignment;
  }

  private GNode makeJoinConstrType(String constrName, String moduleName,
      String tupleName) {
    Node constructedType = GNode.create("ConstructedType", GNode.create(
        "ValuePath", GNode.create("ModulePath", moduleName), GNode.create(
            "LowerID", tupleName)), GNode.create("ValuePath", null, GNode
        .create("LowerID", "list")));
    Node parenthesizedType = GNode.create("ParenthesizedType", GNode.create(
        "TupleType", GNode.create("IntType"), GNode.create("TupleType",
            constructedType, constructedType)));
    return GNode.create("ConstrDecl", constrName, parenthesizedType);
  }

  public String visitJoin(final GNode n) {
    String name = "join" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String port1buffer = name + "_port1_buffer";
    String join0typeName = Character.toUpperCase(name.charAt(0))
        + name.substring(1) + "Port0";
    String join1typeName = Character.toUpperCase(name.charAt(0))
        + name.substring(1) + "Port1";
    String jointypeName = name + "Types";
    String out = Character.toLowerCase(n.getString(2).charAt(0))
        + n.getString(2).substring(1);
    String outModule = Character.toUpperCase(out.charAt(0)) + out.substring(1);
    operatorId++;
    List<String> inputTypes = new ArrayList<String>();
    Node relQueryList = n.getNode(1);
    for (int i = 0; i < relQueryList.size(); i++) {
      inputTypes.add((String) dispatch(relQueryList.getNode(i)));
    }
    String port0typeName = inputTypes.get(1);
    String port1typeName = inputTypes.get(0);
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    String port1module = Character.toUpperCase(port1typeName.charAt(0))
        + port1typeName.substring(1);
    table.enter("gammaB");
    Type port0type = (Type) table.current().lookup(port0typeName);
    Type port1type = (Type) table.current().lookup(port1typeName);
    table.exit();
    final List<VariableT> port0members = port0type.toStruct().getMembers();
    final List<VariableT> port1members = port1type.toStruct().getMembers();
    // Here we are making the join assignment expression
    GNode fieldAssignmentList = GNode.create("FieldAssignmentList");
    for (Type port0member : port0members) {
      Node fieldAssignment = createJoinAssignmentExpression("tup4",
          port0module, port0member.toVariable().getName(), outModule,
          port0member.toVariable().getName());
      fieldAssignmentList.add(fieldAssignment);
    }
    for (Type port1member : port1members) {
      if (ErrorT.TYPE != port0type.toStruct().lookup(
          port1member.toVariable().getName())) {
        /* don't add twice */
        continue;
      }
      Node fieldAssignment = createJoinAssignmentExpression("tup6",
          port1module, port1member.toVariable().getName(), outModule,
          port1member.toVariable().getName());
      fieldAssignmentList.add(fieldAssignment);
    }
    Node constrDeclList = GNode.create("ConstrDeclList");
    constrDeclList.add(this.makeJoinConstrType(join0typeName, port0module,
        port0typeName));
    constrDeclList.add(this.makeJoinConstrType(join1typeName, port1module,
        port1typeName));

    GNode recordExpression = GNode.create("RecordExpression",
        fieldAssignmentList);
    Node expr = factory.lambdaExpr(GNode.create("Variable", GNode.create(
        "LowerID", "tup6")), GNode.create("LowerID", port1module), GNode
        .create("UserDefinedType", port1typeName), recordExpression);
    Node normalizedExpr = (Node) new JoinExprNormalizer(port0module, port0type,
        port1module, port1type).dispatch(n.getNode(0));
    Node cond = factory.lambdaExpr(GNode.create("Variable", GNode.create(
        "LowerID", "tup5")), GNode.create("LowerID", port1module), GNode
        .create("UserDefinedType", port1typeName), normalizedExpr);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.joinWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name), GNode.create("Constr", join0typeName),
        GNode.create("Constr", join1typeName)));
    unitImplementation.add(0, factory.join(GNode.create("LowerID", name), GNode
        .create("Constr", join0typeName), GNode.create("LowerID", port0buffer),
        GNode.create("Constr", join1typeName), GNode.create("LowerID",
            port1buffer), expr, cond));
    unitImplementation.add(0, factory.queueState(GNode.create("LowerID",
        port1buffer), GNode.create("LowerID", port1module), GNode.create(
        "LowerID", port1typeName)));
    unitImplementation.add(0, factory.queueState(GNode.create("LowerID",
        port0buffer), GNode.create("LowerID", port0module), GNode.create(
        "LowerID", port0typeName)));
    unitImplementation.add(0, factory.joinTypes(GNode.create("TypeConstrName",
        jointypeName), constrDeclList));
    this.register(wrapper);
    this.register(shutdown);
    addType(out);
    return out;
  }

  public String visitAggregate(final GNode n) {
    String name = "aggregate" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String out = name + "_out";
    if (declRoots.containsKey(n)) {
      out = declRoots.get(n);
    }
    String outModule = Character.toUpperCase(out.charAt(0)) + out.substring(1);
    String split = "hashsplit_" + name;
    String splitWrapper = "ocaml_wrap_" + split;
    String splitShutdown = split + "_shutdown";
    String merge = "simplemerge_" + name;
    String mergeWrapper = "ocaml_wrap_" + merge;
    String mergeState = merge + "_state";
    String mergeArraySize = merge + "_array_size";
    String mergeMinTime = merge + "_min_time";
    String mergeResize = merge + "_resize";
    String mergeShutdown = merge + "_shutdown";
    operatorId++;
    List<String> inputTypes = new ArrayList<String>();
    Node relQueryList = n.getNode(2);
    for (int i = 0; i < relQueryList.size(); i++) {
      inputTypes.add((String) dispatch(relQueryList.getNode(i)));
    }
    String port0typeName = inputTypes.get(0);
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    table.enter("gammaB");
    Type port0type = (Type) table.current().lookup(port0typeName);
    table.exit();
    GNode fieldAssignmentList = GNode.create("FieldAssignmentList");
    List<Node> keyTypes = new ArrayList<Node>();
    Node keyList = n.getNode(0);
    for (int i = 0; i < keyList.size(); i++) {
      String key = keyList.getString(i);
      Node fieldAssignment = createJoinAssignmentExpression("item",
          port0module, key, outModule, key);
      fieldAssignmentList.add(fieldAssignment);
      Type xtcKeyType = port0type.toStruct().lookup(key);
      if (xtcKeyType == ErrorT.TYPE) {
        System.err.println("Can't find key type");
        return null;
      }
      Node keyType = xtcToBoatType(xtcKeyType.toVariable().getType());
      keyTypes.add(keyType);
    }
    List<String> variables = new ArrayList<String>();
    List<Node> insertFunctions = new ArrayList<Node>();
    List<Node> deleteFunctions = new ArrayList<Node>();
    List<Node> insertInitializers = new ArrayList<Node>();
    List<Node> deleteInitializers = new ArrayList<Node>();
    List<Node> valueTypes = new ArrayList<Node>();
    Node aggregateExpList = n.getNode(1);
    int varCount = 1;
    for (int i = 0; i < aggregateExpList.size(); i++) {
      Node aggregateExp = aggregateExpList.getNode(i);
      String attribute = aggregateExp.getString(2);
      if ("count".equals(aggregateExp.getString(0))
          || "sum".equals(aggregateExp.getString(0))) {
        String var = "v" + varCount;
        varCount++;
        variables.add(var);
        insertFunctions.add(factory.incr(GNode.create("LowerID", var)));
        deleteFunctions.add(factory.decr(GNode.create("LowerID", var)));
        insertInitializers.add(GNode.create("IntegerConstant", "1"));
        deleteInitializers.add(GNode.create("IntegerConstant", "-1"));
        valueTypes.add(GNode.create("IntType"));
        Node fieldAssignment = createVarAssignmentExpression(var, outModule,
            attribute);
        fieldAssignmentList.add(fieldAssignment);
      } else if ("sum".equals(aggregateExp.getString(0))) {
        String var = "v" + varCount;
        varCount++;
        variables.add(var);
        Node fieldAssignment = createVarAssignmentExpression(var, outModule,
            attribute);
        fieldAssignmentList.add(fieldAssignment);
        insertFunctions.add(factory.sum(GNode.create("LowerID", var), this
            .dotted("item", port0module, attribute)));
        deleteFunctions.add(factory.sub(GNode.create("LowerID", var), this
            .dotted("item", port0module, attribute)));
        insertInitializers.add(this.dotted("item", port0module, attribute));
        deleteInitializers.add(factory.neg(this.dotted("item", port0module,
            attribute)));
        valueTypes.add(GNode.create("IntType"));
      } else if ("avg".equals(aggregateExp.getString(0))) {
        String var1 = "v" + varCount;
        varCount++;
        String var2 = "v" + varCount;
        varCount++;
        variables.add(var1);
        variables.add(var2);
        insertFunctions.add(factory.sum(GNode.create("LowerID", var1), this
            .dotted("item", port0module, attribute)));
        insertFunctions.add(factory.incr(GNode.create("LowerID", var2)));
        deleteFunctions.add(factory.sub(GNode.create("LowerID", var1), this
            .dotted("item", port0module, attribute)));
        deleteFunctions.add(factory.decr(GNode.create("LowerID", var2)));
        insertInitializers.add(this.dotted("item", port0module, attribute));
        insertInitializers.add(GNode.create("IntegerConstant", "1"));
        deleteInitializers.add(factory.neg(this.dotted("item", port0module,
            attribute)));
        deleteInitializers.add(GNode.create("IntegerConstant", "-1"));
        valueTypes.add(GNode.create("IntType"));
        valueTypes.add(GNode.create("IntType"));
        Node fieldAssignment = createAvgAssignmentExpression(var1, var2,
            outModule, attribute);
        fieldAssignmentList.add(fieldAssignment);
      }
    }
    Node lastNode = null;
    for (int i = insertFunctions.size() - 1; i >= 0; i--) {
      Node func = insertFunctions.get(i);
      if (i == insertFunctions.size() - 1) {
        lastNode = func;
      } else {
        lastNode = GNode.create("CommaExpression", func, lastNode);
      }
    }
    GNode insertFunctionTuple = GNode.create("ParenthesizedExpression",
        lastNode);
    for (int i = insertInitializers.size() - 1; i >= 0; i--) {
      Node func = insertInitializers.get(i);
      if (i == insertInitializers.size() - 1) {
        lastNode = func;
      } else {
        lastNode = GNode.create("CommaExpression", func, lastNode);
      }
    }
    GNode insertInitializersTuple = GNode.create("ParenthesizedExpression",
        lastNode);
    for (int i = deleteFunctions.size() - 1; i >= 0; i--) {
      Node func = deleteFunctions.get(i);
      if (i == deleteFunctions.size() - 1) {
        lastNode = func;
      } else {
        lastNode = GNode.create("CommaExpression", func, lastNode);
      }
    }
    GNode deleteFunctionTuple = GNode.create("ParenthesizedExpression",
        lastNode);
    for (int i = deleteInitializers.size() - 1; i >= 0; i--) {
      Node func = deleteInitializers.get(i);
      if (i == deleteInitializers.size() - 1) {
        lastNode = func;
      } else {
        lastNode = GNode.create("CommaExpression", func, lastNode);
      }
    }
    GNode deleteInitializersTuple = GNode.create("ParenthesizedExpression",
        lastNode);
    for (int i = keyList.size() - 1; i >= 0; i--) {
      String key = keyList.getString(i);
      if (i == keyList.size() - 1) {
        lastNode = this.dotted("item", port0module, key);
      } else {
        lastNode = GNode.create("CommaExpression", this.dotted("item",
            port0module, key), lastNode);
      }
    }
    GNode keyTuple = GNode.create("ParenthesizedExpression", lastNode);
    for (int i = variables.size() - 1; i >= 0; i--) {
      String var = variables.get(i);
      if (i == variables.size() - 1) {
        lastNode = GNode.create("LowerID", var);
      } else {
        lastNode = GNode.create("CommaExpression",
            GNode.create("LowerID", var), lastNode);
      }
    }
    GNode valueTuple = GNode.create("ParenthesizedExpression", lastNode);
    for (int i = keyTypes.size() - 1; i >= 0; i--) {
      Node type = keyTypes.get(i);
      if (i == keyTypes.size() - 1) {
        lastNode = type;
      } else {
        lastNode = GNode.create("TupleType", type, lastNode);
      }
    }
    GNode keyTypeTuple = GNode.create("ParenthesizedExpression", lastNode);
    for (int i = valueTypes.size() - 1; i >= 0; i--) {
      Node type = valueTypes.get(i);
      if (i == valueTypes.size() - 1) {
        lastNode = type;
      } else {
        lastNode = GNode.create("TupleType", type, lastNode);
      }
    }
    GNode valueTypeTuple = GNode.create("ParenthesizedExpression", lastNode);
    GNode recordExpression = GNode.create("RecordExpression",
        fieldAssignmentList);

    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID",
        splitShutdown)));
    unitImplementation.add(0, factory.hashSplitWrap(GNode.create("LowerID",
        splitWrapper), GNode.create("LowerID", split)));
    unitImplementation.add(0, factory.hashSplit(GNode.create("LowerID", split),
        keyTuple));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID",
        mergeShutdown)));
    unitImplementation.add(0, factory.unionMergeWrap(GNode.create("LowerID",
        mergeWrapper), GNode.create("LowerID", merge)));
    unitImplementation.add(0,factory.unionMerge(GNode.create("LowerID", merge),
                                                GNode.create("LowerID", mergeMinTime),
                                                GNode.create("LowerID", mergeArraySize),
                                                GNode.create("LowerID", mergeResize),
                                                GNode.create("LowerID", mergeState)));
    unitImplementation.add(0, factory.unionMergeResize(GNode.create("LowerID", mergeResize),
                                                    GNode.create("LowerID", mergeArraySize),
                                                    GNode.create("LowerID", mergeState)));
    unitImplementation.add(0, factory.unionMergeState(GNode.create("LowerID", mergeState), 
                                                     GNode.create("LowerID", port0module), 
                                                     GNode.create("LowerID", port0typeName), 
                                                     GNode.create("LowerID", mergeArraySize)));
    unitImplementation.add(0, factory.unionMergeTime(GNode.create("LowerID", mergeMinTime)));
    unitImplementation.add(0, factory.unionMergeArray(GNode.create("LowerID", mergeArraySize)));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.aggregateWrap(GNode.create("LowerID",
        wrapper), GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.aggregate(GNode.create("LowerID", name),
        keyTuple, GNode.create("LowerID", port0buffer), valueTuple,
        insertFunctionTuple, insertInitializersTuple, recordExpression,
        deleteFunctionTuple, deleteInitializersTuple));
    unitImplementation.add(0, factory.hashExpr(GNode
        .create("LowerID", port0buffer), keyTypeTuple, valueTypeTuple));
    this.register(wrapper);
    this.register(shutdown);
    this.register(mergeWrapper);
    this.register(mergeShutdown);
    this.register(splitWrapper);
    this.register(splitShutdown);
    if (!declRoots.containsKey(n)) {
      addType(out);
    }
    return out;
  }

  public String visitDistinct(final GNode n) {
    String name = "distinct" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    if (declRoots.containsKey(n)) {
      out = declRoots.get(n);
    }
    operatorId++;
    String inputType = (String)dispatch(n.getNode(0));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.distinctWrap(GNode.create("LowerID",
        wrapper), GNode.create("LowerID", name)));
       this.register(wrapper);
    unitImplementation.add(0, factory.distinct(GNode.create("LowerID", name)));
    this.register(shutdown);
    return inputType;
  }

  public String visitIStream(final GNode n) {
    String name = "istream" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    operatorId++;
    String inputType = (String)dispatch(n.getNode(0));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.istreamWrap(GNode.create("NodeVariable",
        wrapper), GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.istream(GNode.create("NodeVariable", name)));
    this.register(wrapper);
    this.register(shutdown);
    return inputType;
  }

  public String visitDStream(final GNode n) {
    String name = "dstream" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    operatorId++;
    String inputType = (String)dispatch(n.getNode(0));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.dstreamWrap(GNode.create("NodeVariable",
        wrapper), GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.dstream(GNode.create("NodeVariable", name)));
    this.register(wrapper);
    this.register(shutdown);
    return inputType;
  }

  public String visitRStream(final GNode n) {
    String name = "rstream" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String out = name + "_out";
    operatorId++;
    String inputType = (String)dispatch(n.getNode(0));
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.rstreamWrap(GNode.create("NodeVariable",
        wrapper), GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.rstream(GNode.create("NodeVariable", name)));
    this.register(wrapper);
    this.register(shutdown);
    return inputType;
  }

  public String visitNow(final GNode n) {
    String name = "now" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String out = name + "_out";
    operatorId++;
    String port0typeName = (String) dispatch(n.getNode(0));
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.nowWrap(GNode
        .create("NodeVariable", wrapper), GNode.create("NodeVariable", name)));
    unitImplementation.add(0, factory.now(GNode.create("LowerID", name), GNode
        .create("LowerID", port0buffer)));
    unitImplementation.add(0, factory.queueState(GNode.create("LowerID",
        port0buffer), GNode.create("LowerID", port0module), GNode.create(
        "LowerID", port0typeName)));
    this.register(wrapper);
    this.register(shutdown);
    return port0typeName;
  }

  private Node dotted(String variable, String module, String attribute) {
    return GNode.create("DottedExpression", GNode.create("DottedExpression",
        GNode.create("LowerID", variable), GNode.create("UpperID", module),
        null), GNode.create("LowerID", attribute), null);
  }

  public String visitRange(final GNode n) {
    String name = "range" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String out = name + "_out";
    boolean isDeclRoot = declRoots.containsKey(n);
    if (isDeclRoot) {
      out = declRoots.get(n);
    }
    operatorId++;
    String port0typeName = (String) dispatch(n.getNode(1));
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.rangeWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.range(GNode.create("LowerID", name), n
        .getNode(0), GNode.create("LowerID", port0buffer)));
    unitImplementation.add(0, factory.queueState(GNode.create("LowerID",
        port0buffer), GNode.create("LowerID", port0module), GNode.create(
        "LowerID", port0typeName)));
    this.register(wrapper);
    this.register(shutdown);
    if (!isDeclRoot) {
      addType(out);
      return port0typeName;
    }
    return out;
  }

  public String visitRows(final GNode n) {
    String name = "rows" + operatorId;
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String port0buffer = name + "_port0_buffer";
    String out = name + "_out";
    operatorId++;
    String port0typeName = (String) dispatch(n.getNode(1));
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.rowsWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.rows(GNode.create("LowerID", name), n
        .getNode(0), GNode.create("LowerID", port0buffer)));
    unitImplementation.add(0, factory.stateExpr(GNode.create("LowerID",
        port0buffer), GNode.create("LowerID", port0module), GNode.create(
        "LowerID", port0typeName)));
    this.register(wrapper);
    this.register(shutdown);
    return port0typeName;
  }

  public String visitPartition(final GNode n) {
    String name = "partition" + operatorId;
    String shutdown = name + "_shutdown";
    String wrapper = "ocaml_wrap_" + name;
    String port0buffer = name + "_port0_buffer";
    String out = name + "_out";
    operatorId++;
    String port0typeName = (String) dispatch(n.getNode(2));
    String port0module = Character.toUpperCase(port0typeName.charAt(0))
        + port0typeName.substring(1);
    String key = n.getString(0);
    table.enter("gammaB");
    Type inputRecordType = (Type) table.current().lookup(port0typeName);
    table.exit();
    Type xtcKeyType = inputRecordType.toStruct().lookup(key);
    if (xtcKeyType == ErrorT.TYPE) {
      System.err.println("Can't find key type");
      return null;
    }
    Node keyType = xtcToBoatType(xtcKeyType.toVariable().getType());
    GNode valType = GNode.create("ConstructedType", GNode.create("ValuePath",
        GNode.create("ModulePath", port0module), GNode.create("LowerID",
            port0typeName)), GNode.create("ValuePath", null, GNode.create(
        "LowerID", "list")));
    GNode expr = GNode.create("DottedExpression", GNode.create(
        "DottedExpression", GNode.create("LowerID", "item"), GNode.create(
            "UpperID", port0module), null), GNode.create("LowerID", n
        .getString(0)), null);
    unitImplementation.add(0, factory.shutdown(GNode.create("LowerID", shutdown)));
    unitImplementation.add(0, factory.partitionWrap(GNode.create("LowerID",
        wrapper), GNode.create("LowerID", name)));
    unitImplementation.add(0, factory.partition(GNode.create("LowerID", name), n
        .getNode(1), expr, GNode.create("LowerID", port0buffer)));
    unitImplementation.add(0, factory.hashExpr(GNode
        .create("LowerID", port0buffer), keyType, valType));
    this.register(wrapper);
    this.register(shutdown);
    return port0typeName;
  }

  /****************************************************************************/
  // A helper class for projection expressions which transforms
  // LowedIDs to field expressions.
  private class ProjectionExprNormalizer extends Visitor {
    private String module = null;

    public ProjectionExprNormalizer(String module) {
      this.module = module;
    }

    public Object visit(final GNode n) {
      for (int i = 0; i < n.size(); i++) {
        Object o = n.get(i);
        if (o instanceof Node) {
          Node child = (Node) dispatch((Node) o);
          n.set(i, child);
        }
      }
      return n;
    }

    public Object visitLowerID(final GNode n) {
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", "x"), GNode.create("UpperID", module), null),
          n, null);
    }
  }

  // A helper class for join condition expressions
  private class JoinExprNormalizer extends Visitor {
    private String port0module = null;
    private String port1module = null;
    private Type port0type = null;
    private Type port1type = null;

    public JoinExprNormalizer(String port0module, Type port0type,
        String port1module, Type port1type) {
      this.port0module = port0module;
      this.port1module = port1module;
      this.port0type = port0type;
      this.port1type = port1type;
    }

    public Object visit(final GNode n) {
      for (int i = 0; i < n.size(); i++) {
        Object o = n.get(i);
        if (o instanceof Node) {
          Node child = (Node) dispatch((Node) o);
          n.set(i, child);
        }
      }
      return n;
    }

    public Object visitLowerID(final GNode n) {
      String attribute = n.getString(0);
      String tupleName = null;
      String moduleName = null;
      if (ErrorT.TYPE != port0type.toStruct().lookup(attribute)) {
        tupleName = "tup4";
        moduleName = port0module;
      } else {
        tupleName = "tup5";
        moduleName = port1module;
      }
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", tupleName), GNode.create("UpperID",
              moduleName), null), GNode.create("ID", attribute), null);
    }

    public Object visitDottedExpression(final GNode n) {
      String module = n.getNode(0).getString(0);
      String attribute = n.getNode(1).getString(0);
      table.enter("gammaB");
      Type moduleType = (Type) table.current().lookup(module);
      table.exit();
      String tupleName = null;
      String moduleName = null;
      if (unify(moduleType, port1type)) {
        tupleName = "tup5";
        moduleName = port1module;
      } else {
        tupleName = "tup4";
        moduleName = port0module;
      }
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", tupleName), GNode.create("UpperID",
              moduleName), null), GNode.create("ID", attribute), null);
    }
  }

  // A helper class for select condition expressions
  private class SelectExprNormalizer extends Visitor {
    private String port0module = null;

    public SelectExprNormalizer(String port0module) {
      this.port0module = port0module;
    }

    public Object visit(final GNode n) {
      for (int i = 0; i < n.size(); i++) {
        Object o = n.get(i);
        if (o instanceof Node) {
          Node child = (Node) dispatch((Node) o);
          n.set(i, child);
        }
      }
      return n;
    }

    public Object visitLowerID(final GNode n) {
      String attribute = n.getString(0);
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", "x"), GNode.create("UpperID", port0module),
          null), GNode.create("ID", attribute), null);
    }

    public Object visitDottedExpression(final GNode n) {
      String attribute = n.getNode(1).getString(0);
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", "x"), GNode.create("UpperID", port0module),
          null), GNode.create("ID", attribute), null);
    }
  }

  /****************************************************************************/
  private Node xtcToBoatType(Type t) {
    if ((t.isInternal()) && ("string".equals(t.getName()))) {
      return GNode.create("StringType");
    }
    switch (t.tag()) {
    case BOOLEAN:
      return GNode.create("BooleanType");
    case INTEGER:
      return GNode.create("IntType");
    case FLOAT:
      return GNode.create("Float32");
    default:
      return GNode.create("UserDefinedType", t.getName());
    }
  }

  private void addType(String name) {
    table.enter("gammaB");
    Type type = (Type) table.current().lookup(name);
    if (type == null) {
      System.err.println("Can't find symbol " + name);
      return;
    }
    table.exit();
    GNode fieldDeclList = GNode.create("FieldDeclList");
    for (Type member : type.toStruct().getMembers()) {
      Node t = xtcToBoatType(member.toVariable().getType());
      fieldDeclList.add(GNode.create("FieldDecl", null, member.getName(), t));
    }
    String upperName = Character.toUpperCase(name.charAt(0))
        + name.substring(1);
    typeDecls.add(factory.typedef(GNode.create("ModName", upperName), GNode
                                  .create("LowerID", name), fieldDeclList));
    printType(name);
  }

  private void printType(String name) {
    table.enter("gammaB");
    Type type = (Type) table.current().lookup(name);
    if (type == null) {
      System.err.println("Can't find symbol " + name);
      return;
    }
    table.exit();
    String module = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    GNode args = GNode.create("ArgumentList");
    String stringConstant = "\"{";
    for (Type member : type.toStruct().getMembers()) {
      Node t = xtcToBoatType(member.toVariable().getType());
      String tName = member.toVariable().getName();
      String typeName = t.getName();
      if ("IntType".equals(typeName)) {
        stringConstant += tName + "=%d;";
      } else if ("StringType".equals(typeName)) {
        stringConstant += tName + "=%s;";
      } else if ("BooleanType".equals(typeName)) {
        stringConstant += tName + "=%B;";
      } else if ("Float32".equals(typeName)) {
        stringConstant += tName + "=%f;";
      }
      args.add(GNode.create("DottedExpression", GNode.create("LowerID", "x"),
          GNode.create("DottedExpression", GNode.create("LowerID", module),
              GNode.create("LowerID", tName))));
    }
    stringConstant += "}\"";
    args.add(0, GNode.create("StringConstant", stringConstant));
    typePrinters.add(factory.debugPrint(GNode.create("LowerID", "print_"
        + name + "_list"), GNode.create("UpperID", module), GNode.create(
        "UserDefinedType", name), factory.sinkPrint(args)));
  }

  private void makeSink(final GNode n) {
    String name = n.getString(0);
    String wrapper = "ocaml_wrap_" + name;
    String maybe = "maybe_" + name;
    String shutdown = name + "_shutdown";
    String file = "\"/tmp/" + name + "\"";
    String module = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    GNode args = GNode.create("ArgumentList");
    String stringConstant = "\"{";
    Node fieldTypeList = n.getNode(1).getNode(0).getNode(0);
    for (int i = 0; i < fieldTypeList.size(); i++) {
      Node fieldType = fieldTypeList.getNode(i);
      if ("IntType".equals(fieldType.getNode(1).getName())) {
        stringConstant += fieldType.getString(0) + "=%d;";
      } else if ("StringType".equals(fieldType.getNode(1).getName())) {
        stringConstant += fieldType.getString(0) + "=%s;";
      } else if ("BooleanType".equals(fieldType.getNode(1).getName())) {
        stringConstant += fieldType.getString(0) + "=%B;";
      } else if ("Float32".equals(fieldType.getNode(1).getName())) {
        stringConstant += fieldType.getString(0) + "=%f;";
      }
      args.add(GNode.create("DottedExpression", GNode.create("LowerID", "x"),
          GNode.create("DottedExpression", GNode.create("LowerID", module),
              GNode.create("LowerID", fieldType.getString(0)))));
    }
    addType(n.getString(0));
    stringConstant += "}\"";
    args.add(0, GNode.create("StringConstant", stringConstant));
    unitImplementation.add(factory.maybeSink(GNode.create("LowerID", maybe),
        GNode.create("StringConstant", "\"" + name + "\""), GNode.create(
            "StringConstant", file)));
    unitImplementation.add(factory.sink(GNode.create("LowerID", wrapper), GNode
        .create("LowerID", maybe)));
    ;
    unitImplementation.add(factory.sinkShutdown(GNode.create("LowerID",
        shutdown), GNode.create("LowerID", maybe)));
    ;
    m2hRoot.add(factory.typeList(GNode.create("LowerID", "print_"
        + n.getString(0) + "_list"), GNode.create("UpperID", module), GNode
        .create("UserDefinedType", n.getString(0)), factory.sinkSprint(args)));
    m2hRoot.add(factory.humanReadable(GNode.create("LowerID", "print_"
        + n.getString(0) + "_list")));
    this.register(wrapper);
    this.register(shutdown);
    this.registerException("End_of_file");
  }

  private void register(String wrapper) {
    Node expr = factory.callback(GNode.create("StringConstant", "\"" + wrapper
        + "\""), GNode.create("LowerID", wrapper));
    register(expr);
  }

  private void registerException(String wrapper) {
    Node expr = factory.callbackException(GNode.create("StringConstant", "\""
        + wrapper + "\""), GNode.create("LowerID", wrapper));
    register(expr);
  }

  private void register(Node expr) {
    if (registerLetBinding == null) {
      registerLetBinding = factory.register(null);
      registerLetBinding.getNode(0).getNode(1).getNode(0).set(1, expr);
      return;
    }
    Node oldExpr = registerLetBinding.getNode(0).getNode(1).getNode(0).getNode(
        1);
    Node newExpr = GNode.create("SemiExpression", oldExpr, expr);
    registerLetBinding.getNode(0).getNode(1).getNode(0).set(1, newExpr);
  }

  private void writeToFile(String outputDir) {
    File funcDir = new File(outputDir);
    if (!funcDir.mkdir()) {
      System.err.println("Function environment directory already exists.");
    }
    printFunctionEnv(unitImplementation, funcDir, "operators.ml");
    printFunctionEnv(m2hRoot, funcDir, "m2h.ml");
  }

  private void printFunctionEnv(Node operator, File funcDir, String fileName) {
    if ((operator == null) || (fileName == null)) {
      System.err.println("Null node passed to printFunctionImpl");
      return;
    }
    Printer out = null;
    try {
      out = new Printer(new PrintWriter(new File(funcDir, fileName)));
    } catch (IOException e) {
      System.err.println("Can't write to file: " + fileName);
      System.err.println(e);
      System.exit(0);
    }
    new xtc.lang.babble.boat.Printer(out).dispatch(operator);
    out.flush();
    out.close();
  }

  /**
   * Returns true if two types are the same, false otherwise.
   * 
   * @param t1
   *          The first type.
   * @param t2
   *          The second type.
   * @return True if the types are the same, false otherwise.
   */
  protected boolean unify(Type t1, Type t2) {
    if (t1 == null || t2 == null) {
      return false;
    } else if (t1.isStruct() && t2.isStruct()) {
      /* ensure that they are both streams or both relations */
      if (!t1.toStruct().getName().equals(t2.toStruct().getName())) {
        return false;
      }
      /* todo: if there are no members, this call will be null */
      /* need to check that case */
      if ((t1.toStruct().getMembers() == null)
          && (t2.toStruct().getMembers() == null)) {
        return true;
      } else if (((t1.toStruct().getMembers() == null) && (t2.toStruct()
          .getMembers() != null))
          || ((t1.toStruct().getMembers() != null) && (t2.toStruct()
              .getMembers() == null))) {
        return false;
      }
      /* check that they have the same number of fields */
      if (t1.toStruct().getMembers().size() != t2.toStruct().getMembers()
          .size()) {
        return false;
      }
      /* check that the fields are the same */
      final List<VariableT> t1Members = t1.toStruct().getMembers();
      final List<VariableT> t2Members = t2.toStruct().getMembers();
      int i = 0;
      for (Type lhs : t1Members) {
        Type rhs = t2Members.get(i);
        boolean unified = unify(lhs.toVariable().getType(), rhs.toVariable()
            .getType());
        if (!unified) {
          return false;
        }
        i++;
      }
      return true;
    } else if ((t1.isInternal() && t2.isInternal())
        && ("string".equals(t1.getName()) && "string".equals(t2.getName()))) {
      /* check if they are both string type */
      return true;
    } else {
      /* check that the basic types */
      switch (t1.tag()) {
      case BOOLEAN:
        return t2.isBoolean();
      case INTEGER:
        return t2.isInteger();
      case FLOAT:
        return t2.isFloat();
      default:
        return false;
      }
    }
  }
}
