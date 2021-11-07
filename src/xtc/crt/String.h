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
#ifndef XTC_STRING_H
#define XTC_STRING_H

#include "Core.h"
#include "Util.h"

/** The string type. */
typedef struct __CRTString * CRTString;

/** The private string layout. */
struct __CRTString {
  CRTObjectHeader header;
  CRTIndex size;
  CRTChar data[];
};

/** The private string constant layout. */
struct __CRTStringConstant {
  CRTObjectHeader header;
  CRTIndex size;
  CRTChar* data;
};

/** Macro to access a string's data. */
#define __CRT_STRING_DATA(s)                    \
  (CRTBitIsSet((s)->header.flags, 0) ?          \
   ((struct __CRTStringConstant*)(s))->data :   \
   (s)->data)

/** The private string class. */
extern CRTClass __CRTStringClass;

/** The private string id. */
extern CRTTypeID __CRTStringID;

/**
 * Get the type id for strings.
 *
 * @return The type id for strings.
 */
static inline CRTTypeID
CRTStringID(void) {
  return __CRTStringID;
}

/**
 * Paranoiacally assert that the specified pointer is a string.
 *
 * @param p The pointer.
 */
#define CRTAssertString(p)                              \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTStringID()))

/**
 * Create a compile-time constant string literal.
 *
 * @param s The C string literal.
 */
#define CRTSTR(s)                                                       \
  (CRTString)(& (struct __CRTStringConstant)                            \
    { { &__CRTStringClass, 2, 1 }, sizeof(s)-1, (CRTChar *)(s) })

/**
 * Create a string from the specified array.
 *
 * @param data The character data.
 * @param start The offset to the first character.
 * @param size The number of characters.
 * @return The corresponding string.
 */
CRTString CRTStringCreateFromArray(CRTChar data[],
                                   CRTIndex start, CRTIndex size);

/**
 * Convert the specified string to a C string.  Note that the returned
 * string should be treated as immutable.
 *
 * @param s The string.
 * @return The corresponding C string.
 */
static inline CRTChar*
CRTStringToCString(CRTString s) {
  CRTAssertString(s);

  return __CRT_STRING_DATA(s);
}

/**
 * Get the specified string's size.
 *
 * @param s The string.
 * @return Its size.
 */
static inline CRTIndex
CRTStringSize(CRTString s) {
  CRTAssertString(s);

  return s->size;
}

/**
 * Get the specified character from the specified string.
 *
 * @param s The string.
 * @param index The index.
 * @return The corresponding character.
 */
static inline CRTChar
CRTStringGetChar(CRTString s, CRTIndex index) {
  CRTAssertString(s);

  return __CRT_STRING_DATA(s)[index];
}

/** Initialize the string class. */
void CRTStringInit(void);

#endif /* XTC_STRING_H */
