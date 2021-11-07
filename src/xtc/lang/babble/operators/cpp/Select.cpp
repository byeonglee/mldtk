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

  //   void testSelectOp() {
  //     BabbleTupleSchema t1;
  //     BabbleTupleSchema t2;
  //     BabbleTupleSchema t3;
  //     BabbleTupleSchema t4;

  //     BabbleTupleSet(t1, 0, 1);
  //     BabbleTupleSet(t2, 0, 2);
  //     BabbleTupleSet(t3, 0, 3);
  //     BabbleTupleSet(t4, 0, 4);

  //     BabbleCQLSigmaType inputInserts;
  //     BabbleCQLSigmaType inputDeletes;
  //     BabbleBagAdd(inputInserts, t1);
  //     BabbleBagAdd(inputInserts, t2);
  //     BabbleBagAdd(inputInserts, t3);
  //     BabbleBagAdd(inputInserts, t4);
  //     BabbleBagAdd(inputDeletes, t1);
  //     BabbleBagAdd(inputDeletes, t2);

  //     SelectDataItemIn inputDataItem;

  //     BabbleUInt32 ts = 1;
  //     BabbleTupleSet(inputDataItem, 0, ts);
  //     BabbleTupleSet(inputDataItem, 1, inputInserts);
  //     BabbleTupleSet(inputDataItem, 2, inputDeletes);

  //     BabbleBuffer inBuf;
  //     BabbleUInt32 port = 0;
  //     BabbleWrite(inBuf, inputDataItem);

  //     BabbleBuffer out = selectOp(inBuf, port);
  //     dumpSelectOutput(out);

  //   }

  //   typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) SumDataItemIn;
  //   typedef BabbleTuple2(BabbleUInt32, BabbleUInt32) SumDataItemOut;
  //   void testSumOp() {
  //     BabbleMap(BabbleUInt32, BabbleUInt32) myMap;
  //     BabbleMapAdd(myMap,0,10);
  //     BabbleMapAdd(myMap,1,1);
  //     if (BabbleMapContains(myMap, 0)) {
  //       cout << "myMap maps 0 to " << BabbleMapFind(myMap,0) << endl;
  //     } 
  //     BabbleCQLTauType ts = 1;
  //     BabbleCQLSigmaType inputInsertions;
  //     BabbleCQLSigmaType inputDeletions;
  //     SumDataItemIn inDataItem;
  //     BabbleTupleSet(inDataItem,0,ts);
  //     BabbleTupleSet(inDataItem,1,inputInsertions);
  //     BabbleTupleSet(inDataItem,2,inputDeletions);

  //     cout << "inDataItem " << inDataItem << endl;

  //     BabbleBuffer inBuf;
  //     BabbleWrite(inBuf, inDataItem);
  //     BabbleUInt32 port = 0;
  //     //BabbleUInt32 oldDataItem = 1;
  //     BabbleBuffer outBuf = sumOp(inBuf, port, &myMap); 
  //     SumDataItemOut outDataItem;
  //     BabbleRead(outBuf, outDataItem);
  //     cout << "outDataItem " << outDataItem << endl;
  //   }

  
  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    cout << "select operator test not implemented" << endl;
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

