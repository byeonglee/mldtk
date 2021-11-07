
This document describes how to run the coarse benchmark application, Figure 6 in the OOPSLA submission.

Step 1.  Put the Brooklet file in the proper location

$ cd src/xtc/lang/babble
$ cp locking/exp1/lock.bk .


Step 2.  Run the River compiler. 

The script  run-lock.sh will transform the lock.bk file  to System
S. It assumes that a file "hosts.txt" is in the current directory. The hosts.txt
file is a newline separated list of hosts. There is an example in the common directory.

$ ./run-lock.sh

Step 3: Copy the implementations into the right location

$ cd MyApp/src
$ cp ../../locking/exp1/operators.ml .
$ cp ../../locking/exp1/Submit.h .
$ cp ../../locking/exp1/Submit.cpp .


Step 4: Edit the cost of the operator. 

There are two lines in operators.ml like:

      ignore (Unix.select [] [] [] 1.0);

You will need to edit the value of 1.0 to change the delay of the operators. 

Step 4.  Compile the code

soule$ cd MyApp/src/
soule$ make

Step 5.  Start System S (if not already running)

soule$ cd ..
soule$ ./start.sh

Step 6.  Submit the job
soule$ streamtool submitjob config/app.jdl 

Step 7. After it has run, cancel the job, collect the results
soule$ streamtool canceljob 0

Each operator produces a file with its statistics in /tmp. The files are nameds stat-<processnumber>

soule$ ls -la /tmp/stats*

The results will be in /tmp/stats-sink-*.txt

