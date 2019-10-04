#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
printgreen "removing config map"



printgreen "redeploy"

deployements=($(kubectl get deploy -n kube-box -o json | jq -r .items[].metadata.name))
for deploy in "${deployements[@]}"
do
    kubectl patch deployment  -n kube-box "${deploy}"  --patch "$(cat nginx_config_unpatch.yaml)"
    kubectl scale deploy "${deploy}" -n kube-box --replicas=0
done
kubectl wait --for=delete  -n kube-box pod --all --timeout=60s
for deploy in "${deployements[@]}"
do
    kubectl scale deploy "${deploy}" -n kube-box --replicas=1
    kubectl rollout status deployment "${deploy}" -n kube-box 
done

# verify kube-box deployment
kubectl wait --for=condition=available -n kube-box deployment --all --timeout=120s
# verify kube-box  pods
kubectl wait --for=condition=ready -n kube-box pod --all --timeout=120s