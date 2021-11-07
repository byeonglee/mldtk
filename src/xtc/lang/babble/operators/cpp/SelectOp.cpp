#include "CQLOperators.h"

/*
 * - Select operator:
 *  - assume a simple relation with just one integer attribute,
 *    old input relation { 1,2,3 }, selection condition (x <= 2),
 *    input insertions { 0,4 }, and input deletions { 2,3 }
 *  - that means the old output relation is { 1,2 },
 *    and the new output relation is { 0,1 },
 *    which means output insertions { 0 } and output deletions { 2 }
 *  - no state variable needed, just apply selection condition on
 *    insertions and deletions independently
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
// typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) SelectDataItemIn;
// typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) SelectDataItemOut;
#define SELECT_TYPEA              BabbleTuple1(BabbleUInt32) 
#define SELECT_CONDITION BabbleTupleGet(t,0) <= 1 
BabbleReturn*
selectOp(BabbleBuffer inBuf, BabbleUInt32 port)
{
  typedef SELECT_TYPEA BabbleTupleInputSchema;
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
  BabbleCQLInputSigmaType  inputInsertions = BabbleTupleGet(inDataItem,1);
  BabbleCQLInputSigmaType  inputDeletions = BabbleTupleGet(inDataItem,2);

  BabbleCQLOutputSigmaType outputInsertions =
    BabbleBagNew(BabbleTupleOutputSchema);
  BabbleCQLOutputSigmaType outputDeletions =
    BabbleBagNew(BabbleTupleOutputSchema);

  //MH: assert(no canceled pairs)

  BabbleIterator(BabbleCQLInputSigmaType) inputInsertionsIt;
  BabbleIteratorBegin(inputInsertionsIt, inputInsertions);
  while(BabbleIteratorHasNext(inputInsertionsIt, inputInsertions)) {
    SELECT_TYPEA t = BabbleIteratorValue(SELECT_TYPEA, inputInsertionsIt);
    if( SELECT_CONDITION ) {
      BabbleBagAdd(outputInsertions, t);
    }
    BabbleIteratorNext(inputInsertionsIt);
  }

  BabbleIterator(BabbleCQLInputSigmaType) inputDeletionsIt;
  BabbleIteratorBegin(inputDeletionsIt, inputDeletions);
  while(BabbleIteratorHasNext(inputDeletionsIt,inputDeletions)) {
    SELECT_TYPEA t = BabbleIteratorValue(SELECT_TYPEA, inputDeletionsIt);
    if( SELECT_CONDITION ) {
      BabbleBagAdd(outputDeletions, t);
    }
    BabbleIteratorNext(inputDeletionsIt);
  }

  BabbleBuffer out = BabbleBufferNew();
  BabbleTupleSet(outDataItem, 0, ts);
  BabbleTupleSet(outDataItem, 1, outputInsertions);
  BabbleTupleSet(outDataItem, 2, outputDeletions);
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

