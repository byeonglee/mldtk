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

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.PrintWriter;
import java.io.FileWriter;

import java.util.Map;
import java.util.Set;

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
 * The driver for processesing SRA programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.20 $
 */
public class SRA extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new SRA().run(args);
  }

  /** Create a new driver for SRA. */
  public SRA() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc SRA Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.bool("analyze", "analyze", false,
        "Print the program's AST in generic form.").bool("printAST",
        "printAST", false, "Print the program's AST in generic form.").bool(
        "printSource", "printSource", false,
        "Print the program's AST in source form.").bool("printSymbolTable",
        "printSymbolTable", false, "Print the program's symbol table.").word(
        "output", "output", false, "Specify the name of the output file.")
        .word("outputDir", "outputDir", false,
            "Specify the directory name of the operator.ml file.").bool(
            "toBrooklet", "toBrooklet", false,
            "Translate the program to Brooklet syntax.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    SRAParser sraParser = new SRAParser(in, file.toString(), (int) file
        .length());
    return (Node) sraParser.value(sraParser.pSRAProgram(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new SRAPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    SymbolTable table = null;
    Set<String> sources = null;
    Set<String> sinks = null;
    Map<String, Integer> splits = null;
    // Perform type checking.
    if (runtime.test("analyze")) {
      /* Find the sources, sinks, and split locations */
      SRASourceSinkSplitFinder analyzer = new SRASourceSinkSplitFinder();
      analyzer.analyze(node);
      sources = analyzer.getSources();
      sinks = analyzer.getSinks();
      splits = analyzer.getSplits();
      new SRASplitRenamer().rename(node, splits);
      // Create symbol table.
      table = new SymbolTable();
      // Perform type checking.
      new xtc.lang.babble.sra.SRAAnalyzer(runtime).analyze(node, table, splits);
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
        System.out
            .println("Must run option -analyze to translate to Brooklet.");
        return;
      }
      Node brookletRoot = new SRAToBrooklet(runtime.console()).translate(node,
          sources, sinks, splits);
      SRAToBoat functionTranslator = new SRAToBoat(table);
      String outDirName = (String) runtime.getValue("outputDir");
      if (outDirName == null) {
        outDirName = "FunctionEnv";
      }
      functionTranslator.translate(node, outDirName, sources, sinks, splits);
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
    }
  }
}
