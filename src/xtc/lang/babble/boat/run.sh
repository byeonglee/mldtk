#!/bin/sh

#INPUT=./fmradio-operators.ml
INPUT=./tmp.ml
#INPUT=../../../../../fonda/babble_testsuite/boat/aggregate.ml
OPTIONS=-printSource

java xtc.lang.babble.boat.Boat -printAST -printSource $INPUT 


