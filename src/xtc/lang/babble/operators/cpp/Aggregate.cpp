#include <UTILS/SupportFunctions.h>
#include <UTILS/DistilleryApplication.h>

#include "CQLOperators.h"

using namespace Distillery;
using namespace std;
using namespace estd;

#define DEBUG 1


//struct eqstr 
//{
//  bool operator()(const std::string s1, const std::string s2) const {
//    return s1.compare(s2);
//  }
//};


// namespace estd
// {
//   template<> struct hash< std::string >
//   {
//     size_t operator()(const std::string& x) const {
//       return hash< const char* >() (x.c_str());
//     }
//   };
// }

class Main : public Distillery::DistilleryApplication
{
public:

  Main() {}
  
  void testAggregateOp() {
    typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleInputSchema;
    typedef BabbleTuple2(BabbleUInt32, BabbleString8) BabbleTupleOutputSchema;
    typedef BabbleBag (BabbleTupleInputSchema) BabbleCQLInputSigmaType;
    typedef BabbleBag (BabbleTupleOutputSchema) BabbleCQLOutputSigmaType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType) AggregateDataItemIn;
    typedef BabbleUInt32 BabbleCQLTauType;

    /* create some sample tuples */
    BabbleTupleInputSchema t1 = BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleInputSchema t2 = BabbleTuple2New(BabbleUInt32, BabbleString8);
    BabbleTupleSet(t1, 0, 25);
    BabbleTupleSet(t2, 0, 3);
    BabbleTupleSet(t1, 1, "IBM");
    BabbleTupleSet(t2, 1, "ABC");

    BabbleBag(BabbleTupleInputSchema) inInserts = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBag(BabbleTupleInputSchema) inDeletes = BabbleBagNew(BabbleTupleInputSchema);
    BabbleBagAdd(inInserts, t1);
    BabbleBagAdd(inInserts, t2);

    BabbleUInt32 ts = BabbleUInt32New();
    ts = 1;

    // Make an input data item
    AggregateDataItemIn inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLInputSigmaType, BabbleCQLInputSigmaType);

    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);

    BabbleBuffer in = BabbleBufferNew();
    BabbleWrite(in, inDataItem);  

    // Make an input port index
    BabbleUInt32 port = BabbleUInt32New();
    port = 0;

    // Make the state
    estd::hash_map< std::string, uint32_t > aggState; 
    aggState["IBM"] = 10;

    cout << "Size is " << aggState.size() << endl;;

    void* state = &aggState;

    BabbleReturn* retval = aggregateOp(in, port, state);

    if (retval == NULL)
      return;


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

  }

  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    testAggregateOp();
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

