#!/bin/sh

################################################################################
#
# A demo / run script.
# Step 1. Convert Sawzall query to Brooklet
# Step 3. Convert Brooklet to System S
#
################################################################################

TEST=origin
SZ_FILE=../../../../fonda/babble_testsuite/sawzall/$TEST.sz
BKLT_FILE=$TEST.bk
TMPLT=./watson/templates

if [ -d ./FunctionEnv ];
then
    echo "\n\nRemoving existing FunctionEnv directory\n\n"
    rm -rf ./FunctionEnv
fi

java xtc.lang.babble.sawzall.Sawzall -analyze -output $BKLT_FILE -toBrooklet $SZ_FILE
if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi
java xtc.lang.babble.watson.Watson -host `hostname` -user $USER -templatePath $TMPLT -toSystemS $BKLT_FILE
if [ -d ./FunctionEnv ];
then
    cp ./FunctionEnv/* MyApp/src/
else
    echo "Please copy function environment to MyApp/src"
fi


# cleanu
#rm -f $SRA_FILE


