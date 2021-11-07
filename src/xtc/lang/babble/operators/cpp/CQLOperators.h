#ifndef _CQL_OPERATORS_H_
#define _CQL_OPERATORS_H_

#include "../watson/templates/babble.h"

// void wrapS2R(BabbleBuffer dq, BabbleUInt32 index, BabbleBuffer dv);
// void wrapR2S(BabbleBuffer dq, BabbleUInt32 index, BabbleBuffer dv);
// void wrapR2R(BabbleBuffer buffer); 


BabbleReturn* nowOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* projectOp(BabbleBuffer inBuf, BabbleUInt32 port);
BabbleReturn* istreamOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* dstreamOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* rstreamOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* unboundedOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* slidingTimeBasedOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* slidingRowBasedOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* selectOp(BabbleBuffer inBuf, BabbleUInt32 port);
BabbleReturn* aggregateOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* unionOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);
BabbleReturn* joinOp(BabbleBuffer inBuf, BabbleUInt32 port, void* inVar);


#endif

