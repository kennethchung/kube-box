# Steps

- ./generate_runtimevars.sh to generate variables for the test
- terraform init -plugin-dir .terraform/plugins/darwin_amd64 (mac)
- ./plan_apply.sh vpc/ && ./plan_apply.sh iam/ && ./plan_apply.sh keypair/ && ./plan_apply.sh sg/ && ./plan_apply.sh instances_nlb/ && ./plan_apply.sh instances/ && ./plan_apply.sh nlb/

# Cleanup

- ./destroy.sh nlb/ && ./destroy.sh instances/ && ./destroy.sh instances_nlb/ && ./destroy.sh iam/ && ./destroy.sh keypair/ && ./destroy.sh sg/ && ./destroy.sh vpc/








