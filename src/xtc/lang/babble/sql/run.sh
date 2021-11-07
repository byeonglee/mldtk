#!/bin/sh

FILE=./aggregate.sql
SQL_FILE=../../../../../fonda/babble_testsuite/sql/aggregate.sql

cat $SQL_FILE
java xtc.lang.babble.sql.SQL -printAST -analyze -printSymbolTable -printSource $SQL_FILE 
