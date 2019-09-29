#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}

required_cmd=(tar envsubst jq yq)
printgreen "Inspecting required tools ${required_cmd}"
for cmd in "${required_cmd[@]}"
do
  command -v "${cmd}"  
done
