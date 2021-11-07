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

#pragma once

#include "Traits.h"

namespace rt {

  template<typename T>
  class Ptr {
  public:
    typedef T element;
    typedef typename object_traits<T>::tag tag;

    Ptr() : ptr(0), count(new unsigned int(1)) {
    }

    Ptr(T* ptr) : ptr(ptr), count(new unsigned int(1)) {
    }

    Ptr(const Ptr& other) : ptr(other.ptr), count(other.count) {
      ++(*count);
    }

    template<typename U>
    friend class Ptr;

    template<typename U>
    Ptr(const Ptr<U>& other) : ptr(reinterpret_cast<T*>(other.ptr)),
                               count(other.count) {
      ++(*count);
    }

    ~Ptr() {
      if (0 == --(*count)) {
        destruct(ptr, tag());
        delete count;
      }
    }

    // operator= and operator* return a reference, so that the result
    // can be used as an l-value.  (Note, though, that the types of
    // the results differ.)

    Ptr& operator=(const Ptr& right) {
      if (ptr == right.ptr) return *this;

      if (0 == --(*count)) {
        destruct(ptr, tag());
        delete count;
      }

      ptr = right.ptr;
      count = right.count;
      ++(*count);
      return *this;
    }

    T& operator*() const { return *ptr; }
    T* operator->() const { return ptr; }
    T* raw() const { return ptr; }

    template<typename U>
    bool operator==(const Ptr<U>& other) const {
      return ptr == reinterpret_cast<T*>(other.ptr);
    }

    template<typename U>
    bool operator!=(const Ptr<U>& other) const {
      return ptr != reinterpret_cast<T*>(other.ptr);
    }

  private:
    T* ptr;
    unsigned int* count;
  };

}
