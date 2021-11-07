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

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.FileReader;

import xtc.Constants;

import xtc.lang.babble.brooklet.BrookletPrinter;

import xtc.parser.ParseException;

import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.util.Tool;

/**
 * The driver for processesing StreamIt programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */
public class StreamIt extends Tool {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new StreamIt().run(args);
  }

  /** Create a new driver for StreamIt. */
  public StreamIt() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc StreamIt Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.word("output", "output", false,
        "Specify the name of the output file.").word("outputDir", "outputDir",
        false, "Specify the directory name of the operator.ml file.").word(
        "implFile", "implFile", false,
        "Specify the file where operators are implemented.").bool("printAST",
        "printAST", false, "Print the program's AST in generic form.").bool(
        "printSource", "printSource", false,
        "Print the program's AST in source form.").bool("toBrooklet",
        "toBrooklet", false, "Translate the program to Brooklet syntax.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    StreamItParser brookletParser = new StreamItParser(in, file.toString(),
        (int) file.length());
    return (Node) brookletParser.value(brookletParser.pStreamItProgram(0));
  }

  @Override
  public void process(Node node) {
    // Print AST.
    if (runtime.test("printAST")) {
      runtime.console().format(node).pln().flush();
    }
    // Print source.
    if (runtime.test("printSource")) {
      new StreamItPrinter(runtime.console()).dispatch(node);
      runtime.console().pln().flush();
    }
    // Translate source to Brooklet.
    if (runtime.test("toBrooklet")) {
      Node brookletRoot = new StreamItToBrooklet(runtime.console())
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
      String implFileName = (String) runtime.getValue("implFile");
      if (implFileName == null) {
        runtime
            .errConsole()
            .pln(
                "Must specify path to operator implementation with -implFile <file> flag.")
            .flush();
        runtime.exit();
      }
      /*
       * parse the operator implementation. Later this should be passed directly
       * as an AST
       */
      Tool boat = new xtc.lang.babble.boat.Boat();
      Node boatAST = null;
      try {
        File implFile = new File(implFileName);
        Reader implReader = new FileReader(implFile);
        boatAST = boat.parse(implReader, implFile);
      } catch (java.io.FileNotFoundException e) {
        runtime.errConsole().pln("Can't find boat file.").flush();
        runtime.exit();
      } catch (java.io.IOException y) {
        runtime.errConsole().pln("Can't read boat file.").flush();
        runtime.exit();
      } catch (xtc.parser.ParseException p) {
        runtime.errConsole().pln("Can't parse boat file.").flush();
        runtime.exit();
      }
      Node boatRoot = new StreamItToBoat(runtime.console()).translate(node,
          boatAST);
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
