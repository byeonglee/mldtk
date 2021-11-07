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
  
  CAMLprim value init_shm(value key);  
  CAMLprim value write_shm( value key, value data );
  CAMLprim value read_shm( value key );
}

#endif
