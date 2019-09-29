# kube-box

The purpose of this repo is to stand up a kubernetes cluster and deploy microservices.

## Provisoning

In provisoning directory,  [terraform](https://www.terraform.io/) is used to provision resources on aws.

## kubernetes-cluster
There are multiple steps
- steps 0xx as prerequisites prepare the tools and dockers
- steps 1xx installation kubernetes and deploy nginx as verification

## Microservices
In microservices directory, golang is used to build a simple microservice to be deployed on the kubernetes cluster