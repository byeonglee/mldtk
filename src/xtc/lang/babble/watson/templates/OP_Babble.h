#ifndef _OP_Babble_H_
#define _OP_Babble_H_

#include "PE_Babble.h"

#include <DPS/PH/DpsPE.h>
#include <DPS/PH/DpsOP.h>

namespace DPS {

  class OP_Babble : public DpsOP 
  {
  public:
    OP_Babble(BabblePE & ppe, DpsOPContext & cx) 
      : DpsOP(ppe,cx), babblePE(ppe) { }
    //         {
    //             initializeOperator();
    //         }

    //       virtual ~OP_Babble();

    /*
     * Function used to process cmd arguments                         
     */
    virtual void processCmdArgs(const std::string & args) = 0;

    /*
     * Function used to initialize the operator
     */
    virtual void initializeOperator() = 0;

    /*
     * Function used to finalize the operator
     */
    virtual void finalizeOperator() = 0;

    /*
     * Function used to submit tuples
     */
    virtual void submit(uint32_t port, Distillery::SBuffer const & buf) = 0;

    /*
     * Functions used to process input tuples
     */
    virtual void process(uint32_t port, Distillery::SBuffer const & tuple) = 0;

    virtual void process() = 0;

    virtual void shutdown() = 0;

  protected:
    BabblePE & babblePE;
  };

};

#endif /* _OP_Babble_H_ */


