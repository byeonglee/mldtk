#include <UTILS/SupportFunctions.h>
#include <UTILS/DistilleryApplication.h>

#include <fstream>
#include "../watson/templates/babble.h"

using namespace Distillery;
using namespace std;
using namespace estd;

#define DEBUG 1

class Main : public Distillery::DistilleryApplication
{
public:


//   void printBuffer(SBuffer * s)
//   {
//     unsigned char * cptr = s->getUCharPtr();
//     int size = s->getSerializedDataSize();
//     cout << "[";
//     for(int i = 0; i < size; i++) {
//       cout << (int)*(cptr + i);
//       if(i < size-1) {
//         cout << ",";
//       }
//     }
//     cout << "]" << endl;
//   }

  void printBuffer(SBuffer & buf)
  {
    stringstream textttuple;
    SBuffer & sbuf = const_cast<SBuffer&>(buf);
    uint32_t size = sbuf.getUInt32();
    cout << "Size is " << size << endl;
    uint8_t * data = static_cast<uint8_t *>(sbuf.getPtr()+4);
    textttuple << "[";
    for(uint32_t i = 0; i<size; ++i) {
      if(i) textttuple << ",";
      textttuple << static_cast<int>(data[i]);
    }
    textttuple << "]";
    cout << textttuple.str() << "\n" << flush;
  }
  
  virtual int run(const std::vector<std::string> & /*remains*/)
  {

    typedef BabbleTuple2(BabbleUInt32, BabbleUInt32) BabbleTupleSchema;
    typedef BabbleBag (BabbleTupleSchema) BabbleCQLSigmaType;
    typedef BabbleUInt32 BabbleCQLTauType;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) ProjectDataItemIn;
    typedef BabbleTuple3(BabbleUInt32, BabbleCQLSigmaType, BabbleCQLSigmaType) ProjectDataItemOut;

    BabbleTupleSchema t1 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleSchema t2 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleSchema t3 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);
    BabbleTupleSchema t4 = BabbleTuple2New(BabbleUInt32, BabbleUInt32);

    BabbleTupleSet(t1, 0, 1);
    BabbleTupleSet(t2, 0, 2);
    BabbleTupleSet(t3, 0, 3);
    BabbleTupleSet(t4, 0, 4);
    BabbleTupleSet(t1, 1, 1);
    BabbleTupleSet(t2, 1, 2);
    BabbleTupleSet(t3, 1, 3);
    BabbleTupleSet(t4, 1, 4);

    BabbleBag(BabbleTupleSchema) inInserts = BabbleBagNew(BabbleTupleSchema);
    BabbleBag(BabbleTupleSchema) inDeletes = BabbleBagNew(BabbleTupleSchema);
    BabbleBagAdd(inInserts, t1);
    BabbleBagAdd(inInserts, t2);
    BabbleBagAdd(inInserts, t3);
    BabbleBagAdd(inInserts, t4);
    BabbleBagAdd(inDeletes, t1);
    BabbleBagAdd(inDeletes, t2);

    BabbleUInt32 ts = BabbleUInt32New();
    ts = 1;

    BabbleBuffer in = BabbleBufferNew();

    ProjectDataItemIn inDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);
    BabbleTupleSet(inDataItem,0,ts);
    BabbleTupleSet(inDataItem,1,inInserts);
    BabbleTupleSet(inDataItem,2,inDeletes);
    BabbleWrite(in, inDataItem);  

    //cout << in << endl;
    cout << inDataItem << endl;

    ofstream myfile;
    myfile.open ("example.txt");
    myfile << inDataItem;
    myfile.close();

    ifstream infile;
    infile.open ("example.txt");
    string line;
    while (!infile.eof()) {
      getline(infile, line);
      cout << "READ " << line << endl;
    }
    infile.close();

    ProjectDataItemIn readDataItem = 
      BabbleTuple3New(BabbleCQLTauType, BabbleCQLSigmaType, BabbleCQLSigmaType);

    stringstream ss(line);
    ss >> readDataItem;

    cout << "read item " << readDataItem << endl;
    

    // printBuffer(in);

    return EXIT_SUCCESS;

  }
};

MAIN_APP(Main)

