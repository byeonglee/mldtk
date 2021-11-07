#!/bin/sh

TEST=linearroad
CQL_FILE=../../../../fonda/babble_testsuite/cql/$TEST.cql
SRA_FILE=$TEST.sra
BKLT_FILE=$TEST.bk
FAST_FILE=./fast.bk
IMPL_FILE=./FunctionEnv/operators.ml
TMPLT=./watson/templates

java xtc.lang.babble.optimizer.Optimizer -spec fuse.opt -output $FAST_FILE -implFile $IMPL_FILE $BKLT_FILE

if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi

java xtc.lang.babble.watson.Watson -logLevel error -hostFile ./hosts.txt -user $USER -templatePath $TMPLT -toSystemS $FAST_FILE

cp fast-operator.ml MyApp/src/operators.ml

