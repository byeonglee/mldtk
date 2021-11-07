#!/bin/sh

################################################################################
#
# A demo / run script.
# Step 1. Convert StreamIt query to Brooklet
# Step 3. Convert Brooklet to System S
#
################################################################################

TEST=fmradio
STR_FILE=../../../../fonda/babble_testsuite/streamit/$TEST.str
BKLT_FILE=$TEST.bk
TMPLT=./watson/templates
IMPL_FILE=./operators/ml/fmradio-operators.ml

if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi


if [ ! -f ./hosts.txt ];
then
    echo "ERROR: missing hosts.txt file."
    exit 1
fi

java xtc.lang.babble.watson.Watson -logLevel error -hostFile ./hosts.txt -user $USER -templatePath $TMPLT -toSystemS $BKLT_FILE
if [ -d ./FunctionEnv ];
then
    cp ./FunctionEnv/* MyApp/src/
else
    echo "Please copy function environment to MyApp/src"
fi




