#!/bin/bash
set -e
source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
# verify nodes
kubectl wait --for=condition=ready node --all --timeout=120s
# verify deployment
kubectl wait --for=condition=available -n kube-system deployment --all --timeout=120s
# verify pods
kubectl wait --for=condition=ready -n kube-system pod --all --timeout=120s

# verify svc and dns lookup
kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml
kubectl wait --for=condition=ready -n default pod --all
svcs=($(kubectl get svc -n kube-system -o json | jq  '.items[]' | jq -rc '.metadata.name+"."+.metadata.namespace'))
for svc in "${svcs[@]}"
do
   printgreen "${svc}.svc.cluster.local"
   kubectl exec -ti busybox -- nslookup "${svc}".svc.cluster.local
done

