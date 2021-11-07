

Start HDFS:

:~/hadoop-0.21.0> ./cleanstart-data.sh true 16
<--- snip --->
c0428b02e1: starting datanode, logging to /hadoop/souler/logs/hadoop-souler-datanode-c0428b02e1.hny.distillery.ibm.com.out
c0419b03e1: /homes/hny4/souler/.bashrc: line 15: /homes/hny4/souler/streamit/trunk/streams/include/dot-bashrc: No such file or directory
c0419b03e1: starting datanode, logging to /hadoop/souler/logs/hadoop-souler-datanode-c0419b03e1.hny.distillery.ibm.com.out
localhost: /homes/hny4/souler/.bashrc: line 15: /homes/hny4/souler/streamit/trunk/streams/include/dot-bashrc: No such file or directory
localhost: starting secondarynamenode, logging to /hadoop/souler/logs/hadoop-souler-secondarynamenode-c0419b02e1.hny.distillery.ibm.com.out

Namenode http address:
http://c0419b02e1.hny.distillery.ibm.com:13333

Go to that URL to see the status of file system.

Start the Job Tracker:

:~/hadoop-0.21.0> ./cleanstart-job.sh 
<--- snip --->
c0419b03e1: Warning: No xauth data; using fake authentication data for X11 forwarding.
c0419b03e1: /usr/bin/xauth:  error in locking authority file /homes/hny4/souler/.Xauthority
c0419b03e1: /homes/hny4/souler/.bashrc: line 15: /homes/hny4/souler/streamit/trunk/streams/include/dot-bashrc: No such file or directory
c0419b03e1: starting tasktracker, logging to /hadoop/souler/logs/hadoop-souler-tasktracker-c0419b03e1.hny.distillery.ibm.com.out

JobTracker http address:
http://c0419b02e1.hny.distillery.ibm.com:14444

Go to that URL to see the status of job tracker.


:~/babble/benchmarks/hadoop> hadoop fs -copyFromLocal input.txt input.txt


:~/babble/benchmarks/hadoop> hadoop fs -ls


export HADOOP_CLASSPATH=./weblog.jar
:~/weblog> hadoop jar ./weblog.jar WebLog /user/souler/input.txt output

:~/weblog> hadoop fs -ls
-rw-r--r--   3 souler supergroup      40000 2011-05-06 15:58 /user/souler/input.txt
drwxr-xr-x   - souler supergroup          0 2011-05-06 16:04 /user/souler/output

:~/weblog> hadoop fs -rm output/


