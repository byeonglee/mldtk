#include <getopt.h>
#include <PECAgent/PEContext.h>
#include <UTILS/ArgContainer.h>
#include <fstream>

#include "$udopname.h"

extern "C" {
#ifdef SIZEOF_PTR
#undef SIZEOF_PTR
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>
#endif
}


using namespace SPC;
using namespace DPS;
using namespace std;
using namespace estd;
using namespace Distillery;

void $udopname::initializeOperator()
{
}


void $udopname::finalizeOperator()
{
}

void $udopname::processCmdArgs(const string & args)
{
  if (args.empty()) {
    return;
  }
  // processing runtime switches
  struct option longOptions[] = {
    {"input-uri", 1, 0, 0},
    {0, 0, 0, 0}
  };
  ArgContainer arg(args);
  int c, oindex=0;
  while ((c=getopt_long(arg.argc,arg.argv,"f:",longOptions,&oindex))!=-1) {
    if (c<0)
      THROW(DpsOp,"invalid switch found in command line '" << args << "'" );
    if (optarg)
      SPCDBG(L_INFO,"configuration switch '" << longOptions[oindex].name << "' with value '" << optarg << "' was found","dpsop");
    else
      SPCDBG(L_INFO,"configuration switch '" << longOptions[oindex].name << "' was found","dpsop");
    switch(oindex) {
      case 0:
        fileName=string(optarg);
        break;
      default:
        THROW(DpsOp,"invalid switch found");
    }
  }
}

void $udopname::process()
{
  /* only defined for Source operators */
}

void $udopname::process(uint32_t port, const SBuffer & buf)
{
  $lock
  SPCDBG(L_DEBUG, "Brooklet Rocks! Processing tuple from input port 0", "dpsop");
  // Begin OCaml section
  static bool first = true;
  if(first) {
    first = false;
    pid_t p = getpid();
    ofstream stats;
    std::ostringstream strs;
    strs << p ; 
    char* argv[4];
    argv[0] = "test";
    argv[1] = "$name";
    argv[2] = (char*)strs.str().c_str();
    argv[3] = NULL;
    caml_startup (argv) ;
  }
  CAMLparam0();
  CAMLlocal3(func, in, ptr);
  uint32_t size;
  unsigned char * data;
  data = const_cast<SBuffer&>(buf).getBlob(size);
  in = caml_alloc_string (size);
  ptr = Val_long(this);
  memmove(String_val(in), data, size);
  func = *(caml_named_value("$functionname"));
  caml_callback2(func, ptr, in);
  SPCDBG(L_DEBUG, "Call to OCaml return successfully!", "dpsop");
  assert(caml__frame == NULL || caml__frame != NULL);
  CAMLreturn0;
}

void $udopname::shutdown() 
{
  CAMLparam0();
  CAMLlocal2(func, ptr);
  ptr = Val_long(this);
  func = caml_named_value("$shutdown");
  SPCDBG(L_DEBUG, "Call to OCaml shutdown succeeded!", "dpsop");
  caml_callback(func, ptr);
  assert(caml__frame == NULL || caml__frame != NULL);
  CAMLreturn0;
}
