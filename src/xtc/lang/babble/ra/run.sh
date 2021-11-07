#!/bin/sh

RA_FILE=../../../../../fonda/babble_testsuite/ra/aggregate.ra

cat $RA_FILE
java xtc.lang.babble.ra.RA -printAST -printSource -analyze -printSymbolTable  $RA_FILE 
#java xtc.lang.babble.ra.RA -printAST -printSource $RA_FILE 
