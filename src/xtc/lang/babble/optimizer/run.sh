#!/bin/sh

#FILE=case1.bk
#FILE=case2.bk
#FILE=case2b.bk
#FILE=case3.bk
#FILE=case4.bk
FILE=origin.bk
#FILE=hits.bk
#FILE=fuse1.bk
#FILE=linearroad.bk
#IMPL_FILE=../sra/FunctionEnv/operators.ml
IMPL_FILE=../FunctionEnv/operators.ml

BK_FILE=../../../../../fonda/babble_testsuite/optimizer/$FILE

cat $BK_FILE
#java xtc.lang.babble.optimizer.Optimizer -spec sample.opt -implFile $IMPL_FILE $BK_FILE 
java xtc.lang.babble.optimizer.Optimizer -spec applyfuse.opt -implFile $IMPL_FILE $BK_FILE 
#java xtc.lang.babble.optimizer.Optimizer -parallel 2 -implFile $IMPL_FILE $BK_FILE 
#java xtc.lang.babble.optimizer.Optimizer -fuse -output fast.bk -implFile $IMPL_FILE $BK_FILE 
#java xtc.lang.babble.optimizer.Optimizer -fuse -implFile $IMPL_FILE $BK_FILE 
