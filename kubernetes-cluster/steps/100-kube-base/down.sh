#!/bin/bash


source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

printgreen "Uninstalling kubernetes"

# Reset kubeadm
sudo kubeadm reset

# Stop kubelet 
sudo systemctl stop kubelet

sudo rm -rf /var/lib/cni/
sudo rm -rf /var/lib/kubelet/*
sudo rm -rf /run/flannel
sudo rm -rf /etc/cni/
sudo rm -rf /etc/kubernetes
sudo rm -rf /var/lib/etcd/

if [ "${os_script}" == "ubuntu.sh" ]; then
    sudo apt remove -y kubelet
    sudo apt remove -y kubectl
    sudo apt remove -y kubeadm
fi