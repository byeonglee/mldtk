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

namespace java {
  namespace lang {

    struct __Object;
    struct __Class;

    template<typename T>
    struct __Array;
  }
}

namespace rt {

  struct object_tag {} ;
  struct array_tag {} ;
  struct translated_tag {} ;

  template<typename T>
  struct object_traits {
    typedef object_tag tag;
  };

  template<typename T>
  struct object_traits<T[]> {
    typedef array_tag tag;
  };

  template<>
  struct object_traits<java::lang::__Object> {
    typedef translated_tag tag;
  };

  template<>
  struct object_traits<java::lang::__Class> {
    typedef translated_tag tag;
  };

  template<typename T>
  struct object_traits<java::lang::__Array<T> > {
    typedef translated_tag tag;
  };

  template<typename T>
  void destruct(T* ptr, object_tag) {
    delete ptr;
  }

  template<typename T>
  void destruct(T* ptr, array_tag) {
    delete[] ptr;
  }

  template<typename T>
  void destruct(T* ptr, translated_tag) {
    if (0 != ptr) ptr->__vptr->__delete(ptr);
  }

}

