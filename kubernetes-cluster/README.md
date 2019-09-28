# step by step to build kubernetes
- steps 0xx involve downloading os tools such as jq, yq
- step downloads kubeadm and perform installations
- steps 0xx to 100 are os specific. It defaults to ubuntu. Other OS are in progress


## shellcheck
- docker run --rm -it -v $(pwd):/mnt koalaman/shellcheck **/*.sh