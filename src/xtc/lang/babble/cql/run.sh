#!/bin/sh

#FILE=istream-project.cql
#FILE=bargain.cql
#FILE=range.cql
#FILE=union.cql
#FILE=partition.cql
#FILE=linearroad.cql
FILE=hits.cql
#FILE=distinct.cql
CQL_FILE=../../../../../fonda/babble_testsuite/cql/$FILE
#CQL_FILE=./tmp.cql

cat $CQL_FILE
java xtc.lang.babble.cql.CQL -analyze -printSymbolTable -printAST  -toSRA $CQL_FILE 
#java xtc.lang.babble.cql.CQL -analyze -printSymbolTable -printAST  -printSource $CQL_FILE 
