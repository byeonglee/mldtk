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
package xtc.lang.babble.watson;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.26 $
 */
public class MakefilePrinter extends Visitor {
  /** The printer. */
  protected final Printer printer;

  /**
   * Create a new printer for JDL file.
   * 
   * @param printer
   *          The printer.
   */
  public MakefilePrinter(Printer printer) {
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

  public void visitFile(final GNode n) {
    printer.pln("ifeq ($(CXX),)");
    printer.pln("CXX=g++");
    printer.pln("endif");
    printer.pln("OCAML     = ocamlopt");
    printer.pln("OCAMLSRCS = operators.ml");
    printer.pln("OCAMLCMX  = $(OCAMLSRCS:.ml=.cmx)");
    printer.pln("OCAMLOBJS = $(OCAMLSRCS:.ml=-ext.o)");
    printer.pln("DPS_SCRIPTS := $(STREAMS_INSTALL)/bin/scripts");
    printer.pln("DPS_UDO_INCLUDE := .");
    printer.pln("PKGCONFIG = $(STREAMS_INSTALL)/bin/dst-pe-pkg-config.sh");
    printer.pln("PE_INCLUDE = ");
    printer.pln("PE_LIB =");
    printer.pln("PE_INCLUDE += `$(PKGCONFIG) --cflags dst-pe-install`");
    printer.pln("PE_LIB += `$(PKGCONFIG) --libs dst-pe-install`");
    printer.pln("EXTERNAL_LIB_UDO_INCLUDE := -I$(OCAML_HOME)");
    printer.pln("SPC_APPL_MAIN := $(STREAMS_INSTALL)/lib/agentmain.o");
    printer
        .pln("EXTERNAL_LIB_UDO_LIBS := -L$(OCAML_HOME) -Wl,-rpath -Wl,$(OCAML_HOME) -lunix -lasmrun -ldl -lm");
    printer
        .pln("CXXFLAGS = -ggdb -DSPADE_OPTIMIZATION -finline-functions -Wall -Werror -D_REENTRANT -fPIC -fmessage-length=0 -I.  $(EXTERNAL_LIB_UDO_INCLUDE) $(PE_INCLUDE)");
    printer.pln(".PHONY: distclean clean");
    printer.pln("all: bin pes tools");
    printer.pln("bin:");
    printer.pln("\t@mkdir -p ../bin");
    printer.pln("ifeq (\"$(STREAMS_INSTALL)\",\"\")");
    printer.pln("\t@echo \"Missing variable STREAMS_INSTALL\"");
    printer.pln("\t@exit 1");
    printer.pln("endif");
    printer.pln("ifeq (\"$(OCAML_HOME)\",\"\")");
    printer.pln("\t@echo \"Missing variable OCAML_HOME\"");
    printer.pln("\t@exit 1");
    printer.pln("endif");
    printer.pln("%.spe:");
    printer
        .pln("\t$(CXX) $(CXXFLAGS) -fPIC -o $@ $(SPC_APPL_MAIN) $^ $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)");
    printer.pln("%.dpe:");
    printer
        .pln("\t$(CXX) $(CXXFLAGS) -fPIC -shared -o $@ $^ $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)");
    printer.pln();
    printer.pln("# .ml -> .cmx");
    printer.pln("%.cmx: %.ml");
    printer.pln("\t$(OCAML) -c unix.cmxa $< -o $@");
    printer.pln("# .cmx -> -ext.o");
    printer.pln("%-ext.o: %.cmx");
    printer.pln("\t$(OCAML) -output-obj -o $@ unix.cmxa $<");
    printer.pln();
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
      printer.pln();
    }
    printer.pln();
    printer.pln("tools: ../bin/m2h");
    printer.pln();
    printer.pln("../bin/m2h : m2h.ml");
    printer.pln("\t$(OCAML) -o ../bin/m2h m2h.ml");
    printer.pln();
    printer.pln("clean:");
    printer.pln("\trm -f *.o");
    printer.pln("\trm -f *.cmx");
    printer.pln("\trm -f ../bin/*.dpe");
  }

  public void visitUDOPS(final GNode n) {
    printer.pln("### User-Defined Operators");
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
  }

  public void visitUDOP(final GNode n) {
    printer.p(n.getString(0) + ".o: ");
    printer.p(n.getString(0) + ".cpp ");
    printer.p("Submit.cpp ");
    printer.p("$(OCAMLOBJS) ");
    printer.pln("OP_Babble.h ");
  }

  public void visitBIOP(final GNode n) {
    printer.p(n.getString(0) + ".o: ");
    printer.p(n.getString(0) + ".cpp ");
    printer.p("Submit.cpp ");
    printer.p("$(OCAMLOBJS) ");
    printer.pln("OP_Babble.h ");
  }

  public void visitPES(final GNode n) {
    printer.pln("### Processing Elements");
    printer.p("pes: ");
    for (int i = 0; i < n.size(); i++) {
      printer.p("../bin/" + n.getNode(i).getString(0) + ".dpe ");
    }
    printer.pln();
    printer.pln();
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
      printer.pln();
    }
  }

  public void visitPEBIOP(final GNode n) {
    printer.p(n.getString(0) + ".o: ");
    printer.p(n.getString(0) + ".cpp ");
    printer.p(n.getString(1) + ".h ");
    printer.p("Submit.o ");
    printer.p("$(OCAMLOBJS) ");
    printer.pln("OP_Babble.h ");
    printer.p("../bin/" + n.getString(0) + ".dpe: ");
    printer.p(n.getString(0) + ".o ");
    printer.p("Submit.o ");
    printer.p("$(OCAMLOBJS) ");
    printer.p("OP_Babble.h ");
    printer.p(n.getString(1) + ".o ");
    printer.pln();
  }

  public void visitPEUDOP(final GNode n) {
    printer.p(n.getString(0) + ".o: ");
    printer.p(n.getString(0) + ".cpp ");
    printer.p("Submit.o ");
    printer.p("$(OCAMLOBJS) ");
    printer.pln("OP_Babble.h ");
    printer.p("../bin/" + n.getString(0) + ".dpe: ");
    printer.p(n.getString(0) + ".o ");
    printer.p("Submit.o ");
    printer.p("OP_Babble.h ");
    printer.p(n.getString(1) + ".o ");
    printer.p("$(OCAMLOBJS) ");
    printer.pln();
  }
}
