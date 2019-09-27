
// resource "aws_network_interface" "kubebox_worker_id3" {
//     subnet_id       = "${data.terraform_remote_state.vpc.subnet_id}"
//     security_groups = ["${data.terraform_remote_state.sg.kubebox_master_id}","${data.terraform_remote_state.sg.kubebox_worker_id}"]
//     # bug in terraform. 
//     # On creation, private_ips_count is set to 1, 
//     # in the state file private_ips_count is 1 and private_ips.# is 2
//     # then change private_ips_count in the tf file to 0
//     # the state file then will have private_ips_count is 0 and private_ips.# is 1
//     # Now from that on private_ips_count respresents number of sips
//      tags {
//        Name = "kubebox_worker_id3"
//        "TAG" = "default"  #This will be the **Eth0** tag !!
//      }  
// }

resource "aws_instance" "kubebox_worker_id3" {
  count = "1"
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  iam_instance_profile = "${data.terraform_remote_state.iam.instance_porflie_id}"
  key_name = "${data.terraform_remote_state.keypair.key_name}"
  subnet_id       = "${data.terraform_remote_state.vpc.subnet_id}"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.kubebox_master_id}","${data.terraform_remote_state.sg.kubebox_worker_id}"]
  # https://github.com/hashicorp/terraform/issues/15799
  // network_interface {
  //    network_interface_id       = "${aws_network_interface.kubebox_worker_id3.id}"
  //    device_index               = 0
  // } 
  tags {
    Name = "${format("%s-%s-%s-%s-%d", var.run_prefix, var.run_common_id, "id3", "kubebox", count.index)}"
    AutoPrune = "true"
  } 
}

# example of add and remove sip
#aws ec2 assign-private-ip-addresses --network-interface-id eni-071a2ca0728faba02 --secondary-private-ip-address-count 1 --region us-east-1
#aws ec2 unassign-private-ip-addresses --network-interface-id eni-071a2ca0728faba02 --private-ip-addresses 10.0.0.76 --region us-east-1


// output "network_interface_id3_id" {
//   value       = "${aws_network_interface.kubebox_worker_id3.id}"
// }

// output "network_interface_id3_private_ips" {
//   value       = "${aws_network_interface.kubebox_worker_id3.private_ips }"
// }


// output "network_interface_id3_private_ips_count" {
//   value       =  "${length(aws_network_interface.kubebox_worker_id3.private_ips)}"  
// }


