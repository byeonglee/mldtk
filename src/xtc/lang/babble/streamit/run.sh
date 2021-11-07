#!/bin/sh

#FILE=mpeg.str
#FILE=pipe.str
#FILE=pipe-split.str
#FILE=test.str
FILE=fmradio.str

ST_FILE=../../../../../fonda/babble_testsuite/streamit/$FILE
#ST_FILE=./$FILE

IMPL_FILE=../operators/ml/fmradio-operators.ml

cat $ST_FILE
#java xtc.lang.babble.streamit.StreamIt -printAST -printSource $ST_FILE
#java xtc.lang.babble.streamit.StreamIt -printAST -printSource -implFile $IMPL_FILE -toBrooklet $ST_FILE
java xtc.lang.babble.streamit.StreamIt -implFile $IMPL_FILE -toBrooklet $ST_FILE
