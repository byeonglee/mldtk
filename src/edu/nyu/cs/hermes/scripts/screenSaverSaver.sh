#! /bin/bash

#get inital interrupt count
i=`awk '/serial/ {print $2}' /proc/interrupts`

n=0
while [ $n -lt 58 ]
do

#get current count
new=`awk '/serial/ {print $2}' /proc/interrupts`

if test $new -gt $i
then 

#simulates user activity
xscreensaver-command -deactivate

echo xscreensaver killed old $i new $new

fi

i=$new

n=$(($n+1))

echo $n

sleep 1

done 

exit