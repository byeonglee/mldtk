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

#include "Core.h"

#include <sstream>

namespace java {
  namespace lang {

    // java.lang.Object.__delete(__Object*)
    void __Object::__delete(__Object* __this) {
      delete __this;
    }

    // java.lang.Object.hashCode()
    int32_t __Object::hashCode(Object __this) {
      return reinterpret_cast<int32_t>(__this.raw());
    }

    // java.lang.Object.equals(Object)
    bool __Object::equals(Object __this, Object other) {
      return __this.raw() == other.raw();
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
      sout << k->__vptr->getName(k) << '@' << std::hex <<
        reinterpret_cast<uint32_t>(__this.raw());
      return sout.str();
    }

    // The class for java.lang.Object.
    Class __Object::__class(new __Class("java.lang.Object", 0));

    // The vtable for java.lang.Object.  Note that this definition
    // invokes the default no-arg constructor for __Object_VT.
    __Object_VT __Object::__vtable;

    // =======================================================================

    // java.lang.Class.__delete(__Class*)
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
      // Class k = o.getClass();
      Class k = o->__vptr->getClass(o);

      do {
        // if (this.equlas(k)) return true;
        if (__this->__vptr->equals(__this, rt::Ptr<__Object>(k))) return true;

        // k = k.getSuperclass();
        k = k->__vptr->getSuperclass(k);
      } while (k);

      return false;
    }

    // The class for java.lang.Class
    Class __Class::__class(new __Class("java.lang.Class", __Object::__class));

    // The vtable for java.lang.Class.  Note that this definition
    // invokes the default no-arg constructor for __Class_VT.
    __Class_VT __Class::__vtable;

  }
}
