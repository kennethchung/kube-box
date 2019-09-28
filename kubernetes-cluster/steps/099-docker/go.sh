#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

printgreen "Installing docker"
source ./"${os_script}"
source ./inspect.sh
if [ $? == 1 ]; then
    printgreen "Completed installing docker"
else
    printred "Docker installation failed"
fi
