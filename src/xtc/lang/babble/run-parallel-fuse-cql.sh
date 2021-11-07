#!/bin/sh

################################################################################
#
# A demo / run script.
# Step 1. Convert CQL query to SRA
# Step 2. Convert SRA query to Brooklet
# Step 3. Convert Brooklet to System S
#
################################################################################

#TEST=linearroad
TEST=hits-fast
#TEST=istream-project
#TEST=bargain
CQL_FILE=../../../../fonda/babble_testsuite/cql/$TEST.cql
SRA_FILE=$TEST.sra
BKLT_FILE=$TEST.bk
REP_FILE=./rep.bk
FUSE_FILE=./fuse.bk
IMPL_FILE=./FunctionEnv/operators.ml
TMPLT=./watson/templates

#java xtc.lang.babble.cql.CQL -analyze -output $SRA_FILE -toSRA $CQL_FILE 
#if [ -d ./FunctionEnv ];
#then
#    echo "\n\nRemoving existing FunctionEnv directory\n\n"
#    rm -rf ./FunctionEnv
#fi
#java xtc.lang.babble.sra.SRA -analyze -output $BKLT_FILE -toBrooklet $SRA_FILE
#if [ -d ./MyApp ];
#then
#    echo "\n\nRemoving existing MyApp directory\n\n"
#    rm -rf ./MyApp
#fi


java xtc.lang.babble.optimizer.Optimizer -spec parallel.opt -output $REP_FILE -implFile $IMPL_FILE $BKLT_FILE
mv ./fast-operator.ml ./rep-operators.ml

java xtc.lang.babble.optimizer.Optimizer -spec fuse.opt -output $FUSE_FILE -implFile ./rep-operators.ml ./hits-fused.bk


if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi

java xtc.lang.babble.watson.Watson -logLevel error -hostFile ./hosts.txt -user $USER -templatePath $TMPLT -toSystemS $FUSE_FILE

cp ./fast-operator.ml MyApp/src/operators.ml

#if [ -d ./FunctionEnv ];
#then
#    cp ./FunctionEnv/* MyApp/src/
#else
#    echo "Please copy function environment to MyApp/src"
#fi


# cleanu
#rm -f $SRA_FILE


