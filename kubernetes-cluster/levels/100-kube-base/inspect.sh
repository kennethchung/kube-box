#!/bin/bash

# verify nodes
kubectl wait --for=condition=ready node --all --timeout=120s
# verify deployment
kubectl wait --for=condition=available -n kube-system deployment --all --timeout=120s
# verify pods
kubectl wait --for=condition=ready -n kube-system pod --all --timeout=120s

# verify svc and dns lookup
kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml
svcs=($(kubectl get svc --all-namespaces -o json | jq  '.items[]' | jq -rc '.metadata.name+"."+.metadata.namespace'))
for svc in "${svcs[@]}"
do
   kubectl exec -ti busybox -- nslookup "${svc}"
done
kubectl delete -f https://k8s.io/examples/admin/dns/busybox.yaml
