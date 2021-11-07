
#include "CQLOperators.h"

/*
 * - Union operator
 *  - need state variable that stores data items to wait for stragglers, but
 *    don't need to materialize the full input relations
 *  - data item arrives on one of the N input ports (N may be 2 or 3 or more)
 *  - for each "filled" time stamp, compute union of inserts and deletes at
 *    that time stamp, drop pairs that cancel each other out, send as output
 *  - drop the oldest (matched) remembered state
 *
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
#define UNION_TYPEA              BabbleTuple1(BabbleUInt32) 
BabbleReturn*
unionOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
{
  typedef UNION_TYPEA BabbleTupleInputSchema;
  typedef BabbleTuple1(BabbleUInt32) BabbleTupleOutputSchema;
  typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
  typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) UnionDataItemIn;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) UnionDataItemOut;
  typedef BabbleUInt32 BabbleCQLTauType; 

  BabbleReturn* retval = BabbleReturnNew();
  BabbleList(BabbleQueueReturn) queues = BabbleListNew(BabbleQueueReturn);
  BabbleList(BabbleVariableReturn) variables = BabbleListNew(BabbleVariableReturn);

  BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
  BabbleRead(inBuf, inDataItem);

  BabbleList(BabbleList(UnionDataItemIn))* stateptr = BabbleCastPtr(BabbleList(BabbleList(UnionDataItemIn)), inVar);
  BabbleList(BabbleList(UnionDataItemIn)) state = *stateptr;

  BabbleList(UnionDataItemIn) inputQueueList = BabbleListAt((*stateptr), port);
  BabbleListPushBack(inputQueueList, inDataItem);
  BabbleListAt((*stateptr), port) = inputQueueList;

  BabbleCQLTauType ts = BabbleTupleGet(inDataItem, 0);

  bool tetris = true;

  BabbleIterator(BabbleList(BabbleList(UnionDataItemIn))) it;
  BabbleIteratorBegin(it, (*stateptr));
  while(BabbleIteratorHasNext(it, (*stateptr))) {
    BabbleList(UnionDataItemIn) inputBuffer = *it;
    if (BabbleListEmpty(inputBuffer)) {
      tetris = false;
      break;
    } else {
      UnionDataItemIn top = BabbleListAt(inputBuffer,0);
      BabbleCQLTauType tsTop = BabbleTupleGet(top, 0);
      if (tsTop != ts) {
        tetris = false;
      }
    }
    BabbleIteratorNext(it);
  }

  if (!tetris) {
    BabbleVariableReturn* vr = BabbleVariableReturnNew;
    vr->var = (void*)stateptr;
    vr->index = 0;
    BabbleListPushBack(variables, *vr);    
    retval->queues = queues;
    retval->variables = variables;
    return retval;
  } 

  BabbleCQLOutputSigmaType outputInsertions =
    BabbleBagNew(BabbleTupleOutputSchema);
  BabbleCQLOutputSigmaType outputDeletions =
    BabbleBagNew(BabbleTupleOutputSchema);

  BabbleIteratorBegin(it, (*stateptr));
  while(BabbleIteratorHasNext(it, (*stateptr))) {
    BabbleList(UnionDataItemIn) inputBuffer = *it;
    UnionDataItemIn top = BabbleListAt(inputBuffer,0);
    BabbleCQLInputSigmaType inserts = BabbleTupleGet(top, 1);
    BabbleCQLInputSigmaType deletes = BabbleTupleGet(top, 2);
    
    BabbleIterator(BabbleCQLInputSigmaType) insertsIt;
    BabbleIteratorBegin(insertsIt, inserts);
    while(BabbleIteratorHasNext(insertsIt, inserts)) {
      UNION_TYPEA t = BabbleIteratorValue(UNION_TYPEA, insertsIt);
      BabbleBagAdd(outputInsertions, t);
      BabbleIteratorNext(insertsIt);
    }

    BabbleIterator(BabbleCQLInputSigmaType) deletesIt;
    BabbleIteratorBegin(deletesIt, deletes);
    while(BabbleIteratorHasNext(deletesIt,deletes)) {
      UNION_TYPEA t = BabbleIteratorValue(UNION_TYPEA, deletesIt);
      BabbleBagAdd(outputDeletions, t);
      BabbleIteratorNext(deletesIt);
    }
    
    BabbleListPopFront(inputBuffer);
    BabbleIteratorNext(it);
  }

  /*
    { tau , sigma , sigma }
    array of lists of data items
  */

  BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);
  BabbleTupleSet(outDataItem,0,ts);
  BabbleTupleSet(outDataItem,1,outputInsertions);
  BabbleTupleSet(outDataItem,2,outputDeletions);

  BabbleBuffer  out = BabbleBufferNew();
  BabbleWrite(out, outDataItem);  

  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);

  BabbleVariableReturn* vr = BabbleVariableReturnNew;
  vr->var = (void*)stateptr;
  vr->index = 0;
  BabbleListPushBack(variables, *vr);

  retval->queues = queues;
  retval->variables = variables;
  return retval;

}

