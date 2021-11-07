
HADOOP_HOME = ~souler/hadoop
CP = $(HADOOP_HOME)/hadoop-hop-0.2-core.jar:$(HADOOP_HOME):$(HADOOP_HOME)/hadoop-hop-0.2-tools.jar:$(HADOOP_HOME)
BIN_DIR =  ../classes

JFLAGS = -g -classpath $(CP) -d $(BIN_DIR)
JC = javac

.SUFFIXES: .java .class
.java.class:
	mkdir -p $(BIN_DIR); $(JC) $(JFLAGS) $*.java

CLASSES = \
        WordCount.java 

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class

# to build the jar:
# jar -cvf ~souler/wordcount.jar -C classes/ .

# To run:
#  hadoop jar wordcount.jar org.myorg.WordCount input-hdfs output-wc
