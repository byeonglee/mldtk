default: programs

ifdef JAVA_DEV_ROOT
ifndef JAVAC
JAVAC = javac
endif
DJAVAC = $(JAVAC) -classpath . -source 1.5 -g
DLL_CC  = $(CC) -g -fPIC -shared -I $(JAVA_HOME)/include -I $(JAVA_HOME)/include/linux -o
DLL_PREFIX = lib
DLL_SUFFIX = .so
JNI_DLL_SUFFIX = $(DLL_SUFFIX)

JEANNIE = $(JAVA_DEV_ROOT)/src/xtc/lang/jeannie/jeannie.sh

# JNI programs
JNI_PROGS=PingPong CompoundData BadErrorChecking BadNullArgument
TEST_PROGS=$(basename $(basename $(wildcard *.test.exp)))
JEANNIE_PROGS=$(basename $(wildcard *.jni))
PROGS=$(JNI_PROGS) $(JEANNIE_PROGS)

.PHONY: programs jni_programs jeannie_programs test clean

programs: jni_programs jeannie_programs

jni_programs: $(addsuffix .class,$(JNI_PROGS)) $(addsuffix $(JNI_DLL_SUFFIX),$(addprefix $(DLL_PREFIX),$(JNI_PROGS)))

jeannie_programs: $(JEANNIE_PROGS)

test: programs *.test.exp
	for P in $(TEST_PROGS);do env CLASSPATH=.:$(CLASSPATH) expect $${P}.test.exp;done


%: %.jni
	@if [ ! -f $@.class ];then $(JEANNIE) -g JeannieMain.jni; cp JeannieMain.jni.symbols.ref JeannieMain.jni.symbols;fi

%.class: %.java
	$(DJAVAC) $<

$(DLL_PREFIX)%$(JNI_DLL_SUFFIX): %.c
	$(DLL_CC)$@ $<

clean: 
	rm -f *~ lib*.so *.dll *.class *.ilk  *.pdb *.lib *.obj
	rm -f JeannieMain.i JeannieMain.java JeannieMain.jni.i JeannieMain.jni.pp JeannieMain.jni.symbols
else
  $(error  JAVA_DEV_ROOT is not set)
endif
