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
package xtc.lang.babble.optimizer;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.FileReader;

import java.util.List;

import xtc.Constants;

import xtc.lang.babble.brooklet.BrookletParser;
import xtc.lang.babble.brooklet.BrookletPrinter;

import xtc.parser.ParseException;

import xtc.tree.Attribute;
import xtc.tree.Node;
import xtc.tree.Printer;

import xtc.util.Tool;

/**
 * The driver for processesing Optimizer programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.32 $
 */
public class Optimizer extends Tool {

  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new Optimizer().run(args);
  }

  /** Create a new driver for Optimizer. */
  public Optimizer() {
    // Nothing to do.
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public String getName() {
    return "xtc Optimizer Driver";
  }

  @Override
  public void init() {
    super.init();
    runtime.
      file("implFile", "implFile", false, "Specify the name of the implementation file.").
      file("output", "output", false, "Specify the name of the output file.").
      file("spec", "spec", false, "Specify the optimizations and ordering.");
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    BrookletParser brookletParser = new BrookletParser(in, file.toString(),
        (int) file.length());
    return (Node) brookletParser.value(brookletParser.pProgram(0));
  }

  @Override
  public void process(Node brookletAST) {
    Node boatAST = parseBoatProgram();
    File spec = (File) runtime.getValue("spec");
    try {
      OptimizerLanguage optLang =  new OptimizerLanguage(new FileReader(spec), spec.toString());
      Node specAST = (Node) optLang.value(optLang.pProgram(0));
      List<Optimization> schedule = new Scheduler().schedule(specAST);
      Optimization.Result result = null;
      for (Optimization opt : schedule) {
        result = opt.optimize(runtime, brookletAST, boatAST);
        brookletAST = result.getBrookletAST();
        boatAST = result.getBoatAST();
      }
      this.printRiverProgram(result.getBrookletAST(), result.getBoatAST());      
    } catch(Exception e) {
      System.err.println(e);
      e.printStackTrace();
      runtime.exit();        
    }
  }

  private Node parseBoatProgram() {
    File implFile = (File) runtime.getValue("implFile");
    if (implFile == null) {
      runtime
          .errConsole()
          .pln(
              "Must specify path to operator implementation with -implFile <file> flag.")
          .flush();
      runtime.exit();
    }
    try {
      Reader implReader = new FileReader(implFile);
      return new xtc.lang.babble.boat.Boat().parse(implReader, implFile);
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
    return null;
  }

  private void printRiverProgram(Node brookletAST, Node boatAST) {
    File file = (File) runtime.getValue("output");
    if (file == null) {
      new BrookletPrinter(runtime.console()).dispatch(brookletAST);
      runtime.console().pln().flush();
    } else {
      Printer out = null;
      try {
        out = new Printer(new PrintWriter(new BufferedWriter(new FileWriter(file))));
        new BrookletPrinter(out).dispatch(brookletAST);
        out.flush();
        out.close();        
      } catch (IOException e) {
        System.err.println(e);
        System.exit(0);
      }
    }
    Printer boatOut = null;
    try {
      boatOut = new Printer(new PrintWriter(new File("fast-operator.ml")));
      new xtc.lang.babble.boat.Printer(boatOut).dispatch(boatAST);
      boatOut.flush();
      boatOut.close();      
    } catch (IOException e) {
      System.err.println(e);
      System.exit(0);
    }
  }

}
