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
#ifndef XTC_RUNTIME_H
#define XTC_RUNTIME_H

#include "Core.h"

/** A memory allocator. */
typedef struct __CRTAllocator {
  /** Function to allocate memory. */
  void* (*const malloc)(CRTIndex size);

  /** Function to allocate and clear memory. */
  void* (*const calloc)(CRTIndex number, CRTIndex size);

  /** Function to reallocate memory. */
  void* (*const realloc)(void* ptr, CRTIndex size);

  /** Function to free memory. */
  void (*const free)(void* ptr);
} CRTAllocator;

enum { kCRTRegistrationError = -1 };

/**
 * Register a new class with the runtime.
 *
 * @param k The class.
 * @return The corresponding type id or
 *   <code>kCRTRegistrationError</code> if the class could not be
 *   registered.
 */
CRTTypeID CRTClassRegister(CRTClass* k);

/**
 * Get the default allocator.
 *
 * @return The default allocator.
 */
CRTAllocator* CRTAllocatorDefault(void);

/**
 * Create a new object instance.
 *
 * @param alloc The allocator or <code>null</code> if the default
 *   allocator should be used.
 * @param id The class' type id.
 * @param size The size of the instance, including the object header.
 * @return A new instance or 0 if the instance could not be allocated.
 */
CRTReference CRTClassNewInstance(CRTAllocator* alloc,
                                 CRTTypeID id, CRTIndex size);

/**
 * Delete the specified object instance.  This function should never
 * be called directly; rather, it is automatically called from {@link
 * CRTRelease(CRTReference)}.
 *
 * @param r The reference.
 */
void CRTInstanceDelete(CRTReference r);

/**
 * Initialize CRT.
 */
void CRTInit(void);

#endif /* XTC_RUNTIME_H */
