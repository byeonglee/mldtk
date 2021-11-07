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

import java.util.Map;
import java.util.HashMap;
import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

import xtc.type.Type;
import xtc.util.SymbolTable;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.26 $
 */
public class SawzallToBoat extends Visitor {
  /** The printer. */
  protected final Printer printer;
  /** An id number to distinguish operator instances **/
  private int operatorId = 0;
  /* The root of the operator implementation file */
  private GNode unitImplementation = null;
  private GNode constrDeclList = null;
  private GNode patternMatchList = null;
  private GNode patternMatchListSplit = null;
  /* The let binding for registering callbacks */
  private Node registerLetBinding = null;
  private Node reducerPrinter = null;
  /** Factory to create the implementation of operators. */
  private OperatorFactory factory = null;
  /* The populated symbol table */
  private SymbolTable table = null;
  private Node mapExpression = null;
  private Map<String, String> reducerFuncs = null;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   * @param r
   *          The number of reducers.
   */
  public SawzallToBoat(Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Return the root of the translated AST.
   * 
   * @return The root node of the Brooklet AST.
   */
  public Node translate(Node root, SymbolTable table) {
    this.table = table;
    reducerFuncs = new HashMap<String, String>();
    factory = new OperatorFactory();
    unitImplementation = GNode.create("UnitImplementationList");
    constrDeclList = GNode.create("ConstrDeclList");
    patternMatchList = GNode.create("PatternMatchList");
    patternMatchListSplit = GNode.create("PatternMatchList");
    unitImplementation.add(factory.parallelism());
    unitImplementation.add(0, factory.outputWrap());
    unitImplementation.add(0, factory.declarePut());
    unitImplementation.add(factory.reducerTypes(constrDeclList));
    dispatch(root);
    unitImplementation.add(0, factory.openPrintf());
    unitImplementation.add(registerLetBinding);
    return unitImplementation;
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
    // visit the outputs
    dispatch(n.getNode(0));
    // visit the input
    dispatch(n.getNode(1));
    // visit the emits
    dispatch(n.getNode(2));
    makeReducer();
    makeMapper(n);
  }

  public void visitOut(GNode n) {
    reducerFuncs.put(n.getString(0), n.getString(1));
  }

  public void visitEmit(GNode n) {
    String reducerName = n.getString(0);
    String tableName = reducerName + "_table";
    String constrName = Character.toUpperCase(reducerName.charAt(0))
        + reducerName.substring(1);
    table.enter("gammaB");
    Type reducerType = (Type) table.current().lookup(reducerName);
    if (reducerType == null) {
      System.err.println("Can't find symbol " + reducerName);
      return;
    }
    table.exit();
    Type keyType = reducerType.toStruct().getMember(0).toVariable().getType();
    Type valueType = reducerType.toStruct().getMember(1).toVariable().getType();
    Node boatKeyType = xtcToBoatType(keyType);
    Node boatValueType = xtcToBoatType(valueType);
    Node tupleType = GNode.create("TupleType", boatKeyType, boatValueType);
    constrDeclList.add(GNode.create("ConstrDecl", constrName, tupleType));
    printTable(tableName, reducerName, reducerType);
    String printerName = "print_" + reducerName + "_table";
    String reducer = reducerFuncs.get(reducerName);
    Node stateValueType = null;
    if ("avg".equals(reducer)) {
      stateValueType = GNode.create("TupleType", boatValueType, GNode
          .create("IntType"));
    } else {
      stateValueType = boatValueType;
    }
    unitImplementation.add(factory.hashExpr(GNode.create("LowerID", tableName),
        boatKeyType, stateValueType));
    Node argumentList = GNode.create("ArgumentList");
    argumentList.add(GNode.create("Argument", GNode.create("PrefixExpression",
        GNode.create("PrefixOp", "!"), GNode.create("LowerID", tableName))));
    argumentList.add(GNode.create("Argument", GNode.create("LowerID", "oc")));
    Node printExpression = GNode.create("ApplicationExpression");
    printExpression.add(GNode.create("LowerID", printerName));
    printExpression.add(argumentList);
    this.addReducerPrinter(printExpression);
    Node pattern = this.makeConstrPattern(constrName);
    Node matchExpr = null;
    if ("sum".equals(reducer)) {
      matchExpr = factory.reduceSum((Node) GNode.create("LowerID", tableName));
    } else if ("avg".equals(reducer)) {
      matchExpr = factory.reduceAvg((Node) GNode.create("LowerID", tableName));
    } else if ("count".equals(reducer)) {
      matchExpr = factory
          .reduceCount((Node) GNode.create("LowerID", tableName));
    } else {
      System.err.println("Reducer not recognized " + reducer);
      return;
    }
    GNode patternMatch = GNode.create("PatternMatch", pattern, null, matchExpr);
    patternMatchList.add(patternMatch);
    GNode patternMatchSplit = GNode.create("PatternMatch", pattern, null,
        factory.splitExpr());
    patternMatchListSplit.add(patternMatchSplit);
    Node expr = factory.emit(
        (Node) new ExprNormalizer().dispatch(n.getNode(1)),
        (Node) new ExprNormalizer().dispatch(n.getNode(2)), GNode.create(
            "UpperID", constrName));
    if (mapExpression == null) {
      mapExpression = expr;
      return;
    } else {
      mapExpression = GNode.create("SemiExpression", mapExpression, expr);
    }
  }

  public void visitIn(final GNode n) {
    String name = n.getString(0);
    String wrapper = "ocaml_wrap_" + name;
    String maybe = "maybe_" + name;
    String file = "\"/tmp/" + name + ".data\"";
    String shutdown = name + "_shutdown";
    String module = Character.toUpperCase(name.charAt(0)) + name.substring(1);
    unitImplementation.add(factory.maybeSource(GNode.create("LowerID", maybe),
        GNode.create("StringConstant", "\"" + name + "\""), GNode.create(
            "StringConstant", file)));
    unitImplementation.add(factory.source(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", maybe), GNode.create("LowerID", module), GNode
            .create("LowerID", name)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", shutdown)));
    this.register(wrapper);
    this.register(shutdown);
    addType(unitImplementation, name);
  }

  /****************************************************************************/
  private void makeMapper(GNode n) {
    String name = "map0";
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    operatorId++;
    unitImplementation.add(factory.map(GNode.create("LowerID", name),
        mapExpression));
    unitImplementation.add(factory.mapWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", shutdown)));
    this.register(wrapper);
    this.register(shutdown);
  }

  private void makeReducer() {
    String name = "reduce1";
    String wrapper = "ocaml_wrap_" + name;
    String shutdown = name + "_shutdown";
    String file = "\"/tmp/" + name + "-%d.data\"";
    operatorId++;
    GNode patternMatching = GNode.create("PatternMatching", "|",
        patternMatchList);
    GNode match = GNode.create("MatchExpression", GNode.create("LowerID",
        "data"), patternMatching);
    unitImplementation
        .add(factory.reduce(GNode.create("LowerID", name), match));
    unitImplementation.add(factory.reduceWrap(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", name)));
    unitImplementation.add(factory.shutdownReducer(GNode.create("LowerID",
        shutdown), GNode.create("StringConstant", file), reducerPrinter));
    /* make the splitter */
    String splitName = "hashsplit_" + name;
    String splitWrapper = "ocaml_wrap_" + splitName;
    String splitShutdown = splitName + "_shutdown";
    GNode patternMatchingSplit = GNode.create("PatternMatching", "|",
        patternMatchListSplit);
    GNode matchSplit = GNode.create("MatchExpression", GNode.create("LowerID",
        "data"), patternMatchingSplit);
    unitImplementation.add(factory.hashSplit(
        GNode.create("LowerID", splitName), matchSplit));
    unitImplementation.add(factory.splitWrap(GNode.create("LowerID",
        splitWrapper), GNode.create("LowerID", splitName)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", splitShutdown)));
    String mergeName = "simplemerge_" + name;
    String mergeWrapper = "ocaml_wrap_" + mergeName;
    String mergeShutdown = mergeName + "_shutdown";
    unitImplementation.add(factory.merge(GNode.create("LowerID",
        mergeName)));
    unitImplementation.add(factory.mergeWrap(GNode.create("LowerID", mergeWrapper),
        GNode.create("LowerID", mergeName)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", mergeShutdown)));
    this.register(splitWrapper);
    this.register(mergeWrapper);
    this.register(wrapper);
    this.register(shutdown);
    this.register(mergeShutdown);
    this.register(splitShutdown);
  }

  private void register(String wrapper) {
    Node expr = factory.callback(GNode.create("StringConstant", "\"" + wrapper
        + "\""), GNode.create("LowerID", wrapper));
    register(expr);
  }

  private void addReducerPrinter(Node expr) {
    if (reducerPrinter == null) {
      reducerPrinter = expr;
      return;
    }
    reducerPrinter = GNode.create("SemiExpression", reducerPrinter, expr);
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

  private void addType(Node root, String name) {
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
    root.add(0, factory.typedef(GNode.create("ModName", upperName), GNode
        .create("LowerID", name), fieldDeclList));
    printType(root, name);
  }

  private void printTable(String tableName, String reducerName, Type reducerType) {
    String reducer = reducerFuncs.get(reducerName);
    Type keyType = reducerType.toStruct().getMember(0).toVariable().getType();
    Type valueType = reducerType.toStruct().getMember(1).toVariable().getType();
    Node boatKeyType = xtcToBoatType(keyType);
    Node boatValueType = xtcToBoatType(valueType);
    GNode args = GNode.create("ArgumentList");
    String stringConstant = "\"{";
    args.add(GNode.create("LowerID", "k"));
    args.add(GNode.create("LowerID", "v"));
    if ("avg".equals(reducer)) {
      args.add(GNode.create("LowerID", "v1"));
    }
    stringConstant += boatTypeToString(boatKeyType);
    stringConstant += " -> ";
    stringConstant += boatTypeToString(boatValueType);
    if ("avg".equals(reducer)) {
      stringConstant += " %d";
    }
    stringConstant += "}\"";
    Node values = null;
    if ("avg".equals(reducer)) {
      values = GNode.create("CommaExpression", GNode.create("LowerID", "v"),
          GNode.create("LowerID", "v1"));
    } else {
      values = GNode.create("LowerID", "v");
    }
    args.add(0, GNode.create("StringConstant", stringConstant));
    unitImplementation.add(factory.tablePrint(GNode.create("LowerID", "print_"
        + tableName), GNode.create("LowerID", "k"), values, factory
        .fprintf(args)));
  }

  private String boatTypeToString(Node t) {
    String typeName = t.getName();
    if ("IntType".equals(typeName)) {
      return "%d";
    } else if ("StringType".equals(typeName)) {
      return "%s";
    } else if ("BooleanType".equals(typeName)) {
      return "%B";
    } else if ("Float32".equals(typeName)) {
      return "%f";
    }
    return "";
  }

  private void printType(Node n, String name) {
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
    unitImplementation.add(factory.debugPrint(GNode.create("LowerID", "print_"
        + name), factory.printf(args)));
  }

  private Node makeConstrPattern(String name) {
    Node commaPattern = GNode.create("CommaPattern", GNode.create("Variable",
        GNode.create("LowerID", "key")), GNode.create("Variable", GNode.create(
        "LowerID", "value")));
    Node parenthesisedPattern = GNode.create("ParenthesisedPattern",
        commaPattern, null);
    return GNode.create("ConstructorPattern", GNode.create("Constr", name),
        parenthesisedPattern);
  }

  private class ExprNormalizer extends Visitor {
    public ExprNormalizer() { /* do nothing */
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

    public Object visitDottedExpression(final GNode n) {
      String type = n.getNode(0).getString(0);
      String moduleName = Character.toUpperCase(type.charAt(0))
          + type.substring(1);
      String attribute = n.getNode(1).getString(0);
      String tupleName = "tup";
      return GNode.create("DottedExpression", GNode.create("DottedExpression",
          GNode.create("LowerID", tupleName), GNode.create("UpperID",
              moduleName), null), GNode.create("ID", attribute), null);
    }
  }
}
