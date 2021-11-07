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

#include "java_lang.h"

#include <sstream>

namespace java {
  namespace lang {

    // The destructor.
    void __Object::__delete(__Object* __this) {
      delete __this;
    }

    // java.lang.Object.hashCode()
    int32_t __Object::hashCode(Object __this) {
#ifdef __LP64__
      return reinterpret_cast<int64_t>(__this.raw());
#else
      return reinterpret_cast<int32_t>(__this.raw());
#endif
    }

    // java.lang.Object.equals(Object)
    bool __Object::equals(Object __this, Object other) {
      return __this == other;
    }

    // java.lang.Object.getClass()
    Class __Object::getClass(Object __this) {
      return __this->__vptr->__isa;
    }

    // java.lang.Object.toString()
    String __Object::toString(Object __this) {
      // Class k = this.getClass();
      Class k = __this->__vptr->getClass(__this);

      std::ostringstream sout;
      sout << k->__vptr->getName(k) << '@' << std::hex
           << __this->__vptr->hashCode(__this);
      return sout.str();
    }

    // Internal accessor for java.lang.Object's class.
    Class __Object::__class() {
      static Class k = new __Class("java.lang.Object", 0, 0);
      return k;
    }

    // The vtable for java.lang.Object.  Note that this definition
    // invokes the default no-arg constructor for __Object_VT.

    __Object_VT __Object::__vtable;

    // =======================================================================

    // The destructor.
    void __Class::__delete(__Class* __this) {
      delete __this;
    }

    // java.lang.Class.toString()
    String __Class::toString(Class __this) {
      return "class " + __this->name;
    }

    // java.lang.Class.getName()
    String __Class::getName(Class __this) {
      return __this->name;
    }

    // java.lang.Class.getSuperclass()
    Class __Class::getSuperclass(Class __this) {
      return __this->parent;
    }

    // java.lang.Class.isInstance(Object)
    bool __Class::isInstance(Class __this, Object o) {
      Class k = o->__vptr->getClass(o);

      do {
        if (__this->__vptr->equals(__this, (Object)k)) return true;

        k = k->__vptr->getSuperclass(k);
      } while (0 != k.raw());

      return false;
    }

    // java.lang.Class.getComponentType()
    Class __Class::getComponentType(Class __this) {
      return __this->component;
    }

    // Internal accessor for java.lang.Class' class.
    Class __Class::__class() {
      static Class k = new __Class("java.lang.Class", __Object::__class(), 0);
      return k;
    }

    // The vtable for java.lang.Class.  Note that this definition
    // invokes the default no-arg constructor for __Class_VT.
    __Class_VT __Class::__vtable;

    // =======================================================================

    // The class for primitive ints.
    static Class __class_int = new __Class("int", 0, 0);

    // Template specialization for the class of integer arrays.
    template<>
    Class __Array<int32_t>::__class() {
      static Class k = new __Class("[I", __Object::__class(), __class_int);
      return k;
    }

    // Template specialization for the class of Object arrays.
    template<>
    Class __Array<Object>::__class() {
      static Class k = new __Class("[Ljava.lang.Object;",
                                   __Object::__class(),
                                   __Object::__class());
      return k;
    }

    // Template specialization for the class of Class arrays.
    template<>
    Class __Array<Class>::__class() {
      static Class k = new __Class("[Ljava.lang.Class;",
                                   __Array<Object>::__class(),
                                   __Class::__class());
      return k;
    }

  }
}
