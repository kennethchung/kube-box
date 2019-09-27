#!/bin/bash
SECONDS=0 
if [ $# -ne 1 ];  then
    echo "Failed to plan and apply, please specifiy folder name"
    exit 1
fi

dir=$1

length=${#dir}
last_char=${dir:length-1:1}

[[ $last_char != "/" ]] && dir="$dir/"; :

printf "\n\n=========================================================\n"
printf "Plan and Apply [%s]\n" ${dir}
printf "=========================================================\n\n\n"


source ./runtimevars.sh
ec2Key=$(cat "${SSH_PUBLIC_KEY_FILE}")
terraform refresh  \
    -var "profile=${AWS_PROFILE}" \
    -var "ec2_public_key=${ec2Key}" \
    -var "region=${AWS_BUILD_REGION}" \
    -var "ami_id=${AMI_ID}" \
    -var "run_common_id=${COMMON_ID}" \
    -var "run_prefix=${PREFIX}" \
    -state=${dir}terraform.tfstate \
    ${dir}
terraform plan  \
    -out=${dir}main.plan \
    -var "profile=${AWS_PROFILE}" \
    -var "ec2_public_key=${ec2Key}" \
    -var "region=${AWS_BUILD_REGION}" \
    -var "ami_id=${AMI_ID}" \
    -var "run_common_id=${COMMON_ID}" \
    -var "run_prefix=${PREFIX}" \
    -state=${dir}terraform.tfstate \
    ${dir}

terraform apply  \
    -auto-approve \
    -state-out=${dir}terraform.tfstate \
    -refresh=true \
    ${dir}main.plan

echo "======================================"
echo "Completed Apply and Plan in ${SECONDS} secs"
echo "======================================"