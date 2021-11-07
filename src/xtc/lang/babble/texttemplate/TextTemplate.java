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
package xtc.lang.babble.texttemplate;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import xtc.Constants;

import xtc.parser.ParseException;

import xtc.tree.Node;
import xtc.util.Tool;

/**
 * The driver for processesing TextTemplate programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class TextTemplate extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new TextTemplate().run(args);
  }

  /** Create a new driver for TextTemplate. */
  public TextTemplate() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc TextTemplate Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.bool("printAST", "printAST", false,
        "Print the program's AST in generic form.").bool("printSource",
        "printSource", false, "Print the program's AST in source form.").bool(
        "substitute", "substitute", false,
        "Print the program's AST in source form with substitutions.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    TextTemplateParser textParser = new TextTemplateParser(in, file.toString(),
        (int) file.length());
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
      new TextTemplatePrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    // Print source.
    if (runtime.test("substitute")) {
      Map<String, String> subs = new HashMap<String, String>();
      subs.put("$classname", "MyClass");
      new TextTemplateSubstituter(subs, runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
  }
}
