#!/bin/sh

################################################################################
#
# A demo / run script.
# Step 1. Convert CQL query to SRA
# Step 2. Convert SRA query to Brooklet
# Step 3. Convert Brooklet to System S
#
################################################################################

TEST=linearroad
CQL_FILE=../../../../fonda/babble_testsuite/cql/$TEST.sz
BKLT_FILE=../../../../fonda/babble_testsuite/optimizer/$TEST.bk
FAST_FILE=./fast.bk
IMPL_FILE=./FunctionEnv/operators.ml
TMPLT=./watson/templates

#java xtc.lang.babble.cql.CQL -analyze -output $SRA_FILE -toSRA $CQL_FILE
#if [ -d ./FunctionEnv ];
#then
#    echo "\n\nRemoving existing FunctionEnv directory\n\n"
#    rm -rf ./FunctionEnv
#fi
#java xtc.lang.babble.sra.SRA -analyze -output $BKLT_FILE -toBrooklet $SRA_FILE


#fi

#java xtc.lang.babble.sawzall.Sawzall -analyze -output $BKLT_FILE -toBrooklet $SZ_FILE

java xtc.lang.babble.optimizer.Optimizer -fuse -output $FAST_FILE -implFile $IMPL_FILE $BKLT_FILE

if [ -d ./MyApp ];
then
    echo "\n\nRemoving existing MyApp directory\n\n"
    rm -rf ./MyApp
fi
java xtc.lang.babble.watson.Watson -logLevel debug -user $USER -templatePath $TMPLT -toSystemS $FAST_FILE

cp fast-operator.ml MyApp/src/operators.ml 

#if [ -d ./FunctionEnv ];
#then
#    cp ./FunctionEnv/* MyApp/src/
#else
#    echo "Please copy function environment to MyApp/src"
#fi


# cleanu
#rm -f $SRA_FILE


