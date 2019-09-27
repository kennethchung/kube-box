#!/bin/bash

if [ $# -ne 3 ];  then
    echo "Failed to import, please specifiy folder name"
    exit 1
fi

dir=$1
resourceType=$2
resourceId=$3

length=${#dir}
last_char=${dir:length-1:1}

[[ $last_char != "/" ]] && dir="$dir/"; :

printf "\n\n=========================================================\n"
printf "import [%s]\n" ${dir}
printf "=========================================================\n\n\n"


source ./runtimevars.sh

terraform import  \
    -config=${dir} \
    -var "access_key=${ACCESS_KEY_ID}" \
    -var "secret_key=${SECRET_ACCESS_KEY}" \
    -var "region=${AWS_BUILD_REGION}" \
    -var "ami_id=${AMI_ID}" \
    -state=${dir}terraform.tfstate \
    $2 $3




