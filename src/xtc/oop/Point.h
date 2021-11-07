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

/*
#ifndef POINT_H
#define POINT_H
*/

#pragma once

#include <string>
#include <iostream>
#include <sstream>

#include "Color.h"

using std::ostream;
using std::ostringstream;
using std::string;

namespace oop {

  class Point {
    double c1, c2, c3, c4;

  public:
    static const Point ORIGIN;

    Point(double c1 = 0, double c2 = 0, double c3 = 0, double c4 = 0)
      : c1(c1), c2(c2), c3(c3), c4(c4) {
    }

    double get(int i) const;

    double distance(const Point& p) const;

    string toString() const {
      ostringstream out;
      print(out);
      return out.str();
    }

    virtual ostream& print(ostream&) const;

  };

 class CPoint : public Point {
    Color color;

  public:
    CPoint(Color color, double c1, double c2, double c3, double c4) 
      : Point(c1, c2, c3, c4), color(color) {
    }

    Color getColor() const {
      return color;
    }

    ostream& print(ostream&) const;

  };

  inline ostream& operator<<(ostream& out, const Point& p) {
    return p.print(out);
  }

}

/*
#endif
*/
