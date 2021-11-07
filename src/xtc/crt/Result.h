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
#ifndef XTC_RESULT_H
#define XTC_RESULT_H

#include "Core.h"
#include "String.h"

/** The parser result type. */
typedef struct __CRTResult * CRTResult;

/** The parser value type. */
typedef struct __CRTValue * CRTValue;

/** The parser error type. */
typedef struct __CRTError * CRTError;

/** The private parser result layout. */
struct __CRTResult {
  CRTObjectHeader header;
  long index;
};

/** The private parser value layout. */
struct __CRTValue {
  CRTObjectHeader header;
  long index;
  CRTReference ref;
  CRTError err;
};

/** The private parser error layout. */
struct __CRTError {
  CRTObjectHeader header;
  long index;
  CRTString msg;
};

/** The private parser value id. */
extern CRTTypeID __CRTValueID;

/** The private parser error id. */
extern CRTTypeID __CRTErrorID;

/**
 * Get the type id for parser values.
 *
 * @return The type id for parser values.
 */
static inline CRTTypeID
CRTValueID(void) {
  return __CRTValueID;
}

/**
 * Get the type id for parser errors.
 *
 * @return The type id for parser errors.
 */
static inline CRTTypeID
CRTErrorID(void) {
  return __CRTErrorID;
}

/**
 * Paranoiacally assert that the specified pointer is a parser result.
 *
 * @param p The pointer.
 */
#define CRTAssertResult(p)                              \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTValueID()) ||     \
                CRTIsInstanceOf(p, CRTErrorID()))

/**
 * Paranoiacally assert that the specified pointer is a parser value.
 *
 * @param p The pointer.
 */
#define CRTAssertValue(p)                               \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTValueID()))   

/**
 * Paranoiacally assert that the specified pointer is a parser error.
 *
 * @param p The pointer.
 */
#define CRTAssertError(p)                       \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTErrorID()))

/**
 * Create a new parser value.
 *
 * @param index The index.
 * @param ref The actual value.
 * @param err The embedded error.
 * @return A new parser value.
 */
CRTValue CRTValueCreate(long index, CRTReference ref, CRTError err);

/** The private dummy error. */
extern CRTError __CRTErrorDummy;

/**
 * Get the canonical dummy error.
 *
 * @return The dummy error.
 */
static inline CRTError
CRTErrorDummy(void) {
  return __CRTErrorDummy;
}

/**
 * Create a new parser error.
 *
 * @param index The index.
 * @param msg The message.
 * @return A new parser error.
 */
CRTError CRTErrorCreate(long index, CRTString msg);

/**
 * Get the specified result's index.
 *
 * @param r The result.
 * @return The result's index.
 */
static inline long
CRTResultIndex(CRTResult r) {
  CRTAssertResult(r);
  return r->index;
}

/** The private parser value class. */
extern CRTClass __CRTValueClass;

/**
 * Determine whether the specified result has a value.
 *
 * @param r The result.
 * @return <code>true</code> if the result is a value.
 */
static inline bool
CRTResultHasValue(CRTResult r) {
  CRTAssertResult(r);
  return &__CRTValueClass == __CRT_CLASS(r);
}

/**
 * Determine whether the specified result has the specified string
 * value.
 *
 * @param r The result.
 * @return <code>true</code> if the result has the string value.
 */
static inline bool
CRTResultHasStringValue(CRTResult r, CRTString s) {
  CRTAssertResult(r);
  CRTAssertString(s);
  return CRTResultHasValue(r) && CRTEqual(((CRTValue)r)->ref, s);
}

/**
 * Get the parser value's actual value.
 *
 * @param val The parser value.
 * @return The actual value.
 */
static inline CRTReference
CRTValueGetRef(CRTValue v) {
  CRTAssertValue(v);
  return v->ref;
}

/**
 * Get the result's error.
 *
 * @param r The result.
 * @return The error.
 */
static inline CRTError
CRTResultGetError(CRTResult r) {
  CRTAssertResult(r);
  return CRTResultHasValue(r) ? ((CRTValue)r)->err : (CRTError)r;
}

/**
 * Select the parser value.  If the specified result is a parser value
 * with the specified actual value and error, this function returns
 * that parser value.  Otherwise, it returns a new parser value with
 * the result's index, the specified actual value, and the specified
 * embedded parser error.
 *
 * @param r The result.
 * @param ref The actual value.
 * @param err The embedded parser error.
 * @return A parser value for the actual value and error.
 */
CRTValue CRTResultSelectValue(CRTResult r, CRTReference ref, CRTError err);

/**
 * Select the more specific parser error.
 *
 * @param r The result.
 * @param err The error to compare to.
 * @return The more specific error.
 */
CRTError CRTResultSelectError(CRTResult r, CRTError err);

/**
 * Select the more specific parser error.
 *
 * @param err The parser error.
 * @param index The index to compare to.
 * @param msg The message.
 * @return The more specific error.
 */
CRTError CRTErrorSelect(CRTError err, long index, CRTString msg);

/** Initialize the value and error classes. */
void CRTResultInit(void);

#endif /* XTC_RESULT_H */
