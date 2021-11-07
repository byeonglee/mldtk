#include "CQLOperators.h"

/*
 * - Join operator:
 *  - overview
 *    - data item arrives on one of the two input ports
 *    - must output data item with where the inserts/deletes are the
 *      incremental modification of the joined output relation,
 *      for each timeStamp that is now matched
 *    - also want to drop any remembered state that is no longer needed
 *  - solution
 *    - state variable fully materializes both input relations for a matched
 *      time stamp (do this incrementally by applying inserts / deletes to
 *      previous fully-materialized relations)
 *    - state variable also fully materializes the output relation
 *    - do the join on the two input relations (index if natural join, nested
 *      loops if theta-join), and for each output tuple found:
 *      - if already in materialized output relation, mark as "still present"
 *      - otherwise, add to materialized output variable, and also add to
 *        "insert" bag that will go into the output data item
 *    - iterate over the new materialized output relation, and for each tuple
 *      that is not marked, delete the tuple and add it to "delete" bag
 *
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
#define JOIN_TYPEA               BabbleTuple2(BabbleUInt32, BabbleString8)  
#define JOIN_TYPEB               BabbleTuple3(BabbleUInt32, BabbleUInt32, BabbleString8)
BabbleReturn*
joinOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar)
{

  typedef JOIN_TYPEA BabbleTupleInputSchema1;
  typedef JOIN_TYPEB BabbleTupleInputSchema2;
  typedef BabbleTuple4(BabbleUInt32, BabbleString8, BabbleUInt32, BabbleUInt32) BabbleTupleOutputSchema;
  typedef BabbleBag (BabbleTupleInputSchema1) BabbleCQLInputSigmaType1;
  typedef BabbleBag (BabbleTupleInputSchema2) BabbleCQLInputSigmaType2;
  typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1) JoinDataItemIn1;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2) JoinDataItemIn2;
  typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) JoinDataItemOut;
  typedef BabbleUInt32 BabbleCQLTauType;

  cout << "joinOp" << endl;

  BabbleReturn* retval = BabbleReturnNew();
  BabbleList(BabbleQueueReturn) queues = BabbleListNew(BabbleQueueReturn);
  BabbleList(BabbleVariableReturn) variables = BabbleListNew(BabbleVariableReturn);

  void** state = (void**)inVar;
  void* vmat1 = state[0];
  void* vmat2 = state[1];
  void* vdelta1 = state[2];
  void* vdelta2 = state[3];

  // Decode the state
  BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType1) mat1 = 
    *(BabbleCastPtr(BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType1), vmat1)); 
  BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType2) mat2 = 
    *(BabbleCastPtr(BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType2), vmat2)); 

  BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1))* delta1 = 
    (BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1))*) vdelta1;
  BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2))* delta2 = 
    (BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2))*) vdelta2;

  cout << "mat 1  " << mat1  << endl;
  cout << "mat 2  " << mat2  << endl;
  cout << "list 3 size " << delta1->size() << endl;
  cout << "list 4 size " << delta2->size() << endl;

  if (port == 0) {
    BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1) inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1);
    BabbleRead(inBuf, inDataItem);
    BabbleListPushBack((*delta1), inDataItem);
  }  else if (port == 1) {
    BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2) inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2);
    BabbleRead(inBuf, inDataItem);
    BabbleListPushBack((*delta2), inDataItem);
  } else {
    cout << "Bad port number" << endl;
    // throw exception?
    return NULL;
  }

  bool tetris = false;
  if (!(BabbleListEmpty((*delta1)) || BabbleListEmpty((*delta2)))) { 
    JoinDataItemIn1 top1 = BabbleListAt((*delta1),0);
    JoinDataItemIn2 top2 = BabbleListAt((*delta2),0);
    BabbleCQLTauType tsTop1 = BabbleTupleGet(top1, 0);
    BabbleCQLTauType tsTop2 = BabbleTupleGet(top2, 0);
    if (tsTop1 == tsTop2) {
      tetris = true;
    }
  }

  if (!tetris) {
    /* return no output to queue */
    BabbleVariableReturn* vr = BabbleVariableReturnNew;
    vr->var = inVar;
    vr->index = 0;
    BabbleListPushBack(variables, *vr);

    retval->queues = queues;
    retval->variables = variables;
    return retval;
  }

  cout << "TETRIS" << endl;
  JoinDataItemIn1 top1 = BabbleListAt((*delta1),0);
  JoinDataItemIn2 top2 = BabbleListAt((*delta2),0);
  BabbleCQLTauType tsTop1 = BabbleTupleGet(top1, 0);
  BabbleCQLInputSigmaType1 newInserts1 = BabbleTupleGet(top1, 1);
  BabbleCQLInputSigmaType2 newInserts2 = BabbleTupleGet(top2, 1);
  BabbleCQLInputSigmaType1 newDeletes1 = BabbleTupleGet(top1, 2);
  BabbleCQLInputSigmaType2 newDeletes2 = BabbleTupleGet(top2, 2);

  BabbleCQLInputSigmaType1 oldsigma1 = BabbleTupleGet(mat1, 1);
  BabbleIterator(BabbleCQLInputSigmaType1) newInserts1It;
  BabbleIteratorBegin(newInserts1It, newInserts1);    
  while(BabbleIteratorHasNext(newInserts1It, newInserts1)) {
    JOIN_TYPEA tup = BabbleIteratorValue(JOIN_TYPEA, newInserts1It);
    BabbleBagAdd(oldsigma1, tup);
    BabbleIteratorNext(newInserts1It);
  }           
  BabbleIterator(BabbleCQLInputSigmaType1) newDeletes1It;
  BabbleIteratorBegin(newDeletes1It, newDeletes1);    
  while(BabbleIteratorHasNext(newDeletes1It, newDeletes1)) {
    JOIN_TYPEA tup = BabbleIteratorValue(JOIN_TYPEA, newDeletes1It);
    cout << "Delete " << tup << endl;
    // delete incrementally from oldsigma1
    BabbleIterator(BabbleCQLInputSigmaType1) findIt
      = BabbleBagFind(oldsigma1, tup);
    if (findIt != oldsigma1.end()) {
      BabbleBagErase(oldsigma1, findIt);
    }
    BabbleIteratorNext(newDeletes1It);
  }           
  BabbleTupleSet(mat1, 0, tsTop1);

  BabbleCQLInputSigmaType2 oldsigma2 = BabbleTupleGet(mat2, 1);
  BabbleIterator(BabbleCQLInputSigmaType2) newInserts2It;
  BabbleIteratorBegin(newInserts2It, newInserts2);    
  while(BabbleIteratorHasNext(newInserts2It, newInserts2)) {
    JOIN_TYPEB tup = BabbleIteratorValue(JOIN_TYPEB, newInserts2It);
    BabbleBagAdd(oldsigma2, tup);
    BabbleIteratorNext(newInserts2It);
  }           
  BabbleIterator(BabbleCQLInputSigmaType2) newDeletes2It;
  BabbleIteratorBegin(newDeletes2It, newDeletes2);    
  while(BabbleIteratorHasNext(newDeletes2It, newDeletes2)) {
    JOIN_TYPEB tup = BabbleIteratorValue(JOIN_TYPEB, newDeletes2It);
    cout << "Delete from 2" << tup << endl;
    // delete incrementally from oldsigma2
    BabbleIterator(BabbleCQLInputSigmaType2) findIt
      = BabbleBagFind(oldsigma2, tup);
    if (findIt != oldsigma2.end()) {
      BabbleBagErase(oldsigma2, findIt);
    }
    BabbleIteratorNext(newDeletes2It);
  }           
  BabbleTupleSet(mat2, 0, tsTop1);

  BabbleBag(BabbleTupleOutputSchema) outInserts =
    BabbleBagNew(BabbleTupleOutputSchema);

  BabbleBag(BabbleTupleOutputSchema) outDeletes =
    BabbleBagNew(BabbleTupleOutputSchema);

  BabbleIterator(BabbleCQLInputSigmaType1) oldsigma1It;
  BabbleIterator(BabbleCQLInputSigmaType2) oldsigma2It;
  BabbleIteratorBegin(oldsigma1It, oldsigma1);    
  while(BabbleIteratorHasNext(oldsigma1It, oldsigma1)) {
    JOIN_TYPEA tup1 = BabbleIteratorValue(JOIN_TYPEA, oldsigma1It);
    BabbleIteratorBegin(oldsigma2It, oldsigma2);    
    while(BabbleIteratorHasNext(oldsigma2It, oldsigma2)) {
      JOIN_TYPEB tup2 = BabbleIteratorValue(JOIN_TYPEB, oldsigma2It);
      if (BabbleTupleGet(tup1, 1) ==  BabbleTupleGet(tup2, 2) ) {
        cout << "JOIN!" << endl;
        cout << "tup1 " << tup1 << " tups 2 " << tup2 << endl;

        BabbleTupleOutputSchema tupOut = 
          BabbleTuple4New(BabbleUInt32, BabbleString8, BabbleUInt32, BabbleUInt32);
        BabbleTupleSet(tupOut, 0, BabbleTupleGet(tup1, 0));
        BabbleTupleSet(tupOut, 1, BabbleTupleGet(tup1, 1));
        BabbleTupleSet(tupOut, 2, BabbleTupleGet(tup2, 0));
        BabbleTupleSet(tupOut, 3, BabbleTupleGet(tup2, 1));
        
        BabbleBagAdd(outInserts, tupOut);

      }
      BabbleIteratorNext(oldsigma2It);
    }           
    BabbleIteratorNext(oldsigma1It);
  }           

  JoinDataItemOut outDataItem =
    BabbleTuple3New(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);

  BabbleTupleSet(outDataItem, 0, tsTop1);
  BabbleTupleSet(outDataItem, 1, outInserts);
  BabbleTupleSet(outDataItem, 2, outDeletes);

  BabbleBuffer  out = BabbleBufferNew();
  BabbleWrite(out, outDataItem);  

  BabbleQueueReturn* qr = BabbleQueueReturnNew;
  qr->buffer = &out;
  qr->index = 0;
  BabbleListPushBack(queues, *qr);

  BabbleVariableReturn* vr = BabbleVariableReturnNew;
  vr->var = inVar;
  vr->index = 0;
  BabbleListPushBack(variables, *vr);

  retval->queues = queues;
  retval->variables = variables;
  return retval;
}

