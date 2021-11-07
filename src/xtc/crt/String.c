/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 * USA.
 */

#include "String.h"
#include "Runtime.h"

#include <string.h> // memcmp, memcpy

static CRTHashCode CRTStringHash(CRTString s) {
  CRTChar*    data = __CRT_STRING_DATA(s);
  CRTHashCode hash = 0;

  for (int i=0; i<s->size; i++) {
    hash = 31*hash + data[i];
  }

  return hash;
}

static bool CRTStringEqual(CRTString s1, CRTString s2) {
  if (s1->size != s2->size) return false;
  return 0 == memcmp(__CRT_STRING_DATA(s1), __CRT_STRING_DATA(s2), s1->size);
}

CRTTypeID __CRTStringID = kCRTRegistrationError;

CRTClass __CRTStringClass = {
  0,
  (CRTChar*)"String",
  0,
  0,
  (CRTHashFunction)CRTStringHash,
  (CRTEqualFunction)CRTStringEqual
};

CRTString
CRTStringCreateFromArray(CRTChar data[], CRTIndex start, CRTIndex size) {
  CRTBeParanoid(data);

  CRTString s =
    CRTClassNewInstance(0, __CRTStringID, sizeof(struct __CRTString)+size+1);
  if (0 == s) return 0;

  memcpy(s->data, data + start, size);
  s->data[size] = '\0';
  return s;
}

void
CRTStringInit(void) {
  __CRTStringID = CRTClassRegister(&__CRTStringClass);
  CRTBeCautious(__CRTStringID != kCRTRegistrationError);
}
