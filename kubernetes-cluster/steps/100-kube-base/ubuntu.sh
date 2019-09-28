#!/bin/bash

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

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo kubeadm init  --ignore-preflight-errors=all --skip-token-print --skip-certificate-key-print --config ./kube-config.yaml