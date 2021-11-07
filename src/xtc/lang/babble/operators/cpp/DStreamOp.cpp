#include "CQLOperators.h"

/**
 * - DStream operator:
 *  - no state variable, just drop the insertions and forward the deletions
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
BabbleReturn*
dstreamOp(BabbleBuffer inBuf, BabbleUInt32 port, void*)
{
  typedef BabbleTuple1(BabbleUInt32) BabbleTupleInputSchema;
  typedef BabbleTuple1(BabbleUInt32) BabbleTupleOutputSchema;
  typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
  typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
  typedef BabbleUInt32 BabbleCQLTauType; 

  assert(0 == port);
  BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
  BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);
  BabbleRead(inBuf, inDataItem);
  BabbleUInt32  ts = BabbleTupleGet(inDataItem,0);
  BabbleCQLInputSigmaType  inputDeletions = BabbleTupleGet(inDataItem,2);
  BabbleTupleSet(outDataItem, 0, ts);
  BabbleTupleSet(outDataItem, 2, inputDeletions);
  BabbleBuffer out = BabbleBufferNew();
  BabbleWrite(out, outDataItem);
  BabbleReturn* retval = BabbleReturnNew();
  BabbleList(BabbleQueueReturn) queues = BabbleListNew(BabbleQueueReturn);
  BabbleList(BabbleVariableReturn) variables = BabbleListNew(BabbleVariableReturn);
  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);
  retval->queues = queues;
  retval->variables = variables;
  return retval;
}
