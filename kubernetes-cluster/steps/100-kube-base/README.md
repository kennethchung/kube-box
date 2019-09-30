# Steps
- Create kube-config.yaml to override a few variables.
- OS specific to install kubectl, kubeadm and kubectl.
- run kubeadm init to perform pulling images and deployment kubernetes
- Inspect verify node, deployment and pod are available and read
- Install busybox to verify kubernetes dns lookup
```
kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml
kubectl exec -ti busybox -- nslookup coredns.kube-system

```
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
kube-system   pod/coredns-5644d7b6d9-556s6               1/1     Running   0          68s
kube-system   pod/coredns-5644d7b6d9-fnjlk               1/1     Running   0          68s
kube-system   pod/etcd-ip-10-0-0-69                      1/1     Running   0          9s
kube-system   pod/kube-apiserver-ip-10-0-0-69            1/1     Running   0          17s
kube-system   pod/kube-controller-manager-ip-10-0-0-69   1/1     Running   0          13s
kube-system   pod/kube-flannel-ds-amd64-7t4dq            1/1     Running   0          28s
kube-system   pod/kube-proxy-hwcgq                       1/1     Running   0          68s
kube-system   pod/kube-scheduler-ip-10-0-0-69            1/1     Running   0          26s

NAMESPACE     NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
default       service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  84s
kube-system   service/kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   82s

NAMESPACE     NAME                                     DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                 AGE
kube-system   daemonset.apps/kube-flannel-ds-amd64     1         1         1       1            1           <none>                        28s
kube-system   daemonset.apps/kube-flannel-ds-arm       0         0         0       0            0           <none>                        28s
kube-system   daemonset.apps/kube-flannel-ds-arm64     0         0         0       0            0           <none>                        28s
kube-system   daemonset.apps/kube-flannel-ds-ppc64le   0         0         0       0            0           <none>                        28s
kube-system   daemonset.apps/kube-flannel-ds-s390x     0         0         0       0            0           <none>                        28s
kube-system   daemonset.apps/kube-proxy                1         1         1       1            1           beta.kubernetes.io/os=linux   82s

NAMESPACE     NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
kube-system   deployment.apps/coredns   2/2     2            2           82s

NAMESPACE     NAME                                 DESIRED   CURRENT   READY   AGE
kube-system   replicaset.apps/coredns-5644d7b6d9   2         2         2       68s
```