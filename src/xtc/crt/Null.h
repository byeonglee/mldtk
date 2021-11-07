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
#ifndef XTC_NULL_H
#define XTC_NULL_H

#include "Core.h"

/** The private null id. */
extern CRTTypeID __CRTNullID;

/**
 * Get the type id for nulls.
 *
 * @return The type id for nulls.
 */
static inline CRTTypeID
CRTNullID(void) {
  return __CRTNullID;
}

/** The private null value. */
extern CRTReference __CRTNull;

/**
 * Get the canonical null value.
 *
 * @return The null value.
 */
static inline CRTReference
CRTNull(void) {
  return __CRTNull;
}

/**
 * Determine whether the specified reference is null.
 *
 * @param r The reference.
 * @return <code>true</code> if the reference is null.
 */
static inline bool
CRTIsNull(CRTReference r) {
  CRTAssertReference(r);

  return r == __CRTNull;
}

/** Initialize the null class. */
void CRTNullInit(void);

#endif /* XTC_NULL_H */
