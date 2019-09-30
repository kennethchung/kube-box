#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}
os_script=${os_script:-"ubuntu.sh"}

source ./../099-docker/inspect.sh
if [ $? == 0 ]; then
    printred "Docker installation failed"
    exit 0
fi
printgreen "Installing kubernetes......."
KUBE_ADVERTISE_ADDRESS="$(hostname -I | awk '{print $1}')"
export KUBE_ADVERTISE_ADDRESS="${KUBE_ADVERTISE_ADDRESS}"
export KUBE_ALLOW_PRIVILEGED=true
# For flannel to work correctly, you must pass --pod-network-cidr=10.244.0.0/16 to kubeadm init.
export KUBE_CLUSTER_CIDR=10.244.0.0/16
export KUBE_CLUSTER_DOMAIN=cluster.local
export KUBE_SERVICE_ADDRESSES=10.96.0.0/12
export HOSTNAME=$(hostname)
envsubst <"./kube-config-template.yaml" > ./kube-config.yaml
read -r -a IPS <<<"$(hostname -I)"
bash -c "cat <<EOF >>./kube-config.yaml
    - ${HOSTNAME}
EOF"
for ip in "${IPS[@]}"; do
bash -c "cat <<EOF >>./kube-config.yaml
    - ${ip}
EOF"
done
cat ./kube-config.yaml
source ./"${os_script}"
sudo kubeadm init --config ./kube-config.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

printgreen "Untaint master node so that pods can be scheduled master node"
kubectl taint nodes ${HOSTNAME} node-role.kubernetes.io/master-

printgreen "Installing addon flannel"
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml        

printgreen "Completed installing kubernetes"
source ./inspect.sh