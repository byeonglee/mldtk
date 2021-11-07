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

import xtc.tree.Node;

import xtc.util.Runtime;

/**
 * An interface for all River optimizations.
 * 
 * @author Robert Soule
 * @version $Revision: 1.2 $
 */
public interface Optimization {

  public class Result {
    private final boolean modified;
    private final Node brookletAST;
    private final Node boatAST;
    public Result(boolean modified, Node brookletAST, Node boatAST) {
      this.modified = modified;
      this.brookletAST = brookletAST;
      this.boatAST = boatAST;
    }
    public boolean getModified() { return modified; } 
    public Node getBrookletAST() { return brookletAST; }
    public Node getBoatAST() { return boatAST; }
  }

  public Result optimize(final Runtime runtime, final Node brookletAST, final Node boatAST);
 
}
