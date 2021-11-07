#include "CQLOperators.h"

#define DEBUG 1

/*
 *
 * q2, v <- Now[$Schema: tuple<int32>](q1, v)
 *
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */

//BabbleBuffer //MH: return type should be struct{ list{ list{ sbuffer } },
//             //list{void*} }
BabbleReturn*
nowOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
{
  typedef BabbleTuple2(BabbleUInt32, BabbleUInt32) BabbleTupleSchema;
  typedef BabbleBag (BabbleTupleSchema) BabbleCQLSigmaType;
  typedef BabbleUInt32 BabbleCQLTauType;
  typedef BabbleTuple3(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemIn;
  typedef BabbleTuple3(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemOut;


  /* problem : in C, all variables must be declared at the top of the
     function. References can't be declared like that. */
  if (DEBUG) cout << "nowOp" << endl;
  assert(0 == port);
  BabbleTuple3(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType) inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);

  BabbleRead(inBuf, inDataItem);
  BabbleUInt32  ts = BabbleTupleGet(inDataItem,0);
  BabbleCQLSigmaType  newInserts = BabbleTupleGet(inDataItem,1);
  //BabbleCQLSigmaType  newDeletes = BabbleTupleGet(inDataItem,2);

  //bool isEmpty = BabbleBagEmpty(newDeletes);
  //assert(isEmpty);

  /* problem : We have a BabbleCast to remove the reference, and avoid a deep
     copy */
  BabbleCQLSigmaType oldInserts = BabbleCast(BabbleCQLSigmaType, inVar);
  
  BabbleBag(BabbleTupleSchema) outInserts = BabbleBagNew(BabbleTupleSchema);
  BabbleBag(BabbleTupleSchema) outDeletes = BabbleBagNew(BabbleTupleSchema);
  BabbleIterator(BabbleCQLSigmaType) it;
  BabbleIteratorBegin(it, newInserts);
  while(BabbleIteratorHasNext(it, newInserts)) {
    if (!(BabbleBagContains(oldInserts, *it)))
      BabbleBagAdd(outInserts, *it);
    BabbleIteratorNext(it);
  }
  BabbleIterator(BabbleCQLSigmaType) oldInsertsIt;
  BabbleIteratorBegin(oldInsertsIt, oldInserts);
  while(BabbleIteratorHasNext(oldInsertsIt,oldInserts)) {
    if (!(BabbleBagContains(newInserts, *it)))
      BabbleBagAdd(outDeletes, *oldInsertsIt);
    BabbleIteratorNext(oldInsertsIt);
  }
  BabbleTuple3(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType) outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);
  BabbleTupleSet(outDataItem,0,ts);
  BabbleTupleSet(outDataItem,1,outInserts);
  BabbleTupleSet(outDataItem,2,outDeletes);
  BabbleBuffer  out = BabbleBufferNew();
  BabbleWrite(out, outDataItem);  //data item for output queue
  //BabbleWrite(out, newInserts);   //data item for output variable
  BabbleBagDelete(outInserts);
  BabbleBagDelete(outDeletes); 
  BabbleTuple3Delete(inDataItem);
  BabbleTuple3Delete(outDataItem);
  /* problem : caller must delete out */
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

