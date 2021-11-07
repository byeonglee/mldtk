#!/bin/sh

TEST=origin-fast
SZ_FILE=../../../../fonda/babble_testsuite/sawzall/$TEST.sz
BKLT_FILE=$TEST.bk
FAST_FILE=./fast.bk
IMPL_FILE=./FunctionEnv/operators.ml
TMPLT=./watson/templates


if [ ! -f ./hosts.txt ];
then
    echo "ERROR: missing hosts.txt file."
    exit 1
fi


if [ ! -f ./parallel.opt ];
then
    echo "ERROR: missing parallel.opt file."
    exit 1
fi

java xtc.lang.babble.optimizer.Optimizer -spec parallel.opt -output $FAST_FILE -implFile $IMPL_FILE $BKLT_FILE

if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi
java xtc.lang.babble.watson.Watson -logLevel error -hostFile ./hosts.txt -user $USER -templatePath $TMPLT -toSystemS $FAST_FILE

cp fast-operator.ml MyApp/src/operators.ml 



