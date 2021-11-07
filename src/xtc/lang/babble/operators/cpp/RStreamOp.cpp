#include "CQLOperators.h"

/**
 * - RStream operator:
 *  - state variable materializes the entire relation
 *  - the input has empty "delete" bag, because it's a stream //MH: no, input is relation, may have deletions
 *  - for each "insert" tuple in the input, if already in synopsis, mark;
 *    else, add and create output "insert"; for each unmarked, remove and
 *    create output "delete"
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
BabbleReturn*
rstreamOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
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

  //   //MH: begin new pseudo-code
  //   /* 
  //   BabbleCQLSigmaType relation = *static_cast<BabbleCQLSigmaType*>(inVar);
  //   for each (tuple in inputInserts)
  //       add(tuple, relation);
  //   for each (tuple in inputDeletes)
  //       remove(tuple, relation);
  //   RStreamDataItemIn outDataItem;
  //   BabbleTupleSet(outDataItem, 0, ts);
  //   BabbleTupleSet(outDataItem, 1, relation);
  //   */
  //   /* don't need to set deletions, they are empty */
  //   //MH: end new pseudo-code


  BabbleTupleSet(outDataItem, 0, ts);
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


