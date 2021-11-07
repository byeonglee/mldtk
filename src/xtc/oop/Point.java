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

/**
 * A four-dimensional point.
 *
 * @author Robert Grimm.
 */
public class Point {

  /** The origin. */
  public static final Point ORIGIN = new Point(0, 0, 0, 0);

  /** The coordinates. */
  private final double c1, c2, c3, c4;

  /**
   * Create a new point.
   *
   * @param c1 The first coordinate.
   * @param c2 The second coordinate.
   * @param c3 The third coordinate.
   * @param c4 The fourth coordinate.
   */
  public Point(double c1, double c2, double c3, double c4) {
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    this.c4 = c4;
  }

  /**
   * Get the coordinate at the specified index.  The first coordinate
   * is at index 0.
   *
   * @param i The index.
   * @return The coordinate.
   * @throws IndexOutOfBoundsException Signals that the index is
   * invalid.
   */
  public double get(int i) {
    switch (i) {
    case 0:
      return c1;
    case 1:
      return c2;
    case 2:
      return c3;
    case 3:
      return c4;
    default:
      throw new IndexOutOfBoundsException("invalid index: " + i);
    }
  }

  /**
   * Get the distance of this point from the specified point.
   *
   * @param p The point.
   * @return The distance.
   */
  public double distance(Point p) {
    double distance = 0;

    for (int i=0; i<4; i++) {
      double diff = get(i) - p.get(i);
      distance += diff * diff;
    }

    return Math.sqrt(distance);
  }

  public String toString() {
    return "Point(" + c1 + ", " + c2 + ", " + c3 + ", " + c4 + ")";
  }

  public static void main(String[] args) {
    Point p = new Point(2,2,2,2);

    System.out.println(p.toString());

    System.out.println("Distance from origin " + p.distance(ORIGIN));

  }

}
