#include <getopt.h>
#include <PECAgent/PEContext.h>
#include <UTILS/ArgContainer.h>
#include <UTILS/Mutex.h>
#include <fstream>
#include <sys/shm.h>
#include <pthread.h>
#include "BIOP_q1Source.h"

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

void BIOP_q1Source::initializeOperator()
{

  master = 1;
  totalLocks = 100;
  if (master == 1) {
    pthread_mutexattr_t attr;
    key = 1977;
    int ret = 0;
    size_t size = totalLocks * sizeof(pthread_mutex_t);

    if ((shmid = shmget( key, size, IPC_CREAT | 0666)) < 0) {
      perror("create_n_locks::shmget");
      exit(1);
    }  
    
    if ((mutexes = (pthread_mutex_t*)shmat(shmid, NULL, 0)) == (pthread_mutex_t *) -1) {
      perror("create_n_locks::shmat");
      exit(1);
    } 
    
    ret = pthread_mutexattr_init(&attr);
    if (ret) {
      perror("create_n_locks::pthread_mutexattr_init");
      printf("error is %d\n", ret);
      exit(1);      
    }
    
    ret = pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    if (ret) {
      perror("pthread_mutexattr_setpshared");
      printf("error is  %d\n", ret);
      exit(1);      
    }
    pthread_mutex_t * ptr =  mutexes;
    int i;
    for (i = 0; i < totalLocks; i++) {
      pthread_mutex_init(ptr, &attr);  
      ptr++;
    }
  }

}


void BIOP_q1Source::finalizeOperator()
{

  if (master > 0) {
    shmctl(shmid, IPC_RMID, NULL); 
  }

}

void BIOP_q1Source::processCmdArgs(const string & args)
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

void BIOP_q1Source::process()
{
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
    argv[1] = "q1";
    argv[2] = (char*)strs.str().c_str();
    argv[3] = NULL;
    caml_startup (argv) ;
  }  
  CAMLparam0();
  CAMLlocal3(func, port, ptr);
  func = *(caml_named_value("ocaml_wrap_q1"));
  port = Val_int(0);
  ptr = Val_long(this);

  caml_callback2(func, ptr, port);
  SPCDBG(L_DEBUG, "Call to OCaml returned successfully!", "dpsop");
  assert(caml__frame == NULL || caml__frame != NULL);  
  CAMLreturn0;

}

void BIOP_q1Source::process(uint32_t port, const SBuffer & buf)
{

}

void BIOP_q1Source::shutdown() 
{

}
