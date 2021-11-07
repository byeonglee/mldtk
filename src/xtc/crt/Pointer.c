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

#include "Pointer.h"
#include "Runtime.h"

static void CRTPointerDestroy(CRTPointer p) {
  p->free(p->ptr);
}

CRTTypeID __CRTPointerID = kCRTRegistrationError;

static CRTClass __CRTPointerClass = {
  0,
  (CRTChar*)"Pointer",
  0,
  (CRTDestroyFunction)CRTPointerDestroy,
  0,
  0
};

CRTPointer
CRTPointerCreate(void* ptr, CRTPointerFree free) {
  CRTBeParanoid(free);

  CRTPointer p =
    CRTClassNewInstance(0, __CRTPointerID, sizeof(struct __CRTPointer));
  if (0 == p) return 0;

  p->ptr  = ptr;
  p->free = free;
  return p;
}

void
CRTPointerInit(void) {
  __CRTPointerID = CRTClassRegister(&__CRTPointerClass);
  CRTBeCautious(__CRTPointerID != kCRTRegistrationError);
}
