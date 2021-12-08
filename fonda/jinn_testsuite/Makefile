default: programs

ifdef JAVA_DEV_ROOT
ifndef JAVAC
JAVAC = javac
endif
DJAVAC = $(JAVAC) -classpath . -source 1.5 -g

ifdef JAVA_HOME
  DLL_CC  = $(CC) -fPIC -g -shared -I $(JAVA_HOME)/include -I $(JAVA_HOME)/include/linux -o
  DLL_PREFIX = lib
  DLL_SUFFIX = .so
  JNI_DLL_SUFFIX = $(DLL_SUFFIX)
endif

# JNI programs
PROGS=$(basename $(wildcard *.java))

.PHONY: programs test clean

programs:  $(addsuffix .class,$(PROGS)) $(addsuffix $(JNI_DLL_SUFFIX),$(addprefix $(DLL_PREFIX),$(PROGS)))

%.class: %.java
	$(DJAVAC) $<

$(DLL_PREFIX)%$(JNI_DLL_SUFFIX): %.c
	$(DLL_CC)$@ $<

test: programs
	perl jinn.test.pl

clean: 
	for P in $(PROGS);do \
	  rm -f $${P}.class ${DLL_PREFIX}$${P}${JNI_DLL_SUFFIX};\
	done
	rm -f *~

else
  $(error  JAVA_DEV_ROOT is not set)
endif
