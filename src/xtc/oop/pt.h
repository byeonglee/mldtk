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

#include <iostream>

#define DEBUG

namespace oop {

  class pt {
  private:

#ifdef DEBUG
    static unsigned int counter;
    unsigned int id;
#endif

    int size;
    double* points;

  public:
    pt(int dim, double init = 0.0);
    pt(const pt& other);
    ~pt();

    pt& operator=(const pt& other);

    const int dim() const {
      return size;
    }

    const double& operator[](int idx) const;
    double& operator[](int idx);
  };

  std::ostream& operator<<(std::ostream& out, const pt& p);

}
