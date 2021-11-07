
HADOOP_HOME = /Users/soule/hadoop
HADOOP_VERSION = 0.21.0
BIN_DIR =  ../classes
JC = javac

CP = $(HADOOP_HOME)/hadoop-common-$(HADOOP_VERSION).jar:$(HADOOP_HOME)/hadoop-mapred-$(HADOOP_VERSION).jar

JFLAGS = -g -classpath $(CP) -d $(BIN_DIR)

.SUFFIXES: .java .class
.PRECIOUS: %/.d

.java.class:
	mkdir -p $(BIN_DIR); $(JC) $(JFLAGS) $*.java

CLASSES = \
        WebLog.java \
	Identity.java 

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) $(BIN_DIR)/*.class


# to build the jar:
# jar -cvf ~souler/wordcount.jar -C classes/ .

# To run:
#  hadoop jar wordcount.jar org.myorg.WordCount input-hdfs output-wc
