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

#include "Result.h"
#include "Runtime.h"

static void CRTValueDestroy(CRTValue v) {
  CRTRelease(v->ref);
  CRTRelease(v->err);
}

CRTTypeID __CRTValueID = kCRTRegistrationError;

CRTClass __CRTValueClass = {
  0,
  (CRTChar*)"Value",
  0,
  (CRTDestroyFunction)CRTValueDestroy,
  0,
  0
};

static void CRTErrorDestroy(CRTError e) {
  CRTRelease(e->msg);
}

CRTTypeID __CRTErrorID = kCRTRegistrationError;

static CRTClass __CRTErrorClass = {
  0,
  (CRTChar*)"Error",
  0,
  (CRTDestroyFunction)CRTErrorDestroy,
  0,
  0
};

CRTError __CRTErrorDummy = &(struct __CRTError) { 
  { &__CRTErrorClass, 2, 1 },
  -1,
  CRTSTR("unknown error")
};

CRTValue
CRTValueCreate(long index, CRTReference ref, CRTError err) {
  CRTAssertReference(ref);
  CRTAssertError(err);

  CRTValue v =
    CRTClassNewInstance(0, __CRTValueID, sizeof(struct __CRTValue));
  if (0 == v) return 0;

  CRTRetain(ref);
  CRTRetain(err);

  v->index = index;
  v->ref   = ref;
  v->err   = err;
  return v;
}

CRTError
CRTErrorCreate(long index, CRTString msg) {
  CRTAssertString(msg);
  CRTBeSuspicious(0 <= index);

  CRTError e =
    CRTClassNewInstance(0, __CRTErrorID, sizeof(struct __CRTError));
  if (0 == e) return 0;

  CRTRetain(msg);

  e->index = index;
  e->msg   = msg;
  return e;
}

CRTValue
CRTResultSelectValue(CRTResult r, CRTReference ref, CRTError err) {
  CRTAssertResult(r);
  CRTAssertReference(ref);
  CRTAssertError(err);

  if (CRTResultHasValue(r)) {
    CRTValue v = (CRTValue)r;

    if ((v->ref == ref) && (v->err == err)) {
      return v;
    } else {
      return CRTValueCreate(v->index, ref, err);
    }
  } else {
    return CRTValueCreate(r->index, ref, err);
  }
}

CRTError
CRTResultSelectError(CRTResult r, CRTError err) {
  CRTAssertResult(r);
  CRTAssertError(err);

  CRTError re = CRTResultHasValue(r) ? ((CRTValue)r)->err : (CRTError)r;
  if (re->index < err->index) {
    return err;
  } else {
    return re;
  }
}

CRTError
CRTErrorSelect(CRTError err, long index, CRTString msg) {
  CRTAssertError(err);
  CRTAssertString(msg);

  if (err->index < index) {
    return CRTErrorCreate(index, msg);
  } else {
    return err;
  }
}

void
CRTResultInit(void) {
  __CRTValueID = CRTClassRegister(&__CRTValueClass);
  CRTBeCautious(__CRTValueID != kCRTRegistrationError);
  __CRTErrorID = CRTClassRegister(&__CRTErrorClass);
  CRTBeCautious(__CRTErrorID != kCRTRegistrationError);
}
