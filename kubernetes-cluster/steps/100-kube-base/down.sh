#!/bin/bash


source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

printgreen "Uninstalling kubernetes"
export HOSTNAME=$(hostname)
kubectl drain "${HOSTNAME}" --delete-local-data --force --ignore-daemonsets
kubectl delete node "${HOSTNAME}"

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
    sudo apt autoremove -y kubelet kubectl kubeadm
fi