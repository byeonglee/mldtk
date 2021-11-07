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
package xtc.lang.babble.jdl;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.6 $
 */
public class JDLPrinter extends Visitor {
  /** The printer. */
  protected final Printer printer;

  /**
   * Create a new printer for JDL file.
   * 
   * @param printer
   *          The printer.
   */
  public JDLPrinter(Printer printer) {
    this.printer = printer;
    printer.register(this);
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

  public void visitArguments(final GNode n) {
    printer.p("<arguments>");
    printer.p(n.getString(0));
    printer.pln("</arguments>");
  }

  public void visitExecutable(final GNode n) {
    printer
        .pln("<executable digest=\"tOJUdwDdYb1kTSGq5Uh7UDw5WM4\" executionmodel=\"dynamicload\" >");
    dispatch(n.getNode(0));
    dispatch(n.getNode(1));
    printer.pln("</executable>");
  }

  public void visitFile(final GNode n) {
    printer.pln("<?xml version=\"1.0\"?>");
    dispatch(n.getNode(0));
  }

  public void visitInput(final GNode n) {
    printer.pln("<input>");
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
    printer.pln("</input>");
  }

  public void visitInputEndpoint(final GNode n) {
    printer.p("<endpoint name=\"");
    printer.p(n.getString(0));
    printer.pln("\">");
    // dispatch to stream
    dispatch(n.getNode(1));
    printer.pln("</endpoint>");
  }

  public void visitInputPort(final GNode n) {
    printer.p("<port id=\"");
    printer.p("1");
    printer.p(":");
    printer.p(n.getString(0));
    printer.pln("\" scope=\"job\">");
    // dispatch to endpoint
    dispatch(n.getNode(1));
    printer.pln("<format>");
    printer.pln("<attribute type=\"ByteList\" name=\"data\"/>");
    printer.pln("</format>");
    printer.p("<flowspec><![CDATA[ANY ");
    // $streamname
    printer.p(n.getString(2));
    printer.pln("]]></flowspec>");
    printer.pln("</port>");
  }

  public void visitJob(final GNode n) {
    printer
        .pln("<job xmlns=\"http://www.ibm.com/xmlns/prod/streams/runtime/sam/jdl\" xmlns:trccfg=\"http://www.ibm.com/xmlns/prod/streams/runtime/sam/trccfg\" id=\"MapReduce\">");
    printer.pln("<body>");
    for (Node child : n.<Node> getList(0)) {
      dispatch(child);
    }
    printer.pln("</body>");
    printer.pln("</job>");
  }

  public void visitMain(final GNode n) {
    printer.p("<main>");
    printer.p(n.getString(0));
    printer.pln("</main>");
  }

  public void visitOutput(final GNode n) {
    printer.pln("<output>");
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
    printer.pln("</output>");
  }

  public void visitOutputEndpoint(final GNode n) {
    printer.p("<endpoint name=\"");
    printer.p(n.getString(0));
    printer.pln("\" />");
  }

  public void visitOutputEndpoints(final GNode n) {
    printer.pln("<endpoints>");
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
    printer.pln("</endpoints>");
  }

  public void visitOutputPort(final GNode n) {
    printer.p("<port id=\"");
    printer.p(n.getString(0));
    printer.pln("\" scope=\"job\" mode=\"byname\">");
    // dispatch to endpoint
    for (int i = 1; i < n.size() - 1; i++) {
      dispatch(n.getNode(i));
    }
    // dispatch to the stream
    dispatch(n.getNode(n.size() - 1));
    printer.pln("<format>");
    printer.pln("<attribute type=\"ByteList\" name=\"data\"/>");
    printer.pln("</format>");
    printer.pln("</port>");
  }

  public void visitOutputStream(final GNode n) {
    printer.p("<stream pid=\"");
    printer.p(n.getString(0));
    printer.pln("\" />");
  }

  public void visitPE(final GNode n) {
    printer.p("<pe id=\"");
    printer.p(n.getString(0)); /* The name of the pe */
    printer.pln("\" dedicate=\"false\"");
    printer.pln("colocationid=\"\" peSizeHint=\"medium\"");
    printer.pln("mobile=\"false\" restartable=\"false\"");
    printer.pln("haSectionId=\"-1\" haReplicaId=\"-1\"");
    printer.pln("executionWrapper=\"dummy\"");
    printer.p("executionWrapperParameters=\"");
    printer.p(n.getString(2));
    printer.pln(":1\">");
    printer.pln("<prolog>");
    printer.p("<description>");
    printer.p(n.getString(1));
    printer.pln("</description>");
    printer.pln("<constraints>");
    printer.p("<requirements><constraint name=\"hostname\" exactValue=\"");
    printer.p(n.getString(2));
    printer.pln("\"></constraint></requirements>");
    printer.pln("</constraints>");
    printer.p("<trace id=\"dummy\" level=");
    printer.p("\"" + n.getString(3) + "\"");
    printer.pln("/>");
    printer.pln("</prolog>");
    printer.pln("<credential>DUMMYx64</credential>");
    printer.pln("<body>");
    for (int i = 4; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
    printer.pln("</body>");
    printer.pln("</pe>");
  }

  public void visitStream(final GNode n) {
    printer.p("<stream name=\"");
    printer.p(n.getString(0));
    printer.pln("\" />");
  }
  // generic Input = InputPort+;
  // generic InputPort = Id InputEndpoint+ Id;
  // generic InputEndpoint = Id Stream+;
  // generic Stream = Id;
  // String Id = _+;
  // generic Output = OutputPort+;
  // generic OutputPort = Id OutputEndpoints Id;
  // generic OutputEndpoints = OutputEndpoint+;
  // generic OutputEndpoint = Id;
}
