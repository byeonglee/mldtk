#include "CQLOperators.h"

/*
 * - Aggregate operator with Sum, Count, Avg, Max
 *  - state variable keeps map from group-by key attributes to aggr. states
 *    (result of Sum/Count; numerator/denominator of Avg; sorted list of Max)
 *  - input "insert" adds to aggregation state, "delete" subtracts from
 *    aggregation state
 *  - "insert" for keys that are not in synopsis initializes with
 *    the neutral element (0 for Sum/Count, 0/0 for Avg, empty list for Max)
 *  - if any mapping returns to the neutral element, can remove it from map
 *  - output "delete" of old aggregated result and "insert" of new
 *    aggregated result, unless they cancel each other out
 *
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
BabbleReturn*
aggregateOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
{
  typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleInputSchema;
  typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleOutputSchema;
  typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
  typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) AggregateDataItemIn;
  typedef BabbleUInt32 BabbleCQLTauType;

  assert(0 == port);
  BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
  BabbleRead(inBuf, inDataItem);

  BabbleUInt32  ts = BabbleTupleGet(inDataItem,0);
  BabbleCQLInputSigmaType inserts = BabbleTupleGet(inDataItem,1);
  BabbleCQLInputSigmaType deletes = BabbleTupleGet(inDataItem,2);

  estd::hash_map< std::string, uint32_t > * aggState = 
    (estd::hash_map< std::string, uint32_t > * ) inVar;

  BabbleCQLOutputSigmaType outInserts =
    BabbleBagNew(BabbleTupleOutputSchema);
  BabbleIterator(BabbleCQLInputSigmaType) insertsIt;
  BabbleIteratorBegin(insertsIt, inserts);
  while(BabbleIteratorHasNext(insertsIt, inserts )) {
    BabbleTupleInputSchema tuple = 
      BabbleIteratorValue(BabbleTupleInputSchema, insertsIt);
    BabbleString8 ticker = BabbleTupleGet(tuple, 1);
    BabbleUInt32 price = BabbleTupleGet(tuple, 0);
    if (aggState->find(ticker) != aggState->end()) {
      (*aggState)[ticker] = (*aggState)[ticker] + price;
    } else {
      (*aggState)[ticker] = price;
    }
    BabbleTupleOutputSchema outTup = 
      BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleSet(outTup, 0, (*aggState)[ticker]);
    BabbleTupleSet(outTup, 1, ticker);
    BabbleBagAdd(outInserts, outTup);
    BabbleIteratorNext(insertsIt);
  }

  /* Now process the deletes */
  BabbleCQLOutputSigmaType outDeletes =
    BabbleBagNew(BabbleTupleOutputSchema);
  BabbleIterator(BabbleCQLInputSigmaType) deletesIt;
  BabbleIteratorBegin(deletesIt, deletes);
  while(BabbleIteratorHasNext(deletesIt, deletes )) {
    BabbleTupleInputSchema tuple = 
      BabbleIteratorValue(BabbleTupleInputSchema, deletesIt);
    BabbleString8 ticker = BabbleTupleGet(tuple, 1);
    BabbleUInt32 price = BabbleTupleGet(tuple, 0);
    if (aggState->find(ticker) != aggState->end()) {
      (*aggState)[ticker] = (*aggState)[ticker] + price;
    } else {
      (*aggState)[ticker] = price;
    }
    BabbleTupleOutputSchema outTup = 
      BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleSet(outTup, 0, (*aggState)[ticker]);
    BabbleTupleSet(outTup, 1, ticker);
    BabbleBagAdd(outDeletes, outTup);
    BabbleIteratorNext(deletesIt);
  }


  BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);

  BabbleTupleSet(outDataItem,0,ts);
  BabbleTupleSet(outDataItem,1,outInserts);
  BabbleTupleSet(outDataItem,2,outDeletes);

  BabbleBuffer out = BabbleBufferNew();
  BabbleWrite(out, outDataItem); 

  BabbleReturn* retval = BabbleReturnNew();
  BabbleList(BabbleQueueReturn) queues = BabbleListNew(BabbleQueueReturn);
  BabbleList(BabbleVariableReturn) variables = BabbleListNew(BabbleVariableReturn);
  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);

  BabbleVariableReturn* vr = BabbleVariableReturnNew;
  vr->var = inVar;
  vr->index = 0;

  retval->queues = queues;
  retval->variables = variables;
  return retval;

}

