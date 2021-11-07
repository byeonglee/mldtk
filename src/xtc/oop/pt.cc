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

#include "pt.h"

#include <iostream>
#include <stdexcept>

using std::ostream;
using std::cout;
using std::endl;
using std::out_of_range;

namespace oop {

#ifdef DEBUG
  unsigned int pt::counter = 0;
#endif

  pt::pt(int dim, double init) :
#ifdef DEBUG
    id(++counter),
#endif
    size(dim), points(new double[dim])
  {
    for (int i=0; i<dim; i++) points[i] = init;
#ifdef DEBUG
    cout << "construct " << id << endl;
#endif
  }

  pt::pt(const pt& other) :
#ifdef DEBUG
    id(++counter),
#endif
    size(other.size), points(new double[other.size])
  {
    for (int i=0; i<size; i++) points[i] = other.points[i];
#ifdef DEBUG
    cout << "copy construct " << id << " from " << other.id << endl;
#endif
  }

  pt::~pt() {
#ifdef DEBUG
    cout << "destruct " << id << endl;
#endif
    delete[] points;
  }

  pt& pt::operator=(const pt& other) {
#ifdef DEBUG
    cout << "assign " << id << " from " << other.id << endl;
#endif
    if (points == other.points) return *this;

    delete[] points;
    size = other.size;
    points = new double[size];
    for (int i=0; i<size; i++) points[i] = other.points[i];

    return *this;
  }

  const double& pt::operator[](int idx) const {
    if (idx < 0 || idx >= size) throw out_of_range("you bad");
    return points[idx];
  }

  double& pt::operator[](int idx) {
    if (idx < 0 || idx >= size) throw out_of_range("you bad");
    return points[idx];
  }

  ostream& operator<<(ostream& out, const pt& p) {
    out << "NPoint(";

    bool first = true;
    for (int i=0; i<p.dim(); i++) {
      if (first) {
        first = false;
      } else {
        out << ", ";
      }

      out << p[i];
    }

    out << ')';

    return out;
  }

}

using oop::pt;

pt id(pt arg) {
#ifdef DEBUG
  cout << "called id" << endl;
#endif

  return arg;
}

int main() {
  pt p1(1);
  pt p2(2);

  cout << "p1 " << p1 << endl;
  cout << "p2 " << p2 << endl;

  p2 = id(p1);

  cout << "p2 " << p2 << endl;

  return 0;
}
