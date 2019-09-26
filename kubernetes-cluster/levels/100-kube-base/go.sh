#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

source ./../099-docker/inspect.sh
if [ $? == 0 ]; then
    printred "Docker installation failed"
    exit 0
fi
printgreen "Installing kubernetes"
source ./"${os_script}"
printgreen "Completed installing kubernetes"