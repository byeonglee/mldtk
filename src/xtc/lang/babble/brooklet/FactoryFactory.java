/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2010 New York University
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
package xtc.lang.babble.brooklet;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import xtc.parser.ParseException;
import xtc.tree.Node;

/**
 * The driver for processesing the Brooklet language.
 * 
 * @author Robert Soule
 * @version $Revision: 1.3 $
 */
public class FactoryFactory extends xtc.lang.FactoryFactory {
  /** Create a new driver for Brooklet. */
  public FactoryFactory() {
    // Nothing to do.
  }

  @Override
  public Node parse(Reader in, File file) throws IOException, ParseException {
    FactoryParser parser = new xtc.lang.babble.brooklet.FactoryParser(in, file
        .toString(), (int) file.length());
    return (Node) parser.value(parser.pFactory(0));
  }

  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new xtc.lang.babble.brooklet.FactoryFactory().run(args);
  }
}
