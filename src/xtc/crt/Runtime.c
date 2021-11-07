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

#include "Runtime.h"
#include "Util.h"

#include <stdlib.h> // malloc, free

/** The default allocator. */
static CRTAllocator __CRTDefaultAllocator = {
  malloc,
  calloc,
  realloc,
  free
};

/** The class count. */
static CRTTypeID __CRTClassCount = 0;

/** The class table size. */
enum { __kCRTClassTableSize = 256 };

/** The class table. */
static CRTClass* __CRTClassTable[ __kCRTClassTableSize ] = { };

static inline bool
CRTIsTypeID(CRTTypeID id) {
  return ((0 <= id) && (id < __CRTClassCount));
}

bool
CRTIsReference(void* p) {
  CRTClass* k  = __CRT_CLASS(p);
  CRTTypeID id = k->id;
  return CRTIsTypeID(id) && (__CRTClassTable[id] == k);
}

bool
CRTIsInstanceOf(void* p, CRTTypeID id) {
  CRTClass* k   = __CRT_CLASS(p);
  CRTTypeID id2 = k->id;
  return CRTIsTypeID(id2) && (__CRTClassTable[id2] == k) && (id == id2);
}

CRTHashCode
CRTHash(CRTReference r) {
  CRTAssertReference(r);
  CRTClass* k = __CRT_CLASS(r);
  return (0 != k->hash) ? k->hash(r) : (CRTHashCode)r;
}

bool
CRTEqual(CRTReference r1, CRTReference r2) {
  CRTAssertReference(r1);
  CRTAssertReference(r2);
  CRTClass* k1 = __CRT_CLASS(r1);
  CRTClass* k2 = __CRT_CLASS(r2);
  return (k1 == k2) && ((0 != k1->equal) ? k1->equal(r1, r2) : (r1 == r2));
}

CRTTypeID
CRTClassRegister(CRTClass* k) {
  CRTBeParanoid(__CRTClassCount <= __kCRTClassTableSize);

  if (__CRTClassCount == __kCRTClassTableSize) return (CRTTypeID)-1;

  k->id = __CRTClassCount;
  __CRTClassTable[ __CRTClassCount ] = k;
  return __CRTClassCount++;
}

CRTAllocator*
CRTAllocatorDefault(void) {
  return &__CRTDefaultAllocator;
}

CRTReference
CRTClassNewInstance(CRTAllocator* alloc, CRTTypeID id, CRTIndex size) {
  CRTBeSuspicious(CRTIsTypeID(id));

  alloc = &__CRTDefaultAllocator;

  CRTClass* klass = __CRTClassTable[id];

  CRTReference r = alloc->malloc(size);
  if (0 == r) return 0;

  __CRT_CLASS(r)     = klass;
  __CRT_REF_COUNT(r) = 1;
  __CRT_FLAGS(r)     = 0;

  if (0 != klass->init) klass->init(r);

  return r;
}

void
CRTInstanceDelete(CRTReference r) {
  CRTBeSuspicious(! CRTBitIsSet(__CRT_FLAGS(r), 0));

  CRTAllocator* tor   = & __CRTDefaultAllocator;
  CRTClass*     klass = __CRT_CLASS(r);
  if (0 != klass->destroy) klass->destroy(r);
  tor->free(r);
}

#include "Null.h"
#include "String.h"
#include "Pointer.h"
#include "Pair.h"
#include "Node.h"

void
CRTInit(void) {
  CRTNullInit();
  CRTStringInit();
  CRTPointerInit();
  CRTPairInit();
  CRTNodeInit();
}
