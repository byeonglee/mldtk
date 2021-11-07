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
#ifndef XTC_PAIR_H
#define XTC_PAIR_H

#include "Core.h"

/** The pair type. */
typedef struct __CRTPair * CRTPair;

/** The private pair layout. */
struct __CRTPair {
  CRTObjectHeader header;
  CRTReference head;
  CRTPair tail;
};

/** The private pair id. */
extern CRTTypeID __CRTPairID;

/**
 * Get the type id for pairs.
 *
 * @return The type id for pairs.
 */
static inline CRTTypeID
CRTPairID(void) {
  return __CRTPairID;
}

/**
 * Paranoiacally assert that the specified pointer is a pair.
 *
 * @param p The pointer.
 */
#define CRTAssertPair(p)                                \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTPairID()))

/** The private empty pair. */
extern CRTPair __CRTPairEmpty;

/**
 * Get the canonical empty pair.
 *
 * @return The empty pair.
 */
static inline CRTPair
CRTPairEmpty(void) {
  return __CRTPairEmpty;
}

/**
 * Create a new pair.
 *
 * @param head The head.
 * @param tail The tail.
 * @return A new pair with the head and tail.
 */
CRTPair CRTPairCreate(CRTReference head, CRTPair tail);

/**
 * Determine whether the specified pair is the empty pair.
 *
 * @param p The pair.
 * @return <code>true</code> if the pair is the empty pair.
 */
static inline bool
CRTPairIsEmpty(CRTPair p) {
  CRTAssertPair(p);

  return p == __CRTPairEmpty;
}

/**
 * Get the specified pair's head.
 *
 * @param p The pair.
 * @return The tail.
 */
static inline CRTReference
CRTPairGetHead(CRTPair p) {
  CRTAssertPair(p);
  CRTBeSuspicious(p != __CRTPairEmpty);

  return p->head;
}

/**
 * Get the specified pair's tail.
 *
 * @param p The pair.
 * @return The tail.
 */
static inline CRTPair
CRTPairGetTail(CRTPair p) {
  CRTAssertPair(p);
  CRTBeSuspicious(p != __CRTPairEmpty);

  return p->tail;
}

/**
 * Get the size of the list starting with the specified pair.
 *
 * @param p The pair.
 * @return The size.
 */
CRTIndex CRTPairSize(CRTPair p);

/**
 * Destructively reverse the list starting with the specified pair.
 *
 * @param p The pair.
 * @return The reversed list.
 */
CRTPair CRTPairReverse(CRTPair p);

/** Initialize the pair class. */
void CRTPairInit(void);

#endif /* XTC_PAIR_H */
