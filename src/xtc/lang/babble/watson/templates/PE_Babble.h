#ifndef BABBLE_PE_H
#define BABBLE_PE_H

#include <DPS/PH/DpsOP.h>
#include <DPS/PH/DpsSrcOpThread.h>
#include <DPS/PH/DpsTRPPE.h>
#include <PECAgent/PEContext.h>
#include <UTILS/SBuffer.h>

#include <stdint.h>

namespace DPS
{    
    class BabblePE : public DpsTRPPE 
    {
    public:
        BabblePE(SPC::PEContext & pec)
          : DpsTRPPE(DpsTransport::TCP, 
                     DpsTransport::TCP,
                     pec, false, true, false) {}
        virtual ~BabblePE() {}
        void createSources() 
        {
            DpsOP & op = *allOperators.begin()->second;
            uint32_t ni = op.getContext().getNumberOfInputs();
            if(ni==0) {
                DpsSrcOpThread * dsrc_op = new DpsSrcOpThread(*this, op);
                sourceOpThreads.push_back(dsrc_op);            
            }
        }
        void connectOperators() 
        {
            DpsOP & op = *allOperators.begin()->second;
            uint32_t ni = op.getContext().getNumberOfInputs();
            for(uint32_t i=0; i<ni; ++i)
                mapOpIPortToPeIPort(*operatorContexts[i], i, i);
            uint32_t no = op.getContext().getNumberOfOutputs();
            for(uint32_t i=0; i<no; ++i)
                mapOpOPortToPeOPort(*operatorContexts[i], i, i);
        }
        void onMessage(void* data, uint32_t size, 
                       const Distillery::DataReceiver
                                       ::user_data_t & ud)
        {
            this->pem.updateRxCounters(ud.u64, size);
            Distillery::SBuffer buf(static_cast<unsigned char *>(data), size);
            process(ud.u64, buf);
        }
        virtual void process(uint32_t port, Distillery::SBuffer const & buf) = 0;
        void submit(uint32_t port, Distillery::SBuffer const & buf) 
        {
            submitToPort(port, const_cast<Distillery::SBuffer&>(buf).getPtr(), 
                         buf.getSerializedDataSize());
        }
        virtual void shutdown() = 0;
    };
};

#endif /* BABBLE_PE_H */
