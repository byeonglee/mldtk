#include <getopt.h>
#include <PECAgent/PEContext.h>
#include <UTILS/ArgContainer.h>
#include <UTILS/Mutex.h>
#include <fstream>
#include <sys/shm.h>
#include <pthread.h>

#include "UDOP_f2.h"

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

typedef std::numeric_limits< double > dbl;


void UDOP_f2::initializeOperator()
{
  numTuples = 0;

  numlocks = 1;
  totalLocks = 100;
  if (numlocks > 0) {
    key = 1977;
    size_t size = totalLocks * sizeof(pthread_mutex_t);
    while ((shmid = shmget(key, size, 0666)) <= 0); 
    if ((mutexes = (pthread_mutex_t*)shmat(shmid, NULL, 0)) == (pthread_mutex_t *) -1) {
      perror("do_something::shmat");
      exit(1);
    }
    
  }

}


void UDOP_f2::finalizeOperator()
{
    shmdt((void*)mutexes);
}

void UDOP_f2::processCmdArgs(const string & args)
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

void UDOP_f2::process()
{
  /* only defined for Source operators */
}

void UDOP_f2::process(uint32_t port, const SBuffer & buf)
{
  stringstream msg;
  msg << "Brooklet Rocks! Processing tuple from input port " << port ;
  SPCDBG(L_DEBUG, msg.str(), "dpsop");

  numTuples++;
  if (numTuples == 1) {
    gettimeofday(&firstTuple, NULL);
  }
  gettimeofday(&lastTuple, NULL);

  SPCDBG(L_DEBUG, "Brooklet/OCaml processing tuple " << numTuples, "dpsop");

  // Begin OCaml section
  static bool first = true;

  if(first) {
    pid_t p = getpid();
    ofstream stats;
    std::ostringstream strs;
    strs << p ;
    char* argv[4];
    argv[0] = "test";
    argv[1] = "ocaml_wrap_f2";
    argv[2] = (char*)strs.str().c_str();
    argv[3] = NULL;
    first = false;
    caml_startup (argv) ;
  }

  pthread_mutex_t * mptr =  mutexes;
  int i;
  for (i = 0; i < totalLocks; i++) {
    pthread_mutex_lock(mptr);
    mptr++;
  }


  CAMLparam0();  
  
  CAMLlocal4(func, in, caml_port, ptr);

  uint32_t size;
  unsigned char * data;
  data = const_cast<SBuffer&>(buf).getBlob(size);
  in = caml_alloc_string (size);
  caml_port = Val_int(port);
  ptr = Val_long(this);
  memmove(String_val(in), data, size);
  func = *(caml_named_value("ocaml_wrap_f2"));
  caml_callback3(func, ptr,  caml_port, in);
  SPCDBG(L_DEBUG, "Call to OCaml return successfully!", "dpsop");
  assert(caml__frame == NULL || caml__frame != NULL);    

  mptr = mutexes + totalLocks - 1;
  for (i = 0; i < totalLocks; i++) {
    pthread_mutex_unlock(mptr);
    mptr--;
  }

  
  submitAll();
  CAMLreturn0;
}

void UDOP_f2::shutdown() 
{
  CAMLparam0();
  CAMLlocal2(func, ptr);
  ptr = Val_long(this);
  func = *(caml_named_value("f2_shutdown"));
  caml_callback(func, ptr);
  SPCDBG(L_DEBUG, "Call to OCaml return successfully!", "dpsop");

  assert(caml__frame == NULL || caml__frame != NULL);

  pid_t p = getpid();
  ofstream stats;
  std::ostringstream strs;
  strs << "/tmp/stats-UDOP_f2-" << p  << ".txt";
  stats.open (strs.str().c_str());
  cout.precision(dbl::digits10);
  double t1=firstTuple.tv_sec+(firstTuple.tv_usec/1000000.0);
  double t2=lastTuple.tv_sec+(lastTuple.tv_usec/1000000.0);

  stats << "Number of tuples: " << numTuples << endl;
  stats << "First tuple: " << fixed << t1 << " seconds \n";
  stats << "Last tuple: " << fixed << t2 << " seconds \n";
  stats << "Difference: " << fixed << t2-t1 << " seconds \n";
  stats.close();

  CAMLreturn0;

}
