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

  void printStateSize(void* inVar) {
    typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleInputSchema1;
    typedef BabbleTuple3(BabbleUInt32, BabbleUInt32, BabbleString8) BabbleTupleInputSchema2;
    typedef BabbleTuple4(BabbleUInt32, BabbleString8, BabbleUInt32, BabbleUInt32) BabbleTupleOutputSchema;
    typedef BabbleBag (BabbleTupleInputSchema1) BabbleCQLInputSigmaType1;
    typedef BabbleBag (BabbleTupleInputSchema2) BabbleCQLInputSigmaType2;
    typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1) JoinDataItemIn1;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2) JoinDataItemIn2;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) JoinDataItemOut;
    typedef BabbleUInt32 BabbleCQLTauType;

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
    
    cout << "mat 1 " << mat1 << endl;
    cout << "mat 2 " << mat2 << endl;
    cout << "list 3 size " << delta1->size() << endl;
    cout << "list 4 size " << delta2->size() << endl;

  }

  void testJoinOp() {

    typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleInputSchema1;
    typedef BabbleTuple3(BabbleUInt32, BabbleUInt32, BabbleString8) BabbleTupleInputSchema2;
    typedef BabbleTuple4(BabbleUInt32, BabbleString8, BabbleUInt32, BabbleUInt32) BabbleTupleOutputSchema;
    typedef BabbleBag (BabbleTupleInputSchema1) BabbleCQLInputSigmaType1;
    typedef BabbleBag (BabbleTupleInputSchema2) BabbleCQLInputSigmaType2;
    typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1) JoinDataItemIn1;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2) JoinDataItemIn2;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) JoinDataItemOut;
    typedef BabbleUInt32 BabbleCQLTauType;

    cout << "testJoinOp" << endl;

    /* create some sample tuples */

    BabbleTupleInputSchema1 t1 = BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema1 t2 = BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema1 t3 = BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema1 t4 = BabbleTuple2New(BabbleUInt32, BabbleString8);

    BabbleTupleInputSchema2 t5 = BabbleTuple3New(BabbleUInt32, BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema2 t6 = BabbleTuple3New(BabbleUInt32, BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema2 t7 = BabbleTuple3New(BabbleUInt32, BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema2 t8 = BabbleTuple3New(BabbleUInt32, BabbleUInt32, BabbleString8);
  
    BabbleTupleSet(t1, 0, 1);
    BabbleTupleSet(t2, 0, 2);
    BabbleTupleSet(t3, 0, 3);
    BabbleTupleSet(t4, 0, 4);
    BabbleTupleSet(t1, 1, "IBM");
    BabbleTupleSet(t2, 1, "IBM");
    BabbleTupleSet(t3, 1, "IBM");
    BabbleTupleSet(t4, 1, "IBM");

    BabbleTupleSet(t5, 0, 1);
    BabbleTupleSet(t6, 0, 2);
    BabbleTupleSet(t7, 0, 3);
    BabbleTupleSet(t8, 0, 4);
    BabbleTupleSet(t5, 1, 10);
    BabbleTupleSet(t6, 1, 20);
    BabbleTupleSet(t7, 1, 30);
    BabbleTupleSet(t8, 1, 40);
    BabbleTupleSet(t5, 2, "IBM");
    BabbleTupleSet(t6, 2, "IBM");
    BabbleTupleSet(t7, 2, "IBM");
    BabbleTupleSet(t8, 2, "IBM");


    BabbleBag(BabbleTupleInputSchema1) inInserts = BabbleBagNew(BabbleTupleInputSchema1);
    BabbleBag(BabbleTupleInputSchema1) inDeletes = BabbleBagNew(BabbleTupleInputSchema1);
    BabbleBagAdd(inInserts, t1);
    BabbleBagAdd(inInserts, t2);
    BabbleBagAdd(inDeletes, t1);
    BabbleBagAdd(inDeletes, t2);

    BabbleBag(BabbleTupleInputSchema2) inInsertsPort2 = BabbleBagNew(BabbleTupleInputSchema2);
    BabbleBag(BabbleTupleInputSchema2) inDeletesPort2 = BabbleBagNew(BabbleTupleInputSchema2);
    BabbleBagAdd(inInsertsPort2, t5);
    BabbleBagAdd(inInsertsPort2, t6);


    BabbleUInt32 ts = BabbleUInt32New();
    ts = 1;

    // Make the state variable. The state variable is a void*[4]
    BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType1) mat1 = 
      BabbleTuple2New(BabbleCQLTauType, BabbleCQLInputSigmaType1);
    BabbleTuple2(BabbleCQLTauType, BabbleCQLInputSigmaType2) mat2 = 
      BabbleTuple2New(BabbleCQLTauType, BabbleCQLInputSigmaType2);
    BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1)) deltas1 = 
      BabbleListNew(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1));
    BabbleList(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2)) deltas2 = 
      BabbleListNew(BabbleTuple3(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2));
    void* state[4] = {(void*)&mat1, (void*)&mat2, (void*)&deltas1, (void*)&deltas2 };

    // Make an input data item
    JoinDataItemIn1 inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType1, BabbleCQLInputSigmaType1);

    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);

    BabbleBuffer in = BabbleBufferNew();
    BabbleWrite(in, inDataItem);  

    // Make an input port index
    BabbleUInt32 port = BabbleUInt32New();
    port = 0;
    
    BabbleReturn* retval = joinOp(in, port, state);
    BabbleList(BabbleQueueReturn) queues = retval->queues;
    BabbleList(BabbleVariableReturn) variables = retval->variables;

    BabbleIterator(BabbleList(BabbleQueueReturn)) queuesIt;
    BabbleIteratorBegin(queuesIt, queues);
    while (BabbleIteratorHasNext(queuesIt, queues)) {
      BabbleIteratorNext(queuesIt);
    }
    BabbleIterator(BabbleList(BabbleVariableReturn)) variablesIt;
    BabbleIteratorBegin(variablesIt, variables);
    while (BabbleIteratorHasNext(variablesIt, variables)) {
      cout << "Printing state" << endl;
      printStateSize(variablesIt->var);
      BabbleIteratorNext(variablesIt);
    }


    //    printStateSize(state);

    JoinDataItemIn2 inDataItemPort2 = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType2, BabbleCQLInputSigmaType2);

    BabbleTupleSet(inDataItemPort2,0,ts);
    BabbleTupleSet(inDataItemPort2,1,inInsertsPort2);
    BabbleTupleSet(inDataItemPort2,2,inDeletesPort2);

    BabbleBuffer in2 = BabbleBufferNew();
    BabbleWrite(in2, inDataItemPort2);  

    port = 1;

    // joinOp(in2, port, state);
    //printStateSize(state);


    retval = joinOp(in2, port, state);
    queues = retval->queues;
    variables = retval->variables;

    BabbleIteratorBegin(queuesIt, queues);
    while (BabbleIteratorHasNext(queuesIt, queues)) {
      BabbleIteratorNext(queuesIt);
    }

    BabbleIteratorBegin(variablesIt, variables);
    while (BabbleIteratorHasNext(variablesIt, variables)) {
      cout << "2 Printing state" << endl;
      printStateSize(variablesIt->var);
      BabbleIteratorNext(variablesIt);
    }

  }
  
  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    testJoinOp();
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

