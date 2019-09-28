#!/bin/bash

SSH_PUBLIC_KEY_FILE=${SSH_PUBLIC_KEY_FILE:-"${HOME}/.ssh/id_rsa.pub"}
SSH_PRIVATE_KEY_FILE=${PREFIX:-"${HOME}/.ssh/id_rsa"}
PREFIX=${PREFIX:-$(whoami)}

COMMON_ID=$(date +%m-%d"-"%H-%M-%S)

AWS_BUILD_REGION=${AWS_BUILD_REGION:-"us-west-2"}
# ubuntu 18.04
AMI_ID=${AMI_ID:-"ami-06f2f779464715dc5"}
AWS_PROFILE=${AWS_PROFILE:-"default"}


ec2Key=$(cat "${SSH_PUBLIC_KEY_FILE}")

if [ -f ./runtimevars.sh ]; then
    rm ./runtimevars.sh
fi

echo "AWS_PROFILE=${AWS_PROFILE}" >> runtimevars.sh
echo "AWS_BUILD_REGION=${AWS_BUILD_REGION}" >> runtimevars.sh
echo "AMI_ID=${AMI_ID}" >> runtimevars.sh
echo "PREFIX=${PREFIX}" >> runtimevars.sh
echo "COMMON_ID=${COMMON_ID}" >> runtimevars.sh

echo SSH_PUBLIC_KEY_FILE="${HOME}/.ssh/id_rsa.pub" >> runtimevars.sh