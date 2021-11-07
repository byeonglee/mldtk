#!/bin/sh

FILE=origin.sz

SZ_FILE=../../../../../fonda/babble_testsuite/sawzall/$FILE
#SZ_FILE=./$FILE

cat $SZ_FILE
#java xtc.lang.babble.sawzall.Sawzall -printAST -printSource -analyze -printSymbolTable $SZ_FILE
#java xtc.lang.babble.sawzall.Sawzall -analyze -printSymbolTable $SZ_FILE
java xtc.lang.babble.sawzall.Sawzall -printAST -printSource -analyze -printSymbolTable -toBrooklet $SZ_FILE
