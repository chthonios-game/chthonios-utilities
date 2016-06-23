#!/bin/bash

# Creates init scripts for each configuration

TEMPLATE="./sysvinit.template"


CONFIGS=(`ls ./ | grep '.cfg'`)

for CONFIG in "${CONFIGS[@]}"
do
  echo $CONFIG
  #cp $TEMPLATE $CONFIG
  
done
