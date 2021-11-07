ifeq ($(CXX),)
CXX=g++
endif
DPS_SCRIPTS := $(HOME)/InfoSphereStreams.x86_64/bin/scripts
DPS_UDO_INCLUDE := ../../src
PKGCONFIG = $(HOME)/InfoSphereStreams.x86_64/bin/dst-pe-pkg-config.sh
PE_INCLUDE =
PE_LIB =
PE_INCLUDE += `$(PKGCONFIG) --cflags dst-pe-install`
PE_LIB += `$(PKGCONFIG) --libs dst-pe-install`
PE_INCLUDE += `$(PKGCONFIG) --cflags dst-spd-pe-install`
PE_LIB += `$(PKGCONFIG) --libs dst-spd-pe-install`
PE_LIB += `$(PKGCONFIG) --libs dst-perlc`
EXTERNAL_LIB_UDO_INCLUDE :=
SPC_APPL_MAIN := $(HOME)/InfoSphereStreams.x86_64/lib/agentmain.o
EXTERNAL_LIB_UDO_LIBS :=
CXXFLAGS = -O3 -DNDEBUG -DSPADE_OPTIMIZATION -finline-functions -Wall -Werror -D_REENTRANT -fPIC -fmessage-length=0 -I. -I../../src $(EXTERNAL_LIB_UDO_INCLUDE) $(PE_INCLUDE)
.PHONY: distclean clean

EXECS = \
Aggregate \
DStream \
IStream \
Join \
Now \
Project \
RStream \
Select \
SlidingRowBased \
SlidingTimeBased \
Unbounded \
Union

OBJS = $(SRCS:.cpp=.o)

#top level target
all: $(EXECS)

Aggregate: Aggregate.o AggregateOp.o 
	$(CXX) $(CXXFLAGS) -g -o $@ Aggregate.o AggregateOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

DStream: DStream.o DStreamOp.o 
	$(CXX) $(CXXFLAGS) -g -o $@ DStream.o DStreamOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

IStream: IStream.o IStreamOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ DStream.o DStreamOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Join: Join.o JoinOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ Join.o JoinOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Now: Now.o NowOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ Now.o NowOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Project: Project.o ProjectOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ Project.o ProjectOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

RStream: RStream.o RStreamOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ RStream.o RStreamOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Select: Select.o SelectOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ Select.o SelectOp.o  $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

SlidingRowBased: SlidingRowBased.o SlidingRowBasedOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ SlidingRowBased.o SlidingRowBasedOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

SlidingTimeBased: SlidingTimeBased.o SlidingTimeBasedOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ SlidingTimeBased.o SlidingTimeBasedOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Unbounded: Unbounded.o UnboundedOp.o  
	$(CXX) $(CXXFLAGS) -g -o $@ Unbounded.o UnboundedOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

Union: Union.o UnionOp.o 
	$(CXX) $(CXXFLAGS) -g -o $@ Union.o UnionOp.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

SUFFIXES : .cpp .o

.cpp.o:
	$(CXX) $(CXXFLAGS) -g -c $<

clean:
	rm *.o $(EXECS)

