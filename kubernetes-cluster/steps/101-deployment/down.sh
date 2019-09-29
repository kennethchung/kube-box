#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
printgreen "removing deployment"

deployment_types=($(kubectl get deployment  -l 101-deployment=true -n kube-box  -o json | jq -r .items[].metadata.name))
for deployment_type in "${deployment_types[@]}"
do
    kubectl delete deployment -n kube-box "${deployment_type}"
done
printgreen "removing namespaces"
kubectl delete namespaces kube-box