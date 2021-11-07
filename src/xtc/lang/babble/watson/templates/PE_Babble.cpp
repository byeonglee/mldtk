#include "PE_Babble.h"

// includes for operators
#include "$opname.h"

using namespace SPC;
using namespace Distillery;

namespace DPS
{
    class $classname : public BabblePE
    {
    public:
        $classname(PEContext & pec)
          : BabblePE(pec), 
            my$opname(*this, *operatorContexts[0])
        {
            allOperators["$classname"] = &my$opname;
        }

        void process(uint32_t port, Distillery::SBuffer const & buf)
        {
            my$opname.process(port, buf);
        }
        
        void shutdown() 
        {
           my$opname.shutdown();
        }


    private:
        $opname my$opname;
    };
};

MAKE_PE(DPS::$classname);

