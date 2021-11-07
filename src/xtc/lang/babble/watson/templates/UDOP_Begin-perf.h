#ifndef _$classname_H_
#define _$classname_H_

#include "OP_Babble.h"
#include "PE_Babble.h"


#include <DPS/PH/DpsPE.h>
#include <DPS/PH/DpsOP.h>
#include <UTILS/Mutex.h>
#include <sys/time.h>


namespace DPS {

   class DataItem
    {
      public:
        uint32_t port;
        Distillery::SBuffer * buf;
        DataItem(uint32_t port, Distillery::SBuffer * buf) : port(port), buf(buf) {} 
    };

    class $classname : public OP_Babble
    {
    private:
      timeval firstTuple;
      timeval lastTuple;
      int numTuples;
      std::deque<DataItem*> outputBufferQ;
      int key;
      int numlocks;
      int totalLocks;
      int shmid;
      pthread_mutex_t * mutexes;

