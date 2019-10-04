#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}

deployements=($(kubectl get deploy -n kube-box -o json | jq -r .items[].metadata.name))
for deploy in "${deployements[@]}"
do
    export STEP=$(kubectl get deploy -n kube-box $deploy -o json | jq  -r '.metadata.labels | to_entries[0] | .key')
    envsubst '$STEP' < custom-template.json  > ./custom.json
    if kubectl get cm -n kube-box configmap-102; then
        printgreen "patch configmap"
        kubectl create configmap configmap-102 -n kube-box --from-file=custom.conf,custom.json -o yaml --dry-run | kubectl replace -f -
    else
        printgreen "creating configmap"
        kubectl create configmap configmap-102 -n kube-box --from-file=custom.conf,custom.json 
    fi
    printgreen "patch deployment ${deploy}"
    kubectl patch deployment  -n kube-box "${deploy}" --patch "$(cat nginx_config_patch.yaml)"
done
sleep 10
source ./inspect.sh