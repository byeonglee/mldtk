
This document describes how to run the fm readio benchmark application, Figure 4 (b) in the OOPSLA submission.

Step 1. Generate the input data set. 

soule$ ocaml q1.ml 100000000

This should create the file q1.data in the directory where you ran q1.ml.

Step 2. Put the data in the right location, on the correct machine.

soule$ mv q1.data /tmp

I have always put the data in the /tmp directory. It will have to be on the correct machine.

Step 3.  Run the River compiler. 

The script  ./run-streamit.sh will transform StreamIt to River IL to System
S. It assumes that a file "hosts.txt" is in the current directory. The hosts.txt
file is a newline separated list of hosts. There is an example in the common directory.

$ ./run-streamit.sh

Step 4. Optimize for Placement

You will need to remove unoptimized code that was just generated.
$ rm -rf MyApp

Copy the appropriate Brooklet file into place. fmradio_2.bk runs on two machines, and fmradio_4.bk runs on four machines.

$ cp benchmarks/fmradio_placement/fmradio_2.bk ./fmradio.bk

Generate new, optimized code based on the right Brooklet file.

$ ./run-placement-streamit.sh

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

Note that the sink, and output data file, q2-<processnumber>.data will be on the /tmp directory of the machine it ran on. You may need to ssh to that machine to get the result, or rcp it over.

soule$ more /tmp/stats-sink*


