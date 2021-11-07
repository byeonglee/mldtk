
#include "Submit.h"
#include "OP_Babble.h"

using namespace DPS;
using namespace Distillery;

void put(value ptr, value port, value buffer) {
  OP_Babble * op = (OP_Babble*)Long_val(ptr);
  SBuffer outbuf;
  int32_t sz = caml_string_length(buffer);
  outbuf.addBlob((const void*)buffer, sz);
  op->submit(Int_val(port), outbuf);
}
