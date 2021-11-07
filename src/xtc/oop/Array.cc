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
#include "Array.h"

namespace java {
  namespace lang {

    // Template specialization for the class of integer arrays.
    template<>
    __Class __Array<int32_t>::__class("[I", &__Object::__class);

    // Template specialization for the class of double arrays.
    template<>
    __Class __Array<double>::__class("[D", &__Object::__class);

    // Template specialization for the vtable of integer arrays.
    template<>
    __Array_VT<int32_t> __Array<int32_t>::__vtable(&__Array<int32_t>::__class);

  }
}
