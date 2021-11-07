#!/bin/bash

processLine(){
  line="$@" # get all args
  echo $line
}
 
### Main script stars here ###
# Store file name
FILE=""
 
# Make sure we get file name as command line argument
# Else read it from standard input device
if [ "$1" == "" ]; then
   FILE="/dev/stdin"
else
   FILE="$1"
   # make sure file exist and readable
   if [ ! -f $FILE ]; then
  	echo "$FILE : does not exists"
  	exit 1
   elif [ ! -r $FILE ]; then
  	echo "$FILE: can not read"
  	exit 2
   fi
fi
# read $FILE using the file descriptors
 
# Set loop separator to end of line
BAKIFS=$IFS
IFS=$(echo -en "\n\b")
exec 3<&0
exec 0<"$FILE"

declare -a hosts
let count=0
while read -r line
do
    hosts[$count]=$line
    ((count++))
done

#echo Number of elements: ${#hosts[@]}
# echo array's content
#echo ${hosts[@]}

for (( i=0; i<64; i++))
do
    let h=i%${#hosts[@]}
    echo "sent logRecord_$i.data to ${hosts[$h]}"
    scp logRecord_$i.data  ${hosts[$h]}:/tmp
    #scp "logRecord_$i.data" $line:/tmp
done
exec 0<&3
 
# restore $IFS which was used to determine what the field separators are
IFS=$BAKIFS
exit 0

