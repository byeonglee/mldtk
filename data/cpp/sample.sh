#!/bin/bash

# This script gathers a sample of files from a list of output timings.
# The input is in rows that look like "file, start, finish".  The
# stride variable controls how many rows to skip between each sample
# file.  This script will then print the total time the sample should
# take.

stride=$1
if [ -z $stride ]; then
    stride=38
fi
cat linuxTestCase.preproc.time | egrep "^.+,.+,.+$" \
| awk -F, '{print echo $3 - $2, $1}' | sort -n \
| awk -v stride=$stride '
BEGIN{
count = 1;
print $2;
time = $1;
}
{
if ((count % stride) == 0) {
  print $2;
  time += $1;
}
count++;
}
END{
print $2
time += $1;
print "total time: ", time | "cat 1>&2";
}
'

