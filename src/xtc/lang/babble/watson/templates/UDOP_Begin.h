#ifndef _$classname_H_
#define _$classname_H_

#include "OP_Babble.h"
#include "PE_Babble.h"


#include <DPS/PH/DpsPE.h>
#include <DPS/PH/DpsOP.h>
#include <UTILS/Mutex.h>
#include <deque>

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
      std::deque<DataItem*> outputBufferQ;
      int key;
      int numlocks;
      int shmid;
      int locking;
      pthread_mutex_t * mutexes;

