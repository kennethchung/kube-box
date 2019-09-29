#!/bin/bash

SSH_PUBLIC_KEY_FILE=${SSH_PUBLIC_KEY_FILE:-"${HOME}/.ssh/id_rsa.pub"}
SSH_PRIVATE_KEY_FILE=${PREFIX:-"${HOME}/.ssh/id_rsa"}
PREFIX=${PREFIX:-$(whoami)}

COMMON_ID=$(date +%m-%d"-"%H-%M-%S)

AWS_BUILD_REGION=${AWS_BUILD_REGION:-"us-west-2"}
# ubuntu 18.04
AMI_ID=${AMI_ID:-"ami-06f2f779464715dc5"}
AWS_PROFILE=${AWS_PROFILE:-"default"}
MASTER_COUNT=${MASTER_COUNT:-"3"}
WORKER_COUNT=${WORKER_COUNT:-"3"}
INSTANCE_TYPE=${INSTANCE_TYPE:-"t2.micro"}

ec2Key=$(cat "${SSH_PUBLIC_KEY_FILE}")

if [ -f ./runtimevars.sh ]; then
    rm ./runtimevars.sh
fi

echo "AWS_PROFILE=${AWS_PROFILE}" >> runtimevars.sh
echo "AWS_BUILD_REGION=${AWS_BUILD_REGION}" >> runtimevars.sh
echo "AMI_ID=${AMI_ID}" >> runtimevars.sh
echo "PREFIX=${PREFIX}" >> runtimevars.sh
echo "COMMON_ID=${COMMON_ID}" >> runtimevars.sh
echo "MASTER_COUNT=${MASTER_COUNT}" >> runtimevars.sh
echo "WORKER_COUNT=${WORKER_COUNT}" >> runtimevars.sh
echo "INSTANCE_TYPE=${INSTANCE_TYPE}" >> runtimevars.sh

echo SSH_PUBLIC_KEY_FILE="${HOME}/.ssh/id_rsa.pub" >> runtimevars.sh