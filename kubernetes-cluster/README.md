# step by step to build kubernetes

## step folder structure
- cd to each step folder, run ./go.sh, ./inspect.sh or ./down.sh
```
000-short-desc            step number - short description of this step
    - go.sh               if os_scripts present, execute os specific steps, else steps are independent of os
    - down.sh             restore as before go.sh was run
    - inspect.sh          verify this step has completed succesfully
    - ubuntu.sh           os specific steps
```

## step 0xx
- 090 download required tools such jq, envsubst
- 090 download docker-ce version


## step 1xx
- 100 downloads kubectl, kubelet and kubeadm to install kubernetes cluster. 
- 101 deployment simple nginx and verify nodePort and ClusterIP service 


## shellcheck
- docker run --rm -it -v $(pwd):/mnt koalaman/shellcheck **/*.sh