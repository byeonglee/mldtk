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

  void testProjectOp() {
    cout << "testProjectOp" << endl;

    typedef BabbleTuple2(BabbleUInt32, BabbleUInt32) BabbleTupleInputSchema;
    typedef BabbleTuple1(BabbleUInt32) BabbleTupleOutputSchema;
    typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
    typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) ProjectDataItemIn;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLOutputSigmaType, BabbleCQLOutputSigmaType) ProjectDataItemOut;
    typedef BabbleUInt32 BabbleCQLTauType;

    BabbleTupleInputSchema t1 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleInputSchema t2 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleInputSchema t3 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleInputSchema t4 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);

    BabbleTupleSet(t1, 0, 1);
    BabbleTupleSet(t2, 0, 2);
    BabbleTupleSet(t3, 0, 3);
    BabbleTupleSet(t4, 0, 4);
    BabbleTupleSet(t1, 1, 1);
    BabbleTupleSet(t2, 1, 2);
    BabbleTupleSet(t3, 1, 3);
    BabbleTupleSet(t4, 1, 4);

    BabbleBag(BabbleTupleInputSchema) inInserts = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBag(BabbleTupleInputSchema) inDeletes = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBagAdd(inInserts, t1);
    BabbleBagAdd(inInserts, t2);
    BabbleBagAdd(inInserts, t3);
    BabbleBagAdd(inInserts, t4);
    BabbleBagAdd(inDeletes, t1);
    BabbleBagAdd(inDeletes, t2);

    BabbleUInt32 ts = BabbleUInt32New();
    BabbleUInt32 port = BabbleUInt32New();
    ts = 1;
    port = 0;

    BabbleBuffer in = BabbleBufferNew();

    ProjectDataItemIn inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);
    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);
    BabbleWrite(in, inDataItem);  

    BabbleReturn* retval = projectOp(in, port);

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
      BabbleIteratorNext(variablesIt);
    }

    // dumpProjectOutput(out);

    BabbleBagDelete(inInserts);
    BabbleBagDelete(inDeletes); 
    BabbleUInt32Delete(ts); 
    BabbleUInt32Delete(port); 
    BabbleBufferDelete(in); 
    //BabbleBufferDelete(out);
    //BabbleReturnDelete(retval);
    BabbleTuple2Delete(t1);
    BabbleTuple2Delete(t2);
    BabbleTuple2Delete(t3);
    BabbleTuple2Delete(t4);
    BabbleTuple3Delete(inDataItem);
    
  }

  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    testProjectOp();
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

