# What are we provisioning?
- There will be three masters and three workers ec2 instances provisioned

## Customize resource setting
- SSH_PUBLIC_KEY_FILE location of the ssh public key
- SSH_PRIVATE_KEY_FILE location of the ssh private key
- PREFIX all aws resource prefix
- AWS_BUILD_REGION aws region
- AMI_ID aws ami id
- AWS_PROFILE aws credential profile

## Plan and apply

- ./generate_runtimevars.sh to generate runtimevars.sh. This file will sourced to support creation of aws resources
- terraform init -plugin-dir .terraform/plugins/darwin_amd64 (mac)
- ./plan_apply.sh vpc/  create aws virtual private cloud with subnet 10.0.0.0/24
- ./plan_apply.sh iam/  create iam role and with limited policy for instance
- ./plan_apply.sh keypair/ create keypair using SSH_PUBLIC_KEY_FILE
- ./plan_apply.sh sg/ create security group with limited ingress
- ./plan_apply.sh instances/ create three master and worker instances
- ./plan_apply.sh instances_nlb/ (To be working on)
- ./plan_apply.sh nlb/ (To be working on))


## Cleanup
- Clean up requires the reverse order of plan and apply because of dependencies
- ./destroy.sh nlb/ (To be working on)
- ./destroy.sh instances_nlb/ (To be working on)
- ./destroy.sh instances/
- ./destroy.sh iam/
- ./destroy.sh keypair/
- ./destroy.sh sg/
- ./destroy.sh vpc/








