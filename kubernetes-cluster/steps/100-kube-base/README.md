# Steps
- Create kube-config.yaml to override a few variables.
- OS specific to install kubectl, kubeadm and kubectl.
- run kubeadm init to perform pulling images and deployment kubernetes
- Inspect verify node, deployment and pod are available and read
- Install busybox to verify kubernetes dns lookup
```
kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml
kubectl exec -ti busybox -- nslookup coredns.kube-system