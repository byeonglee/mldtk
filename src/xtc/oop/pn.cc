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

#include <iostream>
#include "pn.h"

using std::cout;
using std::endl;

using oop::pn;

ostream& oop::operator<<(ostream& out, const pn& p) {
  out << "NPoint(";

  /*
  int  dimensions = p.dimensions();
  bool first = true;
  for (int i=0; i<dimensions; i++) {
    if (first) {
      first = false;
    } else {
      out << ", ";
    }
    
    out << p[i];
  }
  */

  bool first = true;
  for (pn::const_iterator it = p.begin(); it != p.end(); ++it) {
    if (first) {
      first = false;
    } else {
      out << ", ";
    }
    
    out << *it;
  }
      
  out << ')';
}

int main() {

  pn p(5);

  p[1] = 1;
  p[2] = 2;
  p[3] = 3;
  p[4] = 4;

  cout << p << endl;

}
