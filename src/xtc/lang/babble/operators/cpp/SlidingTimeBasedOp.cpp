#include "CQLOperators.h"

/**
 * - Time-based sliding window operator:
 *  - add new tuples to front of state variable with time stamp,
 *    and emit "insert"
 *  - remove expired tuples from end of state variable, and emit "delete"
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
#define WINDOW_SIZE 2  //MH: change to macro parameter
#define WINDOW_CONDITION 1 < 2
BabbleReturn*
slidingTimeBasedOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
{
  typedef BabbleTuple1(BabbleUInt32) BabbleTupleInputSchema;
  typedef BabbleTuple1(BabbleUInt32) BabbleTupleOutputSchema;
  typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
  typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) SlidingTimeBasedDataItemIn;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) SlidingTimeBasedDataItemOut;
  typedef BabbleUInt32 BabbleCQLTauType; 

  BabbleReturn* retval = BabbleReturnNew();
  BabbleList(BabbleQueueReturn) queues = BabbleListNew(BabbleQueueReturn);
  BabbleList(BabbleVariableReturn) variables = BabbleListNew(BabbleVariableReturn);

  BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
  BabbleRead(inBuf, inDataItem);

  BabbleList(BabbleList(SlidingTimeBasedDataItemIn))* stateptr = BabbleCastPtr(BabbleList(BabbleList(SlidingTimeBasedDataItemIn)), inVar);
  BabbleList(BabbleList(SlidingTimeBasedDataItemIn)) state = *stateptr;

  //   assert(isEmpty);
  //   BabbleCQLSigmaType window = *static_cast<BabbleCQLSigmaType*>(inVar);
  //   //MH: should be: linked list of <timestamp, sigma> pairs
  //   //MH: copy input timestamp to output timestamp
  //   //MH: copy input insertions to output insertions
  //   //MH: push input insertions to state variable
  //   //MH: while oldest timestamp < current timestamp - window size:
  //   //MH:   pop oldest insertions from state variable, and copy them to output deletions
  //   //MH: weed out cancellations between output insertions and output deletions
  return retval;
}

