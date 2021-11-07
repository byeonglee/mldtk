#!/bin/sh

################################################################################
#
# A demo / run script.
# Step 1. Convert CQL query to SRA
# Step 2. Convert SRA query to Brooklet
# Step 3. Convert Brooklet to System S
#
################################################################################

TEST=lock
BKLT_FILE=$TEST.bk
TMPLT=./watson/templates

if [ -d ./MyApp ];
then
  rm -rf ./MyApp
fi

java xtc.lang.babble.watson.Watson -logLevel error -hostFile ./hosts.txt  -user $USER -templatePath $TMPLT -toSystemS $BKLT_FILE
if [ -d ./FunctionEnv ];
then
    cp ./FunctionEnv/* MyApp/src/
else
    echo "Please copy function environment to MyApp/src"
fi




