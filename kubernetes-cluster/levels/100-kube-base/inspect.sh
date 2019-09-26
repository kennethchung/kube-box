#!/bin/bash

KUBE_ADVERTISE_ADDRESS="$(hostname -I | awk '{print $1}')"
export KUBE_ADVERTISE_ADDRESS
export KUBE_ALLOW_PRIVILEGED=true
envsubst <"./kubeadm-config-template.yaml" > ./kubeadm-config.yaml
