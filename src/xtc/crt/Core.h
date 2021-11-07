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
#ifndef XTC_CORE_H
#define XTC_CORE_H

#include "Assert.h"

#include <stddef.h>
#include <stdbool.h>

/** An unsigned character. */
typedef unsigned char CRTChar;

/** An unsigned integer representing hash codes. */
typedef unsigned int CRTHashCode;

/** An unsigned integer representing reference counts. */
typedef unsigned short CRTRefCount;

/** A signed integer representing type identifiers. */
typedef unsigned int CRTTypeID;

/** An unsigned integer representing index and size values. */
typedef size_t CRTIndex;

/** The reference type. */
typedef void* CRTReference;

/** The signature of the init function. */
typedef void (*CRTInitFunction)(CRTReference);

/** The signature of the destroy function. */
typedef void (*CRTDestroyFunction)(CRTReference);

/** The signature of the hash function. */
typedef CRTHashCode (*CRTHashFunction)(CRTReference);

/** The signature of the equal function. */
typedef bool (*CRTEqualFunction)(CRTReference, CRTReference);

/** A class. */
typedef struct __CRTClass {
  /** The type id (to be filled in by the runtime). */
  CRTTypeID id;

  /** The name. */
  CRTChar * name;

  /** Function to initialize an instance. */
  CRTInitFunction init;

  /** Function to destroy an instance. */
  CRTDestroyFunction destroy;

  /** Function to determine an instance's hash code. */
  CRTHashFunction hash;

  /** Function to determine whether two instances are equal. */
  CRTEqualFunction equal;
} CRTClass;

/** An object's header, which should be treated as opaque. */
typedef struct __CRTObjectHeader {
  /** The pointer to the object's class. */
  CRTClass* isa;

  /** The object's reference count. */
  CRTRefCount count;

  /** The object's flags. */
  CRTRefCount flags;
} CRTObjectHeader;

/** Macro to access a reference's class. */
#define __CRT_CLASS(r)      (((CRTObjectHeader *)(r))->isa)

/** Macro to access a reference's reference count. */
#define __CRT_REF_COUNT(r)  (((CRTObjectHeader *)(r))->count)

/** Macro to access a reference's flags. */
#define __CRT_FLAGS(r)      (((CRTObjectHeader *)(r))->flags)

/**
 * Determine whether the specified pointer is a reference.
 *
 * @param p The pointer.
 * @return <code>true</code> if the pointer is a reference.
 */
bool CRTIsReference(void* p);

/**
 * Paranoiacally assert that the specified pointer is a reference.
 *
 * @param p The pointer.
 */
#define CRTAssertReference(p)                   \
  CRTBeParanoid(CRTIsReference(p))

/**
 * Determine whether the specified pointer is a reference
 * with the specified type id.
 *
 * @param p The pointer.
 * @param id The type id.
 * @return <code>true</code> if the pointer is a reference
 *   with the id.
 */
bool CRTIsInstanceOf(void* p, CRTTypeID id);

/**
 * Retain the specified reference.
 *
 * @param r The reference.
 * @return The reference.
 */
static inline CRTReference
CRTRetain(CRTReference r) {
  CRTAssertReference(r);
  __CRT_REF_COUNT(r)++;
  return r;
}

void CRTInstanceDelete(CRTReference r);

/**
 * Release the specified reference.
 *
 * @param r The reference.
 */
static inline void
CRTRelease(CRTReference r) {
  CRTAssertReference(r);
  if (! --__CRT_REF_COUNT(r)) {
    CRTInstanceDelete(r);
  }
}

/**
 * Get the specified reference's reference count.
 *
 * @param r The reference.
 * @return The reference count.
 */
static inline CRTRefCount
CRTGetRefCount(CRTReference r) {
  CRTAssertReference(r);
  return __CRT_REF_COUNT(r);
}

/**
 * Get the specified reference' hash code.
 *
 * @param r The reference.
 * @return The hash code.
 */
CRTHashCode CRTHash(CRTReference r);

/**
 * Determine whether the specified references are equal.
 *
 * @param r1 The first reference.
 * @param r2 The second reference.
 * @return <code>true</code> if the specified references are equal.
 */
bool CRTEqual(CRTReference r1, CRTReference r2);

/**
 * Get the specified reference's type id.
 *
 * @param r The reference.
 * @return The corresponding type id.
 */
static inline CRTTypeID
CRTGetTypeID(CRTReference r) {
  CRTAssertReference(r);
  return __CRT_CLASS(r)->id;
}

/**
 * Get the specified reference's class name.
 *
 * @param r The reference.
 * @return The corresponding class name.
 */
static inline CRTChar*
CRTGetClassName(CRTReference r) {
  CRTAssertReference(r);
  return __CRT_CLASS(r)->name;
}

#endif /* XTC_CORE_H */
