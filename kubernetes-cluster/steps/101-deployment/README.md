# Steps
- Create nginx deployments
- Label nginx deployments 
- Create nginx (nodeport and clusterip) services
- Label nginx services

```
NAME                                     READY   STATUS    RESTARTS   AGE
pod/nginx-clusterip-1-7748868c77-j58vj   1/1     Running   0          39m
pod/nginx-clusterip-2-7df4495dd6-s7zk9   1/1     Running   0          39m
pod/nginx-nodeport-1-7ffffd77c9-sfdj6    1/1     Running   0          39m
pod/nginx-nodeport-2-56df9668c6-9ggsz    1/1     Running   0          17m

NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/nginx-clusterip-1   ClusterIP   10.98.25.44     <none>        80/TCP         39m
service/nginx-clusterip-2   ClusterIP   10.100.44.67    <none>        80/TCP         39m
service/nginx-nodeport-1    NodePort    10.98.144.79    <none>        80:30746/TCP   39m
service/nginx-nodeport-2    NodePort    10.106.149.69   <none>        80:31392/TCP   39m

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx-clusterip-1   1/1     1            1           39m
deployment.apps/nginx-clusterip-2   1/1     1            1           39m
deployment.apps/nginx-nodeport-1    1/1     1            1           39m
deployment.apps/nginx-nodeport-2    1/1     1            1           39m

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-clusterip-1-7748868c77   1         1         1       39m
replicaset.apps/nginx-clusterip-2-7df4495dd6   1         1         1       39m
replicaset.apps/nginx-nodeport-1-7ffffd77c9    1         1         1       39m
replicaset.apps/nginx-nodeport-2-55d8746f8d    0         0         0       18m
replicaset.apps/nginx-nodeport-2-56df9668c6    1         1         1       17m
replicaset.apps/nginx-nodeport-2-68c9447cf     0         0         0       38m
replicaset.apps/nginx-nodeport-2-6b4fb96db5    0         0         0       36m
replicaset.apps/nginx-nodeport-2-7999b69fc9    0         0         0       19m
replicaset.apps/nginx-nodeport-2-7dbd88ff56    0         0         0       39m
replicaset.apps/nginx-nodeport-2-bbcf75d74     0         0         0       19m
replicaset.apps/nginx-nodeport-2-ddc856fbf     0         0         0       37m
```

## Verify Pod to Pod communications

```
kubectl exec -it  busybox  --  wget -O - http://nginx-nodeport-2.kube-box.svc.cluster.local
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
....
</body>
</html>
```

## Verify nodeport to pod communications

```
kubectl get svc -l svc_type=nodeport  -n kube-box -o json | jq  '.items[].spec.ports[0].nodePort'
curl http://localhost:"${port}"
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
....
</body>
</html>
```