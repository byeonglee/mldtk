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

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.PrintWriter;
import java.io.FileWriter;

import xtc.Constants;

import xtc.lang.babble.brooklet.BrookletPrinter;

import xtc.parser.ParseException;

import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.type.TypePrinter;
import xtc.tree.Visitor;

import xtc.util.SymbolTable;
import xtc.util.Tool;

/**
 * The driver for processesing Sawzall programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.13 $
 */
public class Sawzall extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new Sawzall().run(args);
  }

  /** Create a new driver for Sawzall. */
  public Sawzall() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc Sawzall Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.bool("analyze", "analyze", false,
        "Perform type analysis on the AST.").word("outputDir", "outputDir",
        false, "Specify the directory name of the operator.ml file.").bool(
        "printAST", "printAST", false,
        "Print the program's AST in generic form.").bool("printSource",
        "printSource", false, "Print the program's AST in source form.").word(
        "output", "output", false, "Specify the name of the output file.")
        .bool("toBrooklet", "toBrooklet", false,
            "Translate the program to Brooklet syntax.").bool(
            "printSymbolTable", "printSymbolTable", false,
            "Print the program's symbol table.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    SawzallParser sawzallParser = new SawzallParser(in, file.toString(),
        (int) file.length());
    return (Node) sawzallParser.value(sawzallParser.pSawzallProgram(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new SawzallPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    SymbolTable table = null;
    // Perform type checking.
    if (runtime.test("analyze")) {
      // Create symbol table.
      table = new SymbolTable();
      // Perform type checking.
      new xtc.lang.babble.sawzall.SawzallAnalyzer(runtime).analyze(node, table);
      // Print the symbol table.
      if (runtime.test("printSymbolTable")) {
        System.out.println("Printing the symbol table...");
        // Save the registered visitor.
        Visitor visitor = runtime.console().visitor();
        // Note that the type printer's constructor registers the just
        // created printer with the console.
        new TypePrinter(runtime.console());
        try {
          table.root().dump(runtime.console());
        } finally {
          // Restore the previously registered visitor.
          runtime.console().register(visitor);
        }
        runtime.console().flush();
      }
    }
    // Translate source to Brooklet.
    if (runtime.test("toBrooklet")) {
      if (!runtime.test("analyze")) {
        System.err
            .println("Must run option -analyze to translate to Brooklet.");
        return;
      }
      Node brookletRoot = new SawzallToBrooklet(runtime.console())
          .translate(node);
      String outFileName = (String) runtime.getValue("output");
      if (outFileName == null) {
        new BrookletPrinter(runtime.console()).dispatch(brookletRoot);
        runtime.console().pln().flush();
      } else {
        File file = new File(outFileName);
        Printer out = null;
        try {
          out = new Printer(new PrintWriter(new BufferedWriter(new FileWriter(
              file))));
        } catch (IOException x) {
          return;
        }
        new BrookletPrinter(out).dispatch(brookletRoot);
        out.flush();
        out.close();
      }
      Node boatRoot = new SawzallToBoat(runtime.console()).translate(node,
          table);
      String outDirName = (String) runtime.getValue("outputDir");
      if (outDirName == null) {
        outDirName = "FunctionEnv";
      }
      File funcDir = new File(outDirName);
      if (!funcDir.mkdir()) {
        System.err.println("Function environment directory already exists.");
      }
      Printer boatOut = null;
      String boatFileName = "operators.ml";
      try {
        boatOut = new Printer(new PrintWriter(new File(funcDir, boatFileName)));
      } catch (IOException e) {
        System.err.println("Can't write to file: " + boatFileName);
        System.err.println(e);
        System.exit(0);
      }
      new xtc.lang.babble.boat.Printer(boatOut).dispatch(boatRoot);
      boatOut.flush();
      boatOut.close();
    }
  }
}
