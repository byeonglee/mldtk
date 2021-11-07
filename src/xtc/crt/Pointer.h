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
#ifndef XTC_POINTER_H
#define XTC_POINTER_H

#include "Core.h"

/** The signature of the pointer free function. */
typedef void (*CRTPointerFree)(void* p);

/** The pointer type. */
typedef struct __CRTPointer * CRTPointer;

/** The private pointer layout. */
struct __CRTPointer {
  CRTObjectHeader header;
  void* ptr;
  CRTPointerFree free;
};

/** The private pointer id. */
extern CRTTypeID __CRTPointerID;

/**
 * Get the type id for pointers.
 *
 * @return The type id for pointers.
 */
static inline CRTTypeID
CRTPointerID(void) {
  return __CRTPointerID;
}

/**
 * Paranoiacally assert that the specified pointer is a pointer.
 *
 * @param p The pointer.
 */
#define CRTAssertPointer(p)                        \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTPointerID()))

/**
 * Create a new pointer.
 *
 * @param ptr The actual pointer.
 * @param free The free function.
 * @return A new pointer.
 */
CRTPointer CRTPointerCreate(void* ptr, CRTPointerFree free);

/**
 * Get the actual pointer.
 *
 * @param p The pointer.
 * @return The actual pointer.
 */
static inline void*
CRTPointerGet(CRTPointer p) {
  CRTAssertPointer(p);
  return p->ptr;
}

/** Initialize the pointer class. */
void CRTPointerInit(void);

#endif /* XTC_POINTER_H */
