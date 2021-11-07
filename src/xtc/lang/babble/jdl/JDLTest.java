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

import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.util.Runtime;
import xtc.util.Pair;

/**
 * The driver for processesing JDL programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.4 $
 */
public class JDLTest {
  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    Runtime runtime = new Runtime();
    Node main1 = GNode.create("Main", "klajsdl");
    Node main2 = GNode.create("Main", "aklsjdl");
    Node arg1 = GNode.create("Arguments", "klajsdl");
    Node arg2 = GNode.create("Arguments", "aklsjdl");
    Node executable1 = GNode.create("Executable", main1, arg1);
    Node input1 = GNode.create("Input");
    Node executable2 = GNode.create("Executable", main2, arg2);
    Node input2 = GNode.create("Input");
    Node output2 = GNode.create("Output");
    Node pe1 = GNode.create("PE", "pe1", executable1, input1);
    Node pe2 = GNode.create("PE", "pe2", executable2, input2, output2);
    Pair<Node> pes = new Pair<Node>(pe1);
    pes.add(pe2);
    Node job = GNode.create("Job", pes);
    Node node = GNode.create("File", job);
    new JDLPrinter(runtime.console()).dispatch(node);
    runtime.console().pln().flush();
  }
}
