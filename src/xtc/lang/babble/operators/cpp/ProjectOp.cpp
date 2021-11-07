
#include "CQLOperators.h"

/*
 * q2 <- Project[$OutSchema: tuple<int32, int32>;
 *  $InSchema: tuple<int32, int32>;
 *  $Assignments: outTup.0 = inTup.1 + 3; outTup.1 = inTup.0]
 *  (q1)
 *
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
#define OUTPUT_SCHEMA_NEW  BabbleTuple1New(BabbleUInt32)
#define ASSIGNMENT         BabbleTupleSet(outTup, 0, BabbleTupleGet(inTup, 0) + 100);
#define TYPEA              BabbleTuple2(BabbleUInt32, BabbleUInt32) 
#define TYPEB              BabbleTuple1(BabbleUInt32) 
#define TYPEC              BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) 
#define TYPED              BabbleIterator(BabbleCQLInputSigmaType) 
#define TYPEE              BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType)
#define TYPEF              BabbleBag (BabbleTupleInputSchema) 
#define TYPEG              BabbleBag (BabbleTupleOutputSchema) 
#define TYPEH              BabbleList(BabbleQueueReturn) 
#define TYPEI              BabbleList(BabbleVariableReturn)
BabbleReturn*
projectOp(BabbleBuffer inBuf, BabbleUInt32 port)
{
  typedef TYPEA BabbleTupleInputSchema;
  typedef TYPEB BabbleTupleOutputSchema;
  typedef TYPEF BabbleCQLInputSigmaType;
  typedef TYPEG BabbleCQLOutputSigmaType;
  typedef BabbleUInt32 BabbleCQLTauType;

  assert(0 == port);
  TYPEC inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);

  BabbleRead(inBuf, inDataItem);
  BabbleUInt32  ts = BabbleTupleGet(inDataItem,0);
  BabbleCQLInputSigmaType  inDataItem1 = BabbleTupleGet(inDataItem,1);
  BabbleCQLInputSigmaType  inDataItem2 = BabbleTupleGet(inDataItem,2);

  BabbleCQLOutputSigmaType outDataItem1 =
    BabbleBagNew(BabbleTupleOutputSchema);

  TYPED inDataItem1It;
  BabbleIteratorBegin(inDataItem1It, inDataItem1);
  while(BabbleIteratorHasNext(inDataItem1It, inDataItem1 )) {
    TYPEA inTup = BabbleIteratorValue(TYPEA, inDataItem1It);
    // $OutSchema outTup;
    /* Here is the first code we need to generate */
    /* We need to be able to 'new' a tuple of the output schema */
    BabbleTupleOutputSchema outTup = OUTPUT_SCHEMA_NEW;

    // $Assignments;
    /* Here is the next part of code that we need to generate */
    /* This code performs an arbitrary assignemt to the output tuple */
    /* It might be accessing the input tuple. Here is an example */
    //BabbleTupleSet(outTup, 0, BabbleTupleGet(inTup, 0) + 100);
    ASSIGNMENT
    // outDataItem.1.add(outTup);
    BabbleBagAdd(outDataItem1, outTup);
    BabbleIteratorNext(inDataItem1It);
  }

  TYPED inDataItem2It;
  BabbleIteratorBegin(inDataItem2It, inDataItem2);
  while(BabbleIteratorHasNext(inDataItem2It,inDataItem2)) {
    TYPEA inTup = BabbleIteratorValue(TYPEA, inDataItem2It);
    BabbleTupleOutputSchema outTup = OUTPUT_SCHEMA_NEW;
    ASSIGNMENT
      BabbleBagAdd(outDataItem1, outTup);
    BabbleIteratorNext(inDataItem2It);
  }

  TYPEE outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);

  BabbleTupleSet(outDataItem,0,ts);
  BabbleTupleSet(outDataItem,1,outDataItem1);

  BabbleBuffer out = BabbleBufferNew();
  BabbleWrite(out, outDataItem); 

  BabbleReturn* retval = BabbleReturnNew();
  TYPEH queues = BabbleListNew(BabbleQueueReturn);
  TYPEI variables = BabbleListNew(BabbleVariableReturn);
  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);
  retval->queues = queues;
  retval->variables = variables;
  return retval;
}

