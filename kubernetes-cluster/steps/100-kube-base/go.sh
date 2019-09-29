#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

source ./../099-docker/inspect.sh
if [ $? == 0 ]; then
    printred "Docker installation failed"
    exit 0
fi
printgreen "Installing kubernetes"
KUBE_ADVERTISE_ADDRESS="$(hostname -I | awk '{print $1}')"
export KUBE_ADVERTISE_ADDRESS
export KUBE_ALLOW_PRIVILEGED=true
export KUBE_CLUSTER_CIDR=10.244.0.0/16
envsubst <"./kube-config-template.yaml" > ./kube-config.yaml
bash -c "cat <<EOF >>./kube-config.yaml
    - $(hostname)
EOF"
    for ip in "${IPS[@]}"; do
        # adds ips
        bash -c "cat <<EOF >>./kube-config.yaml
    - ${ip}
EOF"    
    done
source ./"${os_script}"
sudo kubeadm init --config ./kube-config.yaml
printgreen "Completed installing kubernetes"
source ./inspect.sh