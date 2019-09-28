#!/bin/bash
source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}

# verify kube-box deployment
label=${PWD##*/}
kubectl wait --for=condition=available -l "${label}"=true -n kube-box deployment --all --timeout=120s
# verify kube-box  pods
kubectl wait --for=condition=ready -n kube-box pod --all --timeout=120s

kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml
kubectl wait --for=condition=ready -n default pod --all
printgreen "verify pod to pod connections"
svcs=($(kubectl get svc -l $label=true -n kube-box -o json | jq  '.items[]' | jq -rc '.metadata.name+"."+.metadata.namespace'))
for svc in "${svcs[@]}"
do
   resp=$(kubectl exec -it  busybox  --  wget -O - http://"${svc}")
   printgreen "${svc}"
   grep nginx <<< $resp
done


printgreen "verify nodeport communication"
ports=($(kubectl get svc -l svc_type=nodeport  -n kube-box -o json | jq  '.items[].spec.ports[0].nodePort'))
for port in "${ports[@]}"
do
   printgreen "${port}"
   resp=$(curl http://localhost:"${port}")
   grep nginx <<< $resp
done


