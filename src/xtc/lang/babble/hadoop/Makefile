
#HADOOP_HOME = /Users/soule/hadoop
HADOOP_HOME = /homes/hny4/souler/hadoop
HADOOP_VERSION = 0.21.0
CP = $(HADOOP_HOME)/hadoop-common-$(HADOOP_VERSION).jar:$(HADOOP_HOME)/hadoop-mapred-$(HADOOP_VERSION).jar:$(HADOOP_HOME)/hadoop-hdfs-$(HADOOP_VERSION).jar:$(HADOOP_HOME)/hadoop-mapred-tools-$(HADOOP_VERSION).jar
BIN_DIR =  ./classes

JFLAGS = -g -classpath $(CP) -d $(BIN_DIR)
JC = javac

#EXEC=./identity.jar
EXEC=./weblog.jar

default: jar

jar: 
	jar -cvf $(EXEC) -C classes/ .

clean:
	$(RM) *.class

# to build the jar:
# jar -cvf ~souler/wordcount.jar -C classes/ .

# To run:
#  hadoop jar wordcount.jar org.myorg.WordCount input-hdfs output-wc
