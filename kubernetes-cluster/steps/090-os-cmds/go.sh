#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

printgreen "installing os cmds"
source ./"${os_script}"
printgreen "Completed installing os cmds"