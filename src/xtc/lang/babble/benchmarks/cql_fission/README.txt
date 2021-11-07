
This document describes how to run the cql fission benchmark application, Figure 4 (d) in the OOPSLA submission.

Step 1. Generate the input data set. 

soule$ ocaml origin.ml 100000000 16

This should create n files where n is the number of partitions. The files are named
named logs_[0-(n-1)].data,  in the directory where you ran origin.ml.

Step 2. Put the data in the right location, on the correct machine.
Use the script send.sh to place the files on the right machines for you. 
The first argument is the list of available hosts, and the second argument
 is the number of hosts you want to send the data to. 

soule$ ./send.sh ~/babble/hosts.txt 2

The data files will be placed on the /tmp directory on each machine.

Step 3.  Run the River compiler. 

The script  run-cql.sh will transform SRA to CQL to River IL to System
S. It assumes that a file "hosts.txt" is in the current directory. The hosts.txt
file is a newline separated list of hosts. There is an example in the common directory.

$ ./run-cql.sh

Step 4. Optimize for Placement

Copy the appropriate Brooklet file into place.

$ cp benchmarks/cql_fission/hits-fast.bk ./hits-fast.bk 

The file run-parallel-cql.sh will apply the optimization. It expects that
the file parallel.opt is in the local directory. You will need to edit this file
to specify the degree of parallelism. In particular, specify the number in the line:

opt rep     = ReplicationOptimizer(64);

Then run the script:

$ run-parallel-cql.sh

Step 5.  Compile the generated code

soule$ cd MyApp/src/
soule$ make

Step 6.  Start System S (if not already running)

soule$ cd ..
soule$ ./start.sh

Step 7.  Submit the job
soule$ streamtool submitjob config/app.jdl 

Step 8. After it has run, cancel the job, collect the results
soule$ streamtool canceljob 0

Each operator produces a file with its statistics in /tmp. The files are nameds stat-<processnumber>

soule$ ls -la /tmp/stats*

The sinks will write their data to a file /tmp/hits_[n]-<processnumber>.data.

soule$ ls -la /tmp/hits*.data

There is a script in benchmarks/common/get-stats.sh If you run this script, and
provide as input a file with the lists of hosts, it will rcp all /tmp/stats-*
files to your local directory.

soule$ get-stats.sh hosts.txt

Since there will be many stats-sink-* files. I have a scripts that
will read all of them in, and produce the result data. The file is
benchmarks/common/count.pl. 

soule$ count.pl


