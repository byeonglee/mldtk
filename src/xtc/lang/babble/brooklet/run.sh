#!/bin/sh

#BK_FILE=../../../../../fonda/babble_testsuite/brooklet/sawzall.bk
#BK_FILE=../../../../../fonda/babble_testsuite/brooklet/fusion.bk
#BK_FILE=./bargain.bk
#BK_FILE=./now.bk
BK_FILE=./case1.bk

cat $BK_FILE
java xtc.lang.babble.brooklet.Brooklet -printAST -printSource $BK_FILE 
