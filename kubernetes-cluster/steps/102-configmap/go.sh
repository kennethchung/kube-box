#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}

export NAME=$(kubectl get deploy -n kube-box nginx-nodeport-1 -o json | jq -r  .metadata.name)
export NAMESPACE=$(kubectl get deploy -n kube-box nginx-nodeport-1 -o json | jq -r  .metadata.namespace)
export STEP=$(kubectl get deploy -n kube-box nginx-nodeport-1 -o json | jq  -r '.metadata.labels | to_entries[0] | .key')
envsubst '$STEP $NAMESPACE $NAME' < custom-template.json  > ./custom.json
kubectl create configmap my-config -n kube-box --from-file=custom.conf,custom.json
kubectl patch deployment  -n kube-box nginx-nodeport-1 --patch "$(cat ignix_config_patch.yaml)"