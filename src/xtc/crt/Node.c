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

#include "Node.h"
#include "Runtime.h"

static void CRTNodeDestroy(CRTNode n) {
  CRTRelease(n->name);
  for (int i=0; i<n->size; i++) {
    CRTRelease(n->children[i]);
  }
}

static CRTHashCode CRTNodeHash(CRTNode n) {
  return CRTHash(n->name);
}

static bool CRTNodeEqual(CRTNode n1, CRTNode n2) {
  if (! CRTEqual(n1->name, n2->name)) return false;
  if (n1->size != n2->size) return false;
  for (int i=0; i<n1->size; i++) {
    if (! CRTEqual(n1->children[i], n2->children[i])) return false;
  }
  return true;
}

CRTTypeID __CRTNodeID = kCRTRegistrationError;

CRTClass __CRTNodeClass = {
  0,
  (CRTChar*)"Node",
  0,
  (CRTDestroyFunction)CRTNodeDestroy,
  (CRTHashFunction)CRTNodeHash,
  (CRTEqualFunction)CRTNodeEqual
};

CRTNode
CRTNodeCreate(CRTString name, CRTIndex capacity) {
  CRTAssertString(name);
  CRTBeSuspicious(0 <= capacity);

  CRTIndex size = sizeof(struct __CRTNode) + capacity * sizeof(CRTReference);
  CRTNode  n    = CRTClassNewInstance(0, __CRTNodeID, size);
  if (0 == n) return 0;

  CRTRetain(name);
  n->name     = name;
  n->file     = 0;
  n->line     = 0;
  n->column   = 0;
  n->capacity = capacity;
  n->size     = 0;
  return n;
}

CRTNode
CRTNodeAdd(CRTNode n, CRTReference r) {
  CRTAssertNode(n);
  CRTAssertReference(r);
  CRTBeSuspicious(n->size < n->capacity);

  CRTRetain(r);
  n->children[n->size++] = r;
  return n;
}

CRTNode
CRTNodeAddAll(CRTNode n, CRTPair p) {
  CRTAssertNode(n);
  CRTAssertPair(p);
  CRTBeSuspicious(n->size + CRTPairSize(p) <= n->capacity);

  while (! CRTPairIsEmpty(p)) {
    n->children[n->size++] = CRTRetain(CRTPairGetHead(p));
    p = CRTPairGetTail(p);
  }

  return n;
}

void
CRTNodeInit(void) {
  __CRTNodeID = CRTClassRegister(&__CRTNodeClass);
  CRTBeCautious(__CRTNodeID != kCRTRegistrationError);
}
