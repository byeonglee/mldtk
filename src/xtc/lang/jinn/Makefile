PACKAGE     = xtc.lang.jinn
PACKAGE_LOC = xtc/lang/jinn
SOURCE = $(wildcard *.java)
JNI_SOURCE = 
JAR_EXTRAS = 

ifdef JAVA_DEV_ROOT
include $(JAVA_DEV_ROOT)/Makerules

JAVAC_OPTIONS  = -g -Xlint:unchecked -d $(CLASS_DIR) -sourcepath $(SOURCE_DIR)
AGENT_SOURCES=Agent.java AgentVariable.java
AGENT_CLASS_DIR=$(JAVA_DEV_ROOT)/classes/xtc/lang/jinn/
AGENT_CLASSES=$(addprefix $(AGENT_CLASS_DIR),$(patsubst	%.java,%.class,$(AGENT_SOURCES)))
AGENT_C_SOURCE_FILES=agent.c agent_main.c util.c state.c \
  j2c_proxy.c c2j_proxy.c agent_class.c options.c jnicheck.c
ARCH=$(shell arch)

DLL_CC  = gcc -fPIC -lm -g -Og -shared -I $(JAVA_HOME)/include -I $(JAVA_HOME)/include/linux -o
AGENT_DLL=$(JAVA_DEV_ROOT)/bin/libjinn.so
ifeq ($(ARCH), x86_64)
  AGENT_C_SOURCE_FILES += arch_x86_64.c
  AGENT_C_SOURCE_FILES += arch_x86_64.S
else ifeq ($(ARCH), i686)
  AGENT_C_SOURCE_FILES += arch_x86_32.c
else
  $(error agent does not yet support $(shell arch))
endif

.PHONY: default agent cleanagent

default: classes

classes: agent

clean: cleanagent

agent: $(AGENT_DLL) 

$(AGENT_DLL): $(AGENT_C_SOURCE_FILES) 
	$(DLL_CC)$@ $(AGENT_C_SOURCE_FILES)

c2j_proxy.c: GenerateJNIFunctionProxy.java $(CLASS)
	java -ea xtc.lang.jinn.GenerateJNIFunctionProxy -o c2j_proxy.c

agent_class.c: $(AGENT_CLASSES) $(CLASS)
	java -ea xtc.lang.jinn.GenerateHardcodedJavaClass \
	-h agent_class.h -o agent_class.c \
	class_agent $(AGENT_CLASS_DIR)/Agent.class \
	class_agent_variable $(AGENT_CLASS_DIR)/AgentVariable.class \
	class_agent_jni_assertion_failure $(AGENT_CLASS_DIR)/JNIAssertionFailure.class

cleanagent: 
	rm -f $(AGENT_DLL)

endif
