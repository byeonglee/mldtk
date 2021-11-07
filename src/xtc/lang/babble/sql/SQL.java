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
package xtc.lang.babble.sql;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import xtc.Constants;

import xtc.parser.ParseException;

import xtc.tree.Node;
import xtc.type.TypePrinter;
import xtc.tree.Visitor;

import xtc.util.SymbolTable;
import xtc.util.Tool;

/**
 * The driver for processesing SQL programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.10 $
 */
public class SQL extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new SQL().run(args);
  }

  /** Create a new driver for SQL. */
  public SQL() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc SQL Driver";
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
        "output", "output", false, "Specify the name of the output file.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    SQLParser textParser = new SQLParser(in, file.toString(), (int) file
        .length());
    return (Node) textParser.value(textParser.pSQLProgram(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new SQLPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    // Perform type checking.
    if (runtime.test("analyze")) {
      // Create symbol table.
      SymbolTable table = new SymbolTable();
      // Perform type checking.
      new SQLAnalyzer(runtime).analyze(node, table);
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
