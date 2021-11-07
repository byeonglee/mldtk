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

#include "Null.h"
#include "Runtime.h"

CRTTypeID __CRTNullID = kCRTRegistrationError;

static CRTHashCode CRTNullHash(CRTReference r) {
  return 0;
}

static CRTClass __CRTNullClass = {
  0,
  (CRTChar*)"Null",
  0,
  0,
  CRTNullHash,
  0
};

CRTReference __CRTNull = &(CRTObjectHeader) { &__CRTNullClass, 2, 1 };

void
CRTNullInit(void) {
  __CRTNullID = CRTClassRegister(&__CRTNullClass);
  CRTBeCautious(__CRTNullID != kCRTRegistrationError);
}
