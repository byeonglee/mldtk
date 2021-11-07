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

  void testNowOp() {

    typedef BabbleTuple1(BabbleUInt32) BabbleTupleSchema;
    typedef BabbleBag (BabbleTupleSchema) BabbleCQLSigmaType;
    typedef BabbleUInt32 BabbleCQLTauType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemIn;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemOut;
    cout << "testNowOp" << endl;

    BabbleTupleSchema t1 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleSchema t2 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleSchema t3 = BabbleTuple1New(BabbleUInt32);
    BabbleTupleSchema t4 = BabbleTuple1New(BabbleUInt32);

    BabbleTupleSet(t1, 0, 1);
    BabbleTupleSet(t2, 0, 2);
    BabbleTupleSet(t3, 0, 3);
    BabbleTupleSet(t4, 0, 4);

    BabbleBag(BabbleUInt32) list = BabbleBagNew(BabbleUInt32);
    BabbleBag(BabbleTupleSchema) inInserts = BabbleBagNew(BabbleTupleSchema);
    BabbleBag(BabbleTupleSchema) inDeletes = BabbleBagNew(BabbleTupleSchema);
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

    NowDataItemIn inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);
    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);
    BabbleWrite(in, inDataItem);  

    BabbleReturn* retval = nowOp(in, port, &list);

    BabbleList(BabbleQueueReturn) queues = retval->queues;
    BabbleList(BabbleVariableReturn) variables = retval->variables;
    BabbleIterator(BabbleList(BabbleQueueReturn)) queuesIt;
    BabbleIteratorBegin(queuesIt, queues);
    while (BabbleIteratorHasNext(queuesIt, queues)) {
      dumpNowOutput(*(queuesIt->buffer));
      BabbleIteratorNext(queuesIt);
    }
    BabbleIterator(BabbleList(BabbleVariableReturn)) variablesIt;
    BabbleIteratorBegin(variablesIt, variables);
    while (BabbleIteratorHasNext(variablesIt, variables)) {
      BabbleIteratorNext(variablesIt);
    }


    BabbleBagDelete(inInserts);
    BabbleBagDelete(inDeletes); 
    BabbleUInt32Delete(ts); 
    BabbleUInt32Delete(port); 
    BabbleBufferDelete(in); 
    BabbleBagDelete(list);
    BabbleTuple1Delete(t1);
    BabbleTuple1Delete(t2);
    BabbleTuple1Delete(t3);
    BabbleTuple1Delete(t4);
    BabbleTuple3Delete(inDataItem);
  }


  void dumpNowOutput(BabbleBuffer buf) {
    typedef BabbleTuple1(BabbleUInt32) BabbleTupleSchema;
    typedef BabbleBag (BabbleTupleSchema) BabbleCQLSigmaType;
    typedef BabbleUInt32 BabbleCQLTauType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemIn;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) NowDataItemOut;
    NowDataItemIn dataItem =
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);
    BabbleRead(buf, dataItem);
    BabbleCQLTauType  ts = BabbleTupleGet(dataItem,0);
    BabbleCQLSigmaType  insertions = BabbleTupleGet(dataItem,1);
    BabbleCQLSigmaType  deletions = BabbleTupleGet(dataItem,2);
    cout << "timestamp " << ts << endl;
    BabbleIterator(BabbleCQLSigmaType) insertionsIt;
    BabbleIteratorBegin(insertionsIt, insertions);
    while(BabbleIteratorHasNext(insertionsIt,insertions)) {
      cout << "insert " << *insertionsIt << endl;
      BabbleIteratorNext(insertionsIt);
    }
    BabbleIterator(BabbleCQLSigmaType) deletionsIt;
    BabbleIteratorBegin(deletionsIt, deletions);
    while(BabbleIteratorHasNext(deletionsIt,deletions)) {
      cout << "delete " << *deletionsIt << endl;
      BabbleIteratorNext(deletionsIt);
    }
    BabbleTuple3Delete(dataItem);
  }
  

  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    testNowOp();
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

