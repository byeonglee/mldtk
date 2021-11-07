/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2007 Robert Grimm
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
package xtc.oop;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import xtc.lang.JavaFiveParser;

import xtc.parser.ParseException;
import xtc.parser.Result;

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Visitor;

import xtc.util.Tool;

/**
 * A translator from (a subset of) Java to (a subset of) C++.
 *
 * @author Robert Grimm
 * @version $Revision: 1.2 $
 */
public class Translator extends Tool {

  /** Create a new translator. */
  public Translator() {
    // Nothing to do.
  }

  public String getCopy() {
    return "(C) 2007 <Group Name>";
  }

  public String getName() {
    return "Java to C++ Translator";
  }

  public String getExplanation() {
    return "This tool translates a subset of Java to a subset of C++.";
  }

  public void init() {
    super.init();

    runtime.
      bool("count", "optionCount", false,
           "Count all methods.").
      bool("printJavaAST", "printJavaAST", false,
           "Print the read-in Java AST.");

    // Declare command line arguments.
  }

  public void prepare() {
    super.prepare();

    // Perform consistency checks on command line arguments.
  }

  public File locate(String name) throws IOException {
    File file = super.locate(name);
    if (Integer.MAX_VALUE < file.length()) {
      throw new IllegalArgumentException(file + ": file too large");
    }
    return file;
  }

  public Node parse(Reader in, File file) throws IOException, ParseException {
    JavaFiveParser parser =
      new JavaFiveParser(in, file.toString(), (int)file.length());
    Result     result = parser.pCompilationUnit(0);
    return (Node)parser.value(result);
  }

  public void process(Node node) {


    if (runtime.test("printJavaAST")) {
      runtime.console().format(node).pln().flush();

    }

    if (runtime.test("optionCount")) {
      new Visitor() {
        int count = 0;
        int totalCount = 0;

        public void visitCompilationUnit(GNode n) {
          for (Object o : n) if (o instanceof Node) dispatch((Node)o);

          
          runtime.console().p("Total method count : ").p(totalCount).pln().
            flush();
        }

        public void visitClassDeclaration(GNode n) {
          int savedCount = count;
          count = 0;

          for (Object o : n) if (o instanceof Node) dispatch((Node)o);

          runtime.console().p("Class ").p(n.getString(1)).p(" has ").p(count).
            pln(" methods.");
          totalCount += count;
          count = savedCount;
        }

        public void visitMethodDeclaration(GNode n) {
          count++;
          for (Object o : n) if (o instanceof Node) dispatch((Node)o);
        }

        public void visit(Node n) {
          for (Object o : n) if (o instanceof Node) dispatch((Node)o);
        }

      }.dispatch(node);
    }

  }

  /**
   * Run the translator with the specified command line arguments.
   *
   * @param args The command line arguments.
   */
  public static void main(String[] args) {
    new Translator().run(args);
  }

}
