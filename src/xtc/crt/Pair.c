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

#include "Pair.h"
#include "Runtime.h"

static void CRTPairDestroy(CRTPair p) {
  CRTRelease(p->head);
  CRTRelease(p->tail);
}

CRTTypeID __CRTPairID = kCRTRegistrationError;

static CRTClass __CRTPairClass = {
  0,
  (CRTChar*)"Pair",
  0,
  (CRTDestroyFunction)CRTPairDestroy,
  0,
  0
};

CRTPair __CRTPairEmpty =
  &(struct __CRTPair) { { &__CRTPairClass, 2, 1 }, 0, 0 };

CRTPair
CRTPairCreate(CRTReference head, CRTPair tail) {
  CRTAssertReference(head);
  CRTAssertPair(tail);

  CRTPair p =
    CRTClassNewInstance(0, __CRTPairID, sizeof(struct __CRTPair));
  if (0 == p) return 0;

  CRTRetain(head);
  CRTRetain(tail);

  p->head = head;
  p->tail = tail;
  return p;
}

CRTIndex
CRTPairSize(CRTPair p) {
  CRTAssertPair(p);

  CRTIndex size = 0;
  while (p != __CRTPairEmpty) {
    size++;
    p = p->tail;
  }
  return size;
}

CRTPair
CRTPairReverse(CRTPair p) {
  CRTAssertPair(p);

  CRTPair forward  = p;
  CRTPair backward = __CRTPairEmpty;

  while (__CRTPairEmpty != forward) {
    CRTPair tmp    = backward;
    backward       = forward;
    forward        = forward->tail;
    backward->tail = tmp;
  }

  return backward;
}

void
CRTPairInit(void) {
  __CRTPairID = CRTClassRegister(&__CRTPairClass);
  CRTBeCautious(__CRTPairID != kCRTRegistrationError);
}
