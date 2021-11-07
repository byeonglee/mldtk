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
public class StreamItToBoat extends Visitor {
  /** The printer. */
  protected final Printer printer;
  /** the input queue for the operator */
  private String queueIn = null;
  /** the output queue for the operator */
  private String queueOut = null;
  private int operatorId = 0;
  /** Factory to create the implementation of operators. */
  private OperatorFactory factory = null;
  /* The root of the operator implementation file */
  private GNode unitImplementation = null;
  /* The let binding for registering callbacks */
  private Node registerLetBinding = null;
  private List<Node> inputWrappers = null;
  private List<Node> outputWrappers = null;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public StreamItToBoat(Printer printer) {
    this.printer = printer;
    printer.register(this);
  }

  /**
   * Return the root of the translated AST.
   * 
   * @return The root node of the Brooklet AST.
   */
  public Node translate(Node root, Node impl) {
    operatorId = 0;
    factory = new OperatorFactory();
    unitImplementation = GNode.create("UnitImplementationList");
    unitImplementation.add(factory.declarePut());
    inputWrappers = new ArrayList<Node>();
    outputWrappers = new ArrayList<Node>();
    this.dispatch(root);
    unitImplementation.add(0, factory.openPrintf());
    for (Node n : outputWrappers) {
      unitImplementation.add(n);
    }
    Node implList = impl.getNode(0);
    for (int i = 0; i < implList.size(); i++) {
      unitImplementation.add(implList.get(i));
    }
    for (Node n : inputWrappers) {
      unitImplementation.add(n);
    }
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

  /** Visit the specified program node. */
  public void visitStreamItProgram(GNode n) {
    Util.reset();
    queueIn = Util.freshId();
    queueOut = Util.freshId();
    this.makeSource(queueIn);
    this.makeSink(queueOut);
    dispatch(n.getNode(0));
  }

  /** Visit the specified filter node. */
  public void visitFt(GNode n) {
    String name = n.getNode(1).getString(1) + operatorId;
    String inputWrapper = "ocaml_wrap_" + name;
    String outputWrapper = "ocaml_wrap_output_" + name;
    String shutdown = name + "_shutdown";
    operatorId++;
    System.out.println("wrap_" + name);
    inputWrappers.add(factory.inputWrap(GNode.create("LowerID", inputWrapper),
        GNode.create("LowerID", name)));
    outputWrappers.add(factory.outputWrap(GNode
        .create("LowerID", outputWrapper)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", shutdown)));
    register(inputWrapper);
    register(shutdown);
  }

  public void visitSj(GNode n) {
    Node split = n.getNode(0);
    int splitSize = n.getNode(1).size() - 1;
    makeSp(split, splitSize);
    dispatch(n.getNode(1));
    Node join = n.getNode(2);
    makeJn(join);
  }

  public void visitFl(GNode n) {
    Node join = n.getNode(0);
    makeJn(join);
    dispatch(n.getNode(1));
    dispatch(n.getNode(2));
    Node split = n.getNode(3);
    int splitSize = n.getNode(2).size();
    makeSp(split, splitSize);
  }

  /** Visit the specified join node. */
  public void makeJn(Node n) {
    if ("roundrobin".equals(n.getString(0))) {
      String name = "join" + n.getString(0) + operatorId;
      String inputWrapper = "ocaml_wrap_" + name;
      String shutdown = name + "_shutdown";
      operatorId++;
      System.out.println("wrap_" + name);
      inputWrappers.add(factory.joinroundrobinWrap(GNode.create("LowerID",
          inputWrapper)));
      unitImplementation.add(factory
          .shutdown(GNode.create("LowerID", shutdown)));
      register(inputWrapper);
      register(shutdown);
    }
  }

  /** Visit the specified split node. */
  public void makeSp(Node n, int num) {
    if ("duplicate".equals(n.getString(0))) {
      String name = "split" + n.getString(0) + operatorId;
      String inputWrapper = "ocaml_wrap_" + name;
      String shutdown = name + "_shutdown";
      operatorId++;
      System.out.println("wrap_" + name);
      inputWrappers.add(factory
          .splitduplicateWrap(GNode.create("LowerID", inputWrapper), GNode
              .create("IntegerConstant", Integer.toString(num))));
      unitImplementation.add(factory
          .shutdown(GNode.create("LowerID", shutdown)));
      register(inputWrapper);
      register(shutdown);
    }
  }

  /********************** Private Helper Functions *************************/
  private void register(String wrapper) {
    Node expr = factory.callback(GNode.create("StringConstant", "\"" + wrapper
        + "\""), GNode.create("LowerID", wrapper));
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

  private void makeSource(String name) {
    String wrapper = "ocaml_wrap_" + name;
    String maybe = "maybe_" + name;
    String file = "\"/tmp/" + name + ".data\"";
    String shutdown = name + "_shutdown";
    unitImplementation.add(factory.maybeSource(GNode.create("LowerID", maybe),
        GNode.create("StringConstant", "\"" + name + "\""), GNode.create(
            "StringConstant", file)));
    unitImplementation.add(factory.source(GNode.create("LowerID", wrapper),
        GNode.create("LowerID", maybe)));
    unitImplementation.add(factory.shutdown(GNode.create("LowerID", shutdown)));
    this.register(wrapper);
    this.register(shutdown);
    System.out.println("wrap_" + name);
  }

  private void makeSink(String name) {
    String wrapper = "ocaml_wrap_" + name;
    System.out.println("wrap_" + name);
    String shutdown = name + "_shutdown";
    String maybe = "maybe_" + name;
    String file = "\"/tmp/" + name + "\"";
    unitImplementation.add(factory.maybeSink(GNode.create("LowerID", maybe),
        GNode.create("StringConstant", "\"" + name + "\""), GNode.create(
            "StringConstant", file)));
    unitImplementation.add(factory.sink(GNode.create("LowerID", wrapper), GNode
        .create("LowerID", maybe)));
    ;
    unitImplementation.add(factory.sinkShutdown(GNode.create("LowerID",
        shutdown), GNode.create("LowerID", maybe)));
    ;
    this.register(wrapper);
    this.register(shutdown);
  }
}
