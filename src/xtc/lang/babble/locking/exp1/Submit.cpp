#include "Submit.h"
#include "OP_Babble.h"
#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <caml/mlvalues.h>

using namespace DPS;
using namespace Distillery;

void put(value ptr, value port, value buffer) {
  OP_Babble * op = (OP_Babble*)Long_val(ptr);
  SBuffer outbuf;
  int32_t sz = caml_string_length(buffer);
  outbuf.addBlob((const void*)buffer, sz);
  op->submit(Int_val(port), outbuf);
}

static int initialized = 0;
#define SHMSZ     32

CAMLprim value
init_shm(value key) 
{
  key_t k;
  int shmid;  
  char* shm;
  k = Int_val(key);
  if (initialized == 0) {
    /* create the segment */
    if ((shmid = shmget(key, SHMSZ, IPC_CREAT | 0666)) < 0) {
      perror("shmget");
      exit(1);
    }
    /*attach the segment to our data space */
    if ((shm = (char*)shmat(shmid, NULL, 0)) == (char *) -1) {
      perror("shmat");
      exit(1);
    }
    /* write initial value 0 to the memory */
    sprintf(shm, "%d", 0);
    initialized = 1;
  }
  return Val_unit;
}

CAMLprim value
delete_shm(value key) 
{
  key_t k;
  int shmid;  
  k = Int_val(key);
  if ((shmid = shmget(key, SHMSZ, 0666)) < 0) {
    perror("shmget");
    exit(1);
  }
  shmctl(shmid, IPC_RMID, NULL);
  return Val_unit;
}


CAMLprim value
write_shm( value key, value data )
{
    int i;
    key_t k;
    int shmid;
    char* shm;
    k = Int_val(key);
    i = Int_val(data);

    /* locate the segment */
    if ((shmid = shmget(key, SHMSZ, 0666)) < 0) {
      perror("shmget");
      exit(1);
    }

    /*attach the segment to our data space */
    if ((shm = (char*)shmat(shmid, NULL, 0)) == (char *) -1) {
      perror("shmat");
      exit(1);
    }

    printf("%d\n", i);

    /* write to the memory */
    sprintf(shm, "%d", i);

    /* detach from the segment to our data space */
    if (-1 ==shmdt(shm)) {
      perror("shmdt");
      exit(1);
    }
      
    return Val_unit;
}

CAMLprim value
read_shm( value key )
{
  key_t k;
  int shmid;
  char* shm;
  int v;

  k = Int_val(key);

  /* locate the segment */
  if ((shmid = shmget(key, SHMSZ, 0666)) < 0) {
    perror("shmget");
    exit(1);
  }
  
  /*attach the segment to our data space */
  if ((shm = (char*)shmat(shmid, NULL, 0)) == (char *) -1) {
    perror("shmat");
    exit(1);
  }

  v = atoi(shm);

  /* detach from the segment to our data space */
  if (-1 == shmdt(shm)) {
    perror("shmdt");
    exit(1);
  }
  return Val_int(v);
}
