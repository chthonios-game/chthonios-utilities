#!/bin/bash

# Creates init scripts for each configuration

TEMPLATE="./sysconfig.template"


CONFIGS=(`ls ./config | grep '.cfg'`)

for CONFIG in "${CONFIGS[@]}"
do
  SCRIPTNAME="`echo $CONFIG | cut -d. -f1`-sysconfig.sh"
  cp $TEMPLATE $SCRIPTNAME
  chmod u+x $SCRIPTNAME
  source ./config/$CONFIG
  
  sed -i "s/deploy_pubkey/`echo $deploy_pubkey | sed -e 's/[\/&]/\\&/g'`/g" $SCRIPTNAME
  sed -i "s/deploy_user/$deploy_user/g" $SCRIPTNAME
  sed -i "s/hostname/$hostname/g" $SCRIPTNAME
  sed -i "s/domain/$domain/g" $SCRIPTNAME
  sed -i "s/tld/$tld/g" $SCRIPTNAME
  sed -i "s/newuser/$newuser/g" $SCRIPTNAME
done
