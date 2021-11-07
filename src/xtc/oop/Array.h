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

#include "Types.h"

namespace java {
  namespace lang {

    // Forward declaration of vtable layout.
    template<typename T>
    struct __Array_VT;

    // Declaration of instance layout.
    template<typename T>
    struct __Array {
      __Array_VT<T>* __vptr;
      const int32_t length;
      T* __data;

      __Array(const int32_t length)
        : __vptr(&__vtable), length(length) {
        __data = new T[length];
      }

      T& operator[](int idx) {
        if ((0 > idx) || (idx >= length)) {
          throw ArrayIndexOutOfBoundsException();
        }
        return __data[idx];
      }

      const T& operator[](int idx) const {
        if ((0 > idx) || (idx >= length)) {
          throw ArrayIndexOutOfBoundsException();
        }
        return __data[idx];
      }

      // For C++ templates, static fields are instantiated once per
      // unique combination of type arguments, in this case for each
      // distinct T.
      static __Class __class;
      static __Array_VT<T> __vtable;
    };

    // Declaration of vtable layout.
    template<typename T>
    struct __Array_VT {
      typedef __Array<T>* Array;

      Class __isa;
      int32_t (*hashCode)(Array);
      bool (*equals)(Array, Object);
      Class (*getClass)(Array);
      String (*toString)(Array);

      __Array_VT(Class __isa)
        : __isa(__isa),
          hashCode((int32_t(*)(Array))&__Object::hashCode),
          equals((bool(*)(Array,Object))&__Object::equals),
          getClass((Class(*)(Array))&__Object::getClass),
          toString((String(*)(Array))&__Object::toString) {
      }
    };

  }
}
