#ifndef _Submit_H_
#define _Submit_H_

#ifdef SIZEOF_PTR
#undef SIZEOF_PTR
#endif

extern "C" {
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>

void put(value ptr, value buffer, value port);

}

#endif
