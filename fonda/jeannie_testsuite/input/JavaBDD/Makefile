# (C) Copyright IBM Corp 2005-2007.

# main targets:
#   javabdd             -- builds all (base and Jeannie) libraries
#   javabdd_base        -- builds non-Jeannie (pure Java and JNI) libraries
#   javabdd_jeannie     -- builds Jeannie-BuDDy library
#   testjavabdd         -- tests all (base and Jeannie) libraries
#   testjavabdd_base    -- tests non-Jeannie (pure Java and JNI) libraries
#   testjavabdd_jeannie -- tests Jeannie-BuDDy library

# put default target before include, otherwise it gets hidden
default: test

ifdef JAVA_DEV_ROOT

JEANNIE_TEST_DIR = $(JAVA_DEV_ROOT)/fonda/jeannie_testsuite
JAVABDD_DIR = $(JEANNIE_TEST_DIR)/input/JavaBDD
FIND = find

include $(JAVA_DEV_ROOT)/Makerules
include $(JEANNIE_TEST_DIR)/Makerules

JAVABDD_JAVA = $(JAVA) -cp $(JAVABDD_DIR)
JAVABDD_EXAMPLE_SOURCES = $(JAVABDD_DIR)/NQueens.java \
	$(JAVABDD_DIR)/RubiksCube.java
JAVABDD_EXAMPLE_CLASSFILES = $(JAVABDD_EXAMPLE_SOURCES:%.java=%.class)
JAVABDD_SOURCES = $(JAVABDD_DIR)/net/sf/javabdd/BDD.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BDDBitVector.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BDDDomain.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BDDException.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BDDFactory.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BDDPairing.java \
	$(JAVABDD_DIR)/net/sf/javabdd/BuDDyFactory.java \
	$(JAVABDD_DIR)/net/sf/javabdd/FindBestOrder.java \
	$(JAVABDD_DIR)/net/sf/javabdd/JFactory.java \
	$(JAVABDD_DIR)/net/sf/javabdd/MicroFactory.java \
	$(JAVABDD_DIR)/net/sf/javabdd/TestBDDFactory.java \
	$(JAVABDD_DIR)/net/sf/javabdd/TryVarOrder.java \
	$(JAVABDD_DIR)/net/sf/javabdd/TypedBDDFactory.java
JAVABDD_JNI_HEADER = $(JAVABDD_DIR)/buddy_jni.h
JAVABDD_JNI_SRC = $(JAVABDD_DIR)/buddy/src
JAVABDD_JNI_INCLUDES = -I$(JAVABDD_DIR) -I$(JAVABDD_JNI_SRC) -I$(JAVABDD_JNI_SRC)/..
JAVABDD_JNI_DLL = $(JAVABDD_DIR)/$(DLL_PREFIX)buddy$(JNI_DLL_SUFFIX)
JAVABDD_JNI_CLASSNAMES = net.sf.javabdd.BuDDyFactory \
	net.sf.javabdd.BuDDyFactory\$$BuDDyBDD \
	net.sf.javabdd.BuDDyFactory\$$BuDDyBDDDomain \
	net.sf.javabdd.BuDDyFactory\$$BuDDyBDDPairing
JAVABDD_JNI_SOURCES = \
	$(JAVABDD_JNI_SRC)/bddio.c $(JAVABDD_JNI_SRC)/bddop.c \
	$(JAVABDD_JNI_SRC)/bvec.c $(JAVABDD_JNI_SRC)/cache.c \
	$(JAVABDD_JNI_SRC)/fdd.c $(JAVABDD_JNI_SRC)/imatrix.c \
	$(JAVABDD_JNI_SRC)/kernel.c $(JAVABDD_JNI_SRC)/pairs.c \
	$(JAVABDD_JNI_SRC)/prime.c $(JAVABDD_JNI_SRC)/reorder.c \
	$(JAVABDD_JNI_SRC)/tree.c $(JAVABDD_JNI_SRC)/trace.c
JAVABDD_JNI_OBJS = $(JAVABDD_DIR)/buddy_jni.o $(JAVABDD_JNI_SOURCES:.c=.o)
JAVABDD_JEANNIE_STEM = $(JAVABDD_DIR)/net/sf/javabdd/JeannieBuDDyFactory
JAVABDD_JEANNIE_DLL = $(JAVABDD_DIR)/net/sf/javabdd/$(DLL_PREFIX)JeannieBuDDyFactory$(JNI_DLL_SUFFIX)

test: testjavabdd_base testjavabdd_jeannie

testjavabdd_base: javabdd_base $(JAVABDD_EXAMPLE_CLASSFILES)
	export DPATH=$(JAVABDD_DIR); \
	export LD_LIBRARY_PATH=$$DPATH:"$$LD_LIBRARY_PATH"; \
	$(JAVABDD_JAVA) -Djava.library.path=$$DPATH -Dbdd=buddy NQueens 8; \
	$(JAVABDD_JAVA) -Djava.library.path=$$DPATH -Dbdd=java  NQueens 8; \
	$(JAVABDD_JAVA) -Djava.library.path=$$DPATH -Dbdd=buddy RubiksCube

testjavabdd_jeannie: javabdd_jeannie $(JAVABDD_EXAMPLE_CLASSFILES)
	export DPATH=$(JAVABDD_DIR)/net/sf/javabdd; \
	export LD_LIBRARY_PATH=$$DPATH:"$$LD_LIBRARY_PATH"; \
	$(JAVABDD_JAVA) -Djava.library.path=$$DPATH -Dbdd=jeannie NQueens 8; \
	$(JAVABDD_JAVA) -Djava.library.path=$$DPATH -Dbdd=jeannie RubiksCube

javabdd: javabdd_base javabdd_jeannie

javabdd_base: $(JAVABDD_EXAMPLE_CLASSFILES) $(JAVABDD_JNI_DLL)

$(JAVABDD_JNI_DLL): $(JAVABDD_JNI_OBJS)
	$(DLL_CC) -lm -o $@ $(JAVABDD_JNI_OBJS)

$(JAVABDD_DIR)/buddy_jni.o: $(JAVABDD_JNI_HEADER)

.c.o:
	$(CC) $(JAVABDD_JNI_INCLUDES) -c -o $@ $<

$(JAVABDD_JNI_HEADER): $(JAVABDD_EXAMPLE_CLASSFILES)
	$(JAVAH) -classpath $(JAVABDD_DIR) -jni -o $@ $(JAVABDD_JNI_CLASSNAMES)

$(JAVABDD_EXAMPLE_CLASSFILES): $(JAVABDD_SOURCES) $(JAVABDD_EXAMPLE_SOURCES) javabdd_jeannie
	$(JAVAC) -cp $(JAVABDD_DIR) $(JAVABDD_EXAMPLE_SOURCES)

javabdd_jeannie: $(JAVABDD_JEANNIE_STEM).jni \
                 $(JAVABDD_SOURCES) $(JAVABDD_JNI_SOURCES)
	$(JAVA_DEV_ROOT)/src/xtc/lang/jeannie/jeannie.sh -g \
          -lm $(JAVABDD_JNI_INCLUDES) \
          net/sf/javabdd/JeannieBuDDyFactory.jni $(JAVABDD_JNI_SOURCES)

cleanall:
	$(RM) -f $(JAVABDD_DIR)/*~ $(JAVABDD_DIR)/net/sf/javabdd/*.class $(JAVABDD_JNI_HEADER) $(JAVABDD_JNI_OBJS) $(JAVABDD_EXAMPLE_CLASSFILES)
	$(RM) -f $(JAVABDD_JEANNIE_DLL) $(JAVABDD_JNI_DLL)
	$(RM) -f $(JAVABDD_JEANNIE_STEM).jni.pp $(JAVABDD_JEANNIE_STEM).jni.i $(JAVABDD_JEANNIE_STEM).java $(JAVABDD_JEANNIE_STEM).i $(JAVABDD_JEANNIE_STEM).o $(JAVABDD_JEANNIE_STEM).class $(JAVABDD_JEANNIE_STEM).jni.symbols

endif
