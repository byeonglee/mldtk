#ifndef _BIOP_q1Source_H_
#define _BIOP_q1Source_H_

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

    class BIOP_q1Source : public OP_Babble
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
      int master;
      pthread_mutex_t * mutexes;

    public:
        BIOP_q1Source(BabblePE & ppe, DpsOPContext & cx) 
          : OP_Babble(ppe,cx)
        {
            initializeOperator();
        }

        virtual ~BIOP_q1Source() 
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
           babblePE.submit(port, buf);
        }


        /*
         * Function used to submit tuples
         */
        void submitAll()
        {
          /* No-op in the non-locking case */
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

#endif /* _BIOP_q1Source_H_ */


