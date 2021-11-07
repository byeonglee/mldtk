#!/bin/sh

#BK_FILE=../../../../../fonda/babble_testsuite/brooklet/project.bk
#BK_FILE=../../../../../fonda/babble_testsuite/brooklet/istream-project.bk
BK_FILE=../../../../../fonda/babble_testsuite/brooklet/equiv.bk

cat $BK_FILE
java xtc.lang.babble.watson.Watson -host `hostname` -user $USER -toSystemS $BK_FILE
#java xtc.lang.babble.watson.Watson -hostFile ./hosts.txt -user $USER -toSystemS $BK_FILE

#if [ -d ../FunctionEnv ];
#then
#    cp ../FunctionEnv/* MyApp/src/
#else
#    echo "Please copy function environment to MyApp/src"
#fi 

