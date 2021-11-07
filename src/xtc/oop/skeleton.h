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

#include <stdint.h>
#include <string>

namespace java {
  namespace lang {

    struct __Object;
    struct __Class;

    typedef __Object* Object;
    typedef __Class* Class;
    typedef std::string String;

    // ======================================================================

    // The forward declaration of java.lang.Object's vtable.
    struct __Object_VT;

    // The data layout for java.lang.Object.
    struct __Object {
      __Object_VT* __vptr;
    };

    // The vtable layout for java.lang.Object.
    struct __Object_VT {
      Class __isa;
      int32_t (*hashCode)(Object);
      bool (*equals)(Object, Object);
      Class (*getClass)(Object);
      String (*toString)(Object);
    };

    // ======================================================================

    // The forward declaration of java.lang.Class's vtable.
    struct __Class_VT;

    // The data layout for java.lang.Class.
    struct __Class {
      __Class_VT* __vptr;
      String name;
      Class parent;
    };

    // The vtable layout for java.lang.Class.
    struct __Class_VT {
      Class __isa;
      int32_t (*hashCode)(Class);
      bool (*equals)(Class, Object);
      Class (*getClass)(Class);
      String (*toString)(Class);
      String (*getName)(Class);
      Class (*getSuperclass)(Class);
      bool (*isInstance)(Class, Object);
    };

  }
}
