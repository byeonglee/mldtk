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

    // =======================================================================

    // The forward declaration of java.lang.Object's vtable.
    struct __Object_VT;

    // The data layout for java.lang.Object.
    struct __Object {
      // The vtable pointer.
      __Object_VT* __vptr;

      // The constructor.
      __Object() : __vptr(&__vtable) {
      }

      // The class object representing java.lang.Object.
      static Class __class;

      // The "destructor".
      static void __delete(__Object*);

      // The methods implemented by java.lang.Object.
      static int32_t hashCode(Object);
      static bool equals(Object, Object);
      static Class getClass(Object);
      static String toString(Object);

    private:
      // The vtable for java.lang.Object.
      static __Object_VT __vtable;
    };

    // The vtable layout for java.lang.Object.
    struct __Object_VT {
      Class __isa;
      void (*__delete)(__Object*);
      int32_t (*hashCode)(Object);
      bool (*equals)(Object, Object);
      Class (*getClass)(Object);
      String (*toString)(Object);

      __Object_VT()
        : __isa(__Object::__class),
          __delete(&__Object::__delete),
          hashCode(&__Object::hashCode),
          equals(&__Object::equals),
          getClass(&__Object::getClass),
          toString(&__Object::toString) {
      }
    };

    // =======================================================================

    // The forward declaration of java.lang.Class' vtable.
    struct __Class_VT;

    // The data layout for java.lang.Class.
    struct __Class {
      __Class_VT* __vptr; // The vtable pointer.
      String name;        // The name of the class.
      Class parent;       // The parent class.

      // The constructor.
      __Class(String name, Class parent)
        : __vptr(&__vtable),
          name(name),
          parent(parent) {
      }

      // The class object representing java.lang.Class.
      static Class __class;

      // The "destructor".
      static void __delete(__Class*);

      // The methods implemented by java.lang.Class.
      static String toString(Class);
      static String getName(Class);
      static Class getSuperclass(Class);
      static bool isInstance(Class, Object);

    private:
      // The vtable for java.lang.Class.
      static __Class_VT __vtable;
    };

    // The vtable layout for java.lang.Class.
    struct __Class_VT {
      Class __isa;
      void (*__delete)(__Class*);
      int32_t (*hashCode)(Class);
      bool (*equals)(Class, Object);
      Class (*getClass)(Class);
      String (*toString)(Class);
      String (*getName)(Class);
      Class (*getSuperclass)(Class);
      bool (*isInstance)(Class, Object);

      __Class_VT()
        : __isa(__Class::__class),
          __delete(&__Class::__delete),
          hashCode((int32_t(*)(Class))&__Object::hashCode),
          equals((bool(*)(Class,Object))&__Object::equals),
          getClass((Class(*)(Class))&__Object::getClass),
          toString(&__Class::toString),
          getName(&__Class::getName),
          getSuperclass(&__Class::getSuperclass),
          isInstance(&__Class::isInstance) {
      }
    };

  }
}
