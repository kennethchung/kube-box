#!/bin/bash
SECONDS=0 
if [ $# -ne 1 ];  then
    echo "Failed to destroy, please specifiy folder name"
    exit 1
fi
dir=$1

length=${#dir}
last_char=${dir:length-1:1}

[[ $last_char != "/" ]] && dir="$dir/"; :

printf "\n\n=========================================================\n"
printf "Destroy [%s]\n" ${dir}
printf "=========================================================\n\n\n"

source ./runtimevars.sh

terraform destroy  \
    -force \
    -state-out=${dir}terraform.tfstate \
    -state=${dir}terraform.tfstate \
    -var "region=${AWS_BUILD_REGION}" \
    -var "profile=${AWS_PROFILE}" \
    -var "run_common_id=${COMMON_ID}" \
    -var "run_prefix=${PREFIX}" \
    -var "ami_id=${AMI_ID}" \
    ${dir}

echo "======================================"
echo "Completed Destroy ${dir} in ${SECONDS} secs"
echo "======================================"