#!/bin/bash

# Creates init scripts for each configuration

INITEMPLATE="./sysvinit.template"


CONFIGS=(`ls ./ | grep '.cfg'`)

for CONFIG in "${CONFIGS[@]}"
do
  echo $CONFIG
done
