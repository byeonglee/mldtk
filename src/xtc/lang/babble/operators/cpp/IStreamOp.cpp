#include "CQLOperators.h"

/* 
 * - type dataItem = tuple<timeStamp ts, bag<tuple> insert, bag<tuple> delete>
 *
 * - IStream operator:
 *  - no state variable, just drop the deletions and forward the insertions
 *  - as arasu_babu_widom_2006 point out on p. 137, that only works when
 *    there is no insertion and deletion that cancel each other out at the same
 *    timestamp, so we should establish this fact in the other operators
 * @param inBuf
 * @param port
 * @return buffer
 */
#define ISTREAM_TYPE1  BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType)
#define ISTREAM_TYPE2  BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) 
#define ISTREAM_TYPE3  BabbleList(BabbleQueueReturn)
#define ISTREAM_TYPE4  BabbleList(BabbleVariableReturn) 
#define ISTREAM_TYPE5  BabbleTuple1(BabbleUInt32) 
#define ISTREAM_TYPE6  BabbleTuple1(BabbleUInt32) 
#define ISTREAM_TYPE7  BabbleBag (BabbleTupleInputSchema) 
#define ISTREAM_TYPE8  BabbleBag (BabbleTupleOutputSchema)
BabbleReturn*
istreamOp(BabbleBuffer inBuf, BabbleUInt32 port)
{
  typedef ISTREAM_TYPE5 BabbleTupleInputSchema;
  typedef ISTREAM_TYPE6 BabbleTupleOutputSchema;
  typedef ISTREAM_TYPE7 BabbleCQLInputSigmaType;
  typedef ISTREAM_TYPE8 BabbleCQLOutputSigmaType;
  typedef BabbleUInt32 BabbleCQLTauType; 
  assert(0 == port);
  ISTREAM_TYPE1 inDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
  ISTREAM_TYPE2 outDataItem = 
    BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);
  BabbleRead(inBuf, inDataItem);
  BabbleUInt32  ts = BabbleTupleGet(inDataItem,0);
  BabbleCQLInputSigmaType  inputInsertions = BabbleTupleGet(inDataItem,1);
  BabbleTupleSet(outDataItem, 0, ts);
  BabbleTupleSet(outDataItem, 1, inputInsertions);
  BabbleBuffer out = BabbleBufferNew();
  BabbleWrite(out, outDataItem);
  BabbleReturn* retval = BabbleReturnNew();
  ISTREAM_TYPE3 queues = BabbleListNew(BabbleQueueReturn);
  ISTREAM_TYPE4 variables = BabbleListNew(BabbleVariableReturn);
  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);
  retval->queues = queues;
  retval->variables = variables;
  return retval;
}

