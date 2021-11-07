#!/bin/sh

FILE=linearroad.sra
#FILE=hits.sra
#FILE=istream-project.sra
#FILE=bargain.sra

#FILE=aggregate.sra		

#SRA_FILE=../../../../../fonda/babble_testsuite/sra/$FILE
SRA_FILE=./$FILE

cat $SRA_FILE
#java xtc.lang.babble.sra.SRA -printAST -printSource -analyze -printSymbolTable $SRA_FILE 
java xtc.lang.babble.sra.SRA -analyze -toBrooklet $SRA_FILE 
#java xtc.lang.babble.sra.SRA -analyze -toBrooklet $SRA_FILE 
##java xtc.lang.babble.sra.SRA -printAST -printSource $SRA_FILE 
