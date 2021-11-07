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
  
  virtual int run(const std::vector<std::string> & /*remains*/)
  {
    cout << "IStream test not implemented" << endl;
    return EXIT_SUCCESS;
  }
};

MAIN_APP(Main)

