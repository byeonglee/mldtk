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

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import xtc.Constants;

import xtc.parser.ParseException;

import xtc.tree.Node;
import xtc.util.Tool;

/**
 * The driver for processesing JDL programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class JDL extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new JDL().run(args);
  }

  /** Create a new driver for JDL. */
  public JDL() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc JDL Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.bool("printAST", "printAST", false,
        "Print the program's AST in generic form.").bool("printSource",
        "printSource", false, "Print the program's AST in source form.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    JDLParser textParser = new JDLParser(in, file.toString(), (int) file
        .length());
    return (Node) textParser.value(textParser.pFile(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new JDLPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
  }
}
