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

#include <stdexcept>
#include <math.h>

#include "Point.h"

namespace oop {

  const Point Point::ORIGIN = Point();

  double Point::get(int i) const {
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
      throw std::out_of_range("invalid index");
    }
  }
  
  double Point::distance(const Point& p) const {
    double distance = 0;
    
    for (int i=0; i<=3; i++) {
      double diff = get(i) - p.get(i);
      distance += diff * diff;
    }
    
    return sqrt(distance);
  }
  
  ostream& Point::print(ostream& out) const {
    out << "Point(" << c1 << ", " << c2 << ", " << c3 << ", " << c4 << ")";
    return out;
  }

  ostream& CPoint::print(ostream& out) const {
    out << "CPoint(" << color.toString() << ", " << get(0) << ", " << 
      get(1) << ", " << get(2) << ", " << get(3) << ")";
    return out;
  }

}

// ---------------------------------------------------------------------------

using oop::Point;
using oop::CPoint;
using oop::Color;

using std::cout;
using std::endl;

int main(void) {
  Point* p = new Point(3,0,4,0);

  cout << "1: " << *p << endl;

  CPoint* cp = new CPoint(Color::GREEN, 4, 1, 3, 1);

  cout << "2: " << *cp << endl;

  cout << "Happy happy joy joy!" << endl;

}
