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

#include "java_lang.h"

using namespace java::lang;

int main(void) {
  // Object o = new Object();
  Object o = new __Object();

  std::cout << "o = "
            << /* o.toString() */ o->__vptr->toString(o)
            << std::endl;

  // Class k = o.getClass();
  Class k = o->__vptr->getClass(o);

  std::cout << "k = "
            << /* k.getName() */ k->__vptr->getName(k)
            << std::endl
            << "k = "
            << /* k.toString() */ k->__vptr->toString(k)
            << std::endl;

  // Class l = k.getClass();
  Class l = k->__vptr->getClass(k);

  std::cout << "l = "
            << /* l.getName() */ l->__vptr->getName(l)
            << std::endl
            << "l = "
            << /* l.toString() */ l->__vptr->toString(l)
            << std::endl;

  // if (k.equals(l)) {
  if (k->__vptr->equals(k, Object(l))) {
    std::cout << "k.equals(l)" << std::endl;
  } else {
    std::cout << "! k.equals(l)" << std::endl;
  }

  // if (k.equals(l.getSuperclass())) {
  if (k->__vptr->equals(k, Object(l->__vptr->getSuperclass(l)))) {
    std::cout << "k.equals(l.getSuperclass())" << std::endl;
  } else {
    std::cout << "! k.equals(l.getSuperclass())" << std::endl;
  }

  // if (k.isInstance(o)) {
  if (k->__vptr->isInstance(k, o)) {
    std::cout << "o instanceof k" << std::endl;
  } else {
    std::cout << "! (o instanceof k)" << std::endl;
  }

  // if (l.isInstance(o)) {
  if (l->__vptr->isInstance(l, o)) {
    std::cout << "o instanceof l" << std::endl;
  } else {
    std::cout << "! (o instanceof l)" << std::endl;
  }

  // Calling java.lang.Object.toString on k (hack!)
  std::cout << o->__vptr->toString(Object(k)) << std::endl;

  // int[] a = new int[5];
  ArrayOfInt a = new __Array<int32_t>(5);

  // a[2] = 4;
  checkNotNull(a);
  (*a)[2] = 4;

  // System.out.println(a);
  std::cout << (Object(0) == a ? "null" : a->__vptr->toString(a))
            << std::endl;

  // System.out.println(a[2]);
  checkNotNull(a);
  std::cout << (*a)[2] << std::endl;

  // Object[] a2 = new Object[2];
  ArrayOfObject a2 = new __Array<Object>(2);

  // a2[1] = o;
  checkNotNull(a2);
  checkArrayType(a2, o);
  (*a2)[1] = o;

  // System.out.println(a2);
  std::cout << (a2 == Object(0) ? "null" : a2->__vptr->toString(a2))
            << std::endl;

  // Class klass = (Class)o;
  Class klass = java_cast<Class>(o);
  //Object object = java_cast<Object>(k);

  return 0;
}
