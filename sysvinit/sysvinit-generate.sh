#!/bin/bash

# Creates init scripts for each configuration

TEMPLATE="./sysvinit.template"


CONFIGS=(`ls ./ | grep '.cfg'`)

for CONFIG in "${CONFIGS[@]}"
do
  SCRIPTNAME="sysvinit-`echo $CONFIG | cut -d. -f1`.sh"
  cp $TEMPLATE $SCRIPTNAME
  chmod u+x $SCRIPTNAME
  source ./$CONFIG
  sed -i "s/run_as_user/$run_as_user/g" $SCRIPTNAME
done
