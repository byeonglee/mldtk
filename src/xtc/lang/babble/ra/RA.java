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
package xtc.lang.babble.ra;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import xtc.Constants;

import xtc.parser.ParseException;

import java.util.Map;

import xtc.tree.Node;
import xtc.type.TypePrinter;
import xtc.tree.Visitor;

import xtc.util.SymbolTable;
import xtc.util.Tool;

/**
 * The driver for processesing RA programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */
public class RA extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new RA().run(args);
  }

  /** Create a new driver for RA. */
  public RA() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc RA Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.bool("analyze", "analyze", false,
        "Perform type analysis on the AST.").bool("printAST", "printAST",
        false, "Print the program's AST in generic form.").bool("printSource",
        "printSource", false, "Print the program's AST in source form.").bool(
        "printSymbolTable", "printSymbolTable", false,
        "Print the program's symbol table.");
    ;
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    RAParser raParser = new RAParser(in, file.toString(), (int) file.length());
    return (Node) raParser.value(raParser.pRAProgram(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new RAPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    // Perform type checking.
    if (runtime.test("analyze")) {
      /* Find the sources, sinks, and split locations */
      RASourceSinkSplitFinder analyzer = new RASourceSinkSplitFinder();
      analyzer.analyze(node);
      Map<String, Integer> splits = analyzer.getSplits();
      // Create symbol table.
      SymbolTable table = new SymbolTable();
      // Perform type checking.
      new xtc.lang.babble.ra.RAAnalyzer(runtime).analyze(node, table, splits);
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
  }
}
