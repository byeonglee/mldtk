/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
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

/**
 * A primary identifier.
 *
 * @author Robert Grimm
 */
public class PrimaryIdentifier extends Expression {

  /** The name. */
  private String name;

  /**
   * Create a new primary identifier.
   *
   * @param name The name.
   */
  public PrimaryIdentifier(String name) {
    this.name = name;
  }

  /**
   * Get the name.
   *
   * @return The name.
   */
  public String getName() {
    return name;
  }

  public <T, E extends Exception> T accept(Visitor<T,E> v) throws E {
    return v.visit(this);
  }

}
