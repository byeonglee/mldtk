#ifndef _UDOP_f2_H_
#define _UDOP_f2_H_

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

    class UDOP_f2 : public OP_Babble
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

      pthread_mutex_t * s1; 
    public:
        UDOP_f2(BabblePE & ppe, DpsOPContext & cx) 
          : OP_Babble(ppe,cx)
        {
            initializeOperator();
        }

        virtual ~UDOP_f2() 
        {
            finalizeOperator();
        }

        /*
         * Function used to process cmd arguments                         
         */
        void processCmdArgs(const std::string & args);

        /*
         * Function used to initialize the operator
         */
        void initializeOperator();

        /*
         * Function used to finalize the operator
         */
        void finalizeOperator();

        /*
         * Function used to submit tuples
         */
        void submit(uint32_t port, Distillery::SBuffer const & buf)
        {
            outputBufferQ.push_back(new DataItem(port, new Distillery::SBuffer(buf)));
        }


        /*
         * Function used to submit tuples
         */
        void submitAll()
        {
          while (!outputBufferQ.empty()) {
             DataItem* di = outputBufferQ.front();
             babblePE.submit(di->port, *di->buf);
             outputBufferQ.pop_front();
             delete di;
          }
        }


        /*
         * Functions used to process input tuples
         */
        void process(uint32_t port, Distillery::SBuffer const & tuple);

        void process();

        /* this variable holds the input/output file name for a source/sink */
        std::string fileName;

        void shutdown();

    };

};

#endif /* _UDOP_f2_H_ */


