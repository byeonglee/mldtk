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

#pragma once

#include <iterator>
#include <iostream>
#include <stdexcept>

using std::ostream;
using std::out_of_range;

namespace oop {

  template<typename T>
  class gen_iterator : public std::iterator<std::forward_iterator_tag, T> {
  public:
    gen_iterator(T* el) : el(el) {
    }

    bool operator==(const gen_iterator& other) const {
      return el == other.el;
    }

    bool operator!=(const gen_iterator& other) const {
      return el != other.el;
    }

    gen_iterator& operator++() {
      ++el;
      return *this;
    }

    gen_iterator operator++(int) {
      gen_iterator tmp(*this);
      ++el;
      return tmp;
    }

    T& operator*() const {
      return *el;
    }

    T* operator->() const {
      return el;
    }

  private:
    T* el;
  };

  class pn {
  private:
    unsigned int dim;
    double* points;
    
  public:
    typedef gen_iterator<const double> const_iterator;
    typedef gen_iterator<double> iterator;
    
    pn(unsigned int dim, double init = 0) : dim(dim), points(new double[dim]) {
      for (int i=0; i<dim; i++) points[i] = init;
    }
    
    pn(const pn& other) : dim(other.dim), points(new double[other.dim]) {
      for (int i=0; i<dim; i++) points[i] = other.points[i];
    }
    
    ~pn() {
      delete[] points;
    }
    
    pn& operator=(const pn& other) {
      if (points == other.points) return *this;
      
      delete[] points;
      dim = other.dim;
      points = new double[dim];
      for (int i=0; i<dim; i++) points[i] = other.points[i];
      
      return *this;
    }

    const int dimensions() const {
      return dim;
    }
    
    const double& operator[](int idx) const {
      if ((idx < 0) || (idx >= dim)) throw out_of_range("you bad");
      return points[idx];
    }
    
    double& operator[](int idx) {
      if ((idx < 0) || (idx >= dim)) throw out_of_range("you bad");
      return points[idx];
    }

    iterator begin() {
      return iterator(points);
    }

    iterator end() {
      return iterator(points + dim);
    }

    const_iterator begin() const {
      return const_iterator(points);
    }

    const_iterator end() const {
      return const_iterator(points + dim);
    }

  };

  ostream& operator<<(ostream& out, const pn& p);

}
