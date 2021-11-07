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

#include "Ptr.h"

#include <stdint.h>
#include <string>

namespace java {
  namespace lang {

    struct __Object;
    struct __Class;

    typedef rt::Ptr<__Object> Object;
    typedef rt::Ptr<__Class> Class;

    typedef std::string String;

    // ======================================================================

    class Throwable {
    };

    class Exception : public Throwable {
    };

    class RuntimeException : public Exception {
    };

    class NullPointerException : public RuntimeException {
    };

    class ClassCastException : public RuntimeException {
    };

    class IndexOutOfBoundsException : public RuntimeException {
    };

    class ArrayIndexOutOfBoundsException : public IndexOutOfBoundsException {
    };

    // ======================================================================

    // The forward declaration of java.lang.Object's vtable.
    struct __Object_VT;

    // The data layout for java.lang.Object.
    struct __Object {
      __Object_VT* __vptr;

      __Object()
      : __vptr(&__vtable) {
      };

      // --------------------------------------------------------------------

      // The class object representing java.lang.Object.
      static Class __class();

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
      : __isa(__Object::__class()),
        __delete(&__Object::__delete),
        hashCode(&__Object::hashCode),
        equals(&__Object::equals),
        getClass(&__Object::getClass),
        toString(&__Object::toString) {
      }
    };

    // ======================================================================

    // The forward declaration of java.lang.Class's vtable.
    struct __Class_VT;

    // The data layout for java.lang.Class.
    struct __Class {
      __Class_VT* __vptr;
      String name;
      Class parent;
      Class component;

      __Class(String name, Class parent, Class component)
      : __vptr(&__vtable),
        name(name),
        parent(parent),
        component(component) {
      }

      // --------------------------------------------------------------------

      // The class object representing java.lang.Class.
      static Class __class();

      // The "destructor".
      static void __delete(__Class*);

      // The instance methods of java.lang.Class.
      static String toString(Class);
      static String getName(Class);
      static Class getSuperclass(Class);
      static bool isInstance(Class, Object);
      static Class getComponentType(Class);

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
      Class (*getComponentType)(Class);

      __Class_VT()
      : __isa(__Class::__class()),
        __delete(&__Class::__delete),
        hashCode((int32_t(*)(Class))&__Object::hashCode),
        equals((bool(*)(Class,Object))&__Object::equals),
        getClass((Class(*)(Class))&__Object::getClass),
        toString(&__Class::toString),
        getName(&__Class::getName),
        getSuperclass(&__Class::getSuperclass),
        isInstance(&__Class::isInstance),
        getComponentType(&__Class::getComponentType) {
      }
    };

    // ======================================================================

    // The forward declaration of the data layout for arrays.
    template<typename T>
    struct __Array;

    typedef rt::Ptr<__Array<int32_t> > ArrayOfInt;
    typedef rt::Ptr<__Array<Object> > ArrayOfObject;
    typedef rt::Ptr<__Array<Class> > ArrayOfClass;

    // The forward declaration of the vtable layout for arrays.
    template<typename T>
    struct __Array_VT;

    // The data layout for arrays.
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
        if (0 > idx || idx >= length) throw ArrayIndexOutOfBoundsException();
        return __data[idx];
      }

      const T& operator[](int idx) const {
        if (0 > idx || idx >= length) throw ArrayIndexOutOfBoundsException();
        return __data[idx];
      }

      // --------------------------------------------------------------------

      // The class object representing the array.
      static Class __class();

      // The destructor.
      static void __delete(__Array* __this) {
        delete[] __this->__data;
        delete __this;
      }

    private:
      // The vtable for the array.
      static __Array_VT<T> __vtable;
    };

    // The vtable layout for arrays.
    template<typename T>
    struct __Array_VT {
      typedef rt::Ptr<__Array<T> > Array;

      Class __isa;
      void (*__delete)(__Array<T>*);
      int32_t (*hashCode)(Array);
      bool (*equals)(Array, Object);
      Class (*getClass)(Array);
      String (*toString)(Array);

      __Array_VT()
        : __isa(__Array<T>::__class()),
          __delete(&__Array<T>::__delete),
          hashCode((int32_t(*)(Array))&__Object::hashCode),
          equals((bool(*)(Array,Object))&__Object::equals),
          getClass((Class(*)(Array))&__Object::getClass),
          toString((String(*)(Array))&__Object::toString) {
      }
    };

    // The vtable for arrays.  Note that this definition invokes the
    // default no-arg constructor for __Array_VT.  It is provided in
    // the header file to be accessible to the linker.
    template<typename T>
    __Array_VT<T> __Array<T>::__vtable;

    // Template function to check against null values.
    template<typename T>
    void checkNotNull(T o) {
      if (0 == o.raw()) throw NullPointerException();
    }

    // Template function to check against array element types being
    // incompatible.
    template<typename T>
    void checkArrayType(rt::Ptr<__Array<T> > array, Object o) {
      if (0 != o.raw()) {
        Class type    = array->__vptr->getClass(array);
        Class element = type->__vptr->getComponentType(type);

        if (! element->__vptr->isInstance(element, o)) {
          throw ClassCastException();
        }
      }
    }

    // Template function to implement Java casts.
    template<typename T, typename U>
    T java_cast(U other) {
      Class k = T::element::__class();
      if (! k->__vptr->isInstance(k, Object(other))) {
        throw ClassCastException();
      }
      return T(other);
    }

  }
}
