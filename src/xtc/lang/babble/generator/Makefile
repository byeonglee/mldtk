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

EXEC = gen
SRCS = main.cpp
OBJS = ${SRCS:.cpp=.o}

#pe:
#        $(CXX) $(CXXFLAGS) -o $@ $(SPC_APPL_MAIN) $^ $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)
#%.dpe:
#        $(CXX) $(CXXFLAGS) -fPIC -shared -o $@ $^ $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

#top level target
all: $(EXEC)

$(EXEC): main.o
	$(CXX) $(CXXFLAGS) -g -o $@ main.o $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)
#	$(CXX) $(CXXFLAGS) -o $@ $(SPC_APPL_MAIN) $^ $(EXTERNAL_LIB_UDO_LIBS) $(PE_LIB) $(LDFLAGS)

SUFFIXES : .cpp .o

.cpp.o:
	$(CXX) $(CXXFLAGS) -g -c $<

clean:
	rm $(OBJS) $(EXEC)

