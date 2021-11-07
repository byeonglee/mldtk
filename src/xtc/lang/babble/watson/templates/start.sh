#!/bin/bash

DPS_INSTANCE=streams

streamtool lsinstance $DPS_INSTANCE >& /dev/null
if [[ $? == 0 ]]; then
  streamtool rminstance -i $DPS_INSTANCE --noprompt
else
  streamtool rminstance -i $DPS_INSTANCE --noprompt 2> /dev/null
fi

hn=`hostname`
grep "^$hn" < config/hosts.spcrun  >& /dev/null
if [[ $? == 0 ]]; then 
    reservemode="--unreserved"
else
    reservemode="--reserved 1"
fi
echo $hn > config/hosts.cfgrun
grep -v "^$hn" < config/hosts.spcrun >> config/hosts.cfgrun

streamtool mkinstance -i $DPS_INSTANCE --hfile config/hosts.cfgrun $reservemode --rmservice sws
if [[ $? != 0 ]]; then exit 1; fi

streamtool startinstance -i $DPS_INSTANCE 
if [[ $? != 0 ]]; then exit 1; fi

