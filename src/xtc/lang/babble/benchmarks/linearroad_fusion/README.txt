
This document describes how to run the linear road benchmark application with fusion, Figure 4 (a) in the OOPSLA submission.

Step 1. Generate the input data set. 

soule$ ocaml toll_str-loop.ml 100000000

This should create the file pos_speed_str.data in the directory where you ran toll_str-loop.ml.

Step 2. Put the data in the right location, on the correct machine.

soule$ mv pos_speed_str.data /tmp

I have always put the data in the /tmp directory. It will have to be on the correct machine.

Step 3.  Run the River compiler. 

The script  ./run-linearroad.sh will transform CQL to SRA to River IL to System
S. It assumes that a file "hosts.txt" is in the current directory. The hosts.txt
file is a newline separated list of hosts. There is an example in the common directory.

$ ./run-linearroad.sh

Step 4. Optimize for Fusion

Copy the appropriate Brooklet file into place. linearroad_2.bk runs on two machines, and linearroad_4.bk runs on four machines.
$ cp benchmarks/linearroad_placement/linearroad_2.bk ./linearroad.bk

Copy the optimizer dependency file in to place

$ cp benchmarks/linearroad_placement/fuse.opt ./fuse.opt

Generate new, optimized code based on the right Brooklet file.

$ run-fuse-linearroad.sh

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

This sink has a slightly different naming convention. It is named stat-sink-<processnumber>.

Note that the sink, and output data file, toll_str-<processnumber>.data will be on the /tmp directory of the machine it ran on. You may need to ssh to that machine to get the result, or rcp it over.

soule$ more /tmp/stats-sink*

There is a script in benchmarks/common/get-stats.sh If you run this script, and provide as input a file with the lists of hosts, it will rcp all /tmp/stats-* files to your local directory.

soule$ get-stats.sh hosts.txt

