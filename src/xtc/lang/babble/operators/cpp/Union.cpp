#include <UTILS/SupportFunctions.h>
#include <UTILS/DistilleryApplication.h>

#include "CQLOperators.h"

using namespace Distillery;
using namespace std;
using namespace estd;

#define DEBUG 1

class Main : public Distillery::DistilleryApplication
{
public:

  Main() {}

  void testUnionOp() {
    typedef BabbleTuple1(BabbleUInt32) BabbleTupleInputSchema;
    typedef BabbleTuple1(BabbleUInt32) BabbleTupleOutputSchema;
    typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
    typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) UnionDataItemIn;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) UnionDataItemOut;
    typedef BabbleUInt32 BabbleCQLTauType;

    BabbleTupleInputSchema t1 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleInputSchema t2 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleInputSchema t3 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleInputSchema t4 = BabbleTuple1New(BabbleUInt32);

    BabbleTupleSet(t1, 0, 1);
    BabbleTupleSet(t2, 0, 2);
    BabbleTupleSet(t3, 0, 3);
    BabbleTupleSet(t4, 0, 4);


    BabbleBag(BabbleTupleInputSchema) inInserts = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBag(BabbleTupleInputSchema) inDeletes = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBagAdd(inInserts, t1);
    BabbleBagAdd(inInserts, t2);
    BabbleBagAdd(inInserts, t3);
    BabbleBagAdd(inInserts, t4);

    BabbleUInt32 ts = BabbleUInt32New();
    ts = 1;

    BabbleBuffer in = BabbleBufferNew();

    BabbleList(BabbleList(UnionDataItemIn)) state = BabbleListNew(BabbleList(UnionDataItemIn));
    // create lists for each input
    for (int i = 0; i < 2; i++) {
      BabbleList(UnionDataItemIn) l = BabbleListNew(UnionDataItemIn);
      BabbleListPushBack(state, l);
    }

    BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) inDataItem = 
      BabbleTuple3New(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);

    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);
    BabbleWrite(in, inDataItem);  

    BabbleUInt32 port = BabbleUInt32New();
    BabbleBuffer inBuf = BabbleBufferNew();
    BabbleWrite(inBuf, inDataItem);

    
    BabbleList(BabbleList(UnionDataItemIn))* stateptr = &state;

    port = 0;
    BabbleReturn* retval = unionOp(inBuf, port, stateptr);

    BabbleList(BabbleQueueReturn) queues = retval->queues;
    BabbleList(BabbleVariableReturn) variables = retval->variables;
    BabbleIterator(BabbleList(BabbleQueueReturn)) queuesIt;
    BabbleIteratorBegin(queuesIt, queues);
    while (BabbleIteratorHasNext(queuesIt, queues)) {
      BabbleBuffer out = *queuesIt->buffer;
      BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) item =
        BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);
      BabbleRead(out, item);
      cout << item << endl;
      BabbleIteratorNext(queuesIt);
    }
    BabbleIterator(BabbleList(BabbleVariableReturn)) variablesIt;
    BabbleIteratorBegin(variablesIt, variables);
    while (BabbleIteratorHasNext(variablesIt, variables)) {
      stateptr = (BabbleList(BabbleList(UnionDataItemIn))*)variablesIt->var;    
      for (int i = 0; i < 2; i++) {
        BabbleList(UnionDataItemIn) l = BabbleListAt(state, i);
        cout << "list i size " << l.size() << endl;
      }    
      BabbleIteratorNext(variablesIt);
    }


    port = 1;
    BabbleBuffer inBuf2 = BabbleBufferNew();
    BabbleWrite(inBuf2, inDataItem);


    retval = unionOp(inBuf2, port, stateptr);

    queues = retval->queues;
    variables = retval->variables;
    BabbleIteratorBegin(queuesIt, queues);
    while (BabbleIteratorHasNext(queuesIt, queues)) {
      BabbleBuffer out = *queuesIt->buffer;
      BabbleTuple3(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) item =
        BabbleTuple3New(BabbleCQLTauType, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType);
      BabbleRead(out, item);
      cout << item << endl;
      BabbleIteratorNext(queuesIt);
    }
    BabbleIteratorBegin(variablesIt, variables);
    while (BabbleIteratorHasNext(variablesIt, variables)) {
      stateptr = (BabbleList(BabbleList(UnionDataItemIn))*)variablesIt->var;    
      for (int i = 0; i < 2; i++) {
        BabbleList(UnionDataItemIn) l = BabbleListAt(state, i);
        cout << "list i size " << l.size() << endl;
      }    
      BabbleIteratorNext(variablesIt);
    }
   
  }

  
  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    testUnionOp();
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

