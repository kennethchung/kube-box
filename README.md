# kube-box

The purpose of this repo is to stand up a kubernetes cluster and deploy microservices.

## Provisoning

In provisoning directory,  [terraform](https://www.terraform.io/) is used to provision resources on aws.

## kubernetes-cluster
There are multiple steps, starting from 0xx steps as prerequisites and thee from deploying kube-system services and pods; to deploying custom build microservices

In kubernetes-cluster, 
## Microservices

In microservices directory, golang is used to build a simple microservice to be deployed on the kubernetes cluster