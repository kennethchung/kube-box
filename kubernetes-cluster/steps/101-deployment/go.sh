#!/bin/bash

source ./../../common/color-print.sh
CURRENT_STEP=${PWD##*/}-${0##*/}


#source ./../100-kube-base/inspect.sh
printgreen "create namespace kube-box"
kubectl create namespace kube-box
size=2
count=0
label=${PWD##*/}

printgreen "deploying ngnix $size"
svc_types=( clusterip nodeport)

while [ "${count}" -lt "${size}" ]
do    
    for svc_type in "${svc_types[@]}"
    do
        kubectl create deployment nginx-"${svc_type}"-"${count}" --image=nginx:1.17.2-alpine -n kube-box
        kubectl label deployment nginx-"${svc_type}"-"${count}" -n kube-box "${label}"=true
        kubectl create service "${svc_type}" nginx-"${svc_type}"-"${count}" -n kube-box  --tcp=80:80
        kubectl label service nginx-"${svc_type}"-"${count}" -n kube-box "${label}"=true
        kubectl label service nginx-"${svc_type}"-"${count}" -n kube-box svc_type="${svc_type}"
     done
    (( count++ ))
done





