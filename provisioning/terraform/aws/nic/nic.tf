

data "aws_network_interface" "nic" {
  id = "${data.terraform_remote_state.instances.network_interface_id}"
}


resource "aws_network_interface" "nic" {
    subnet_id       = "${data.terraform_remote_state.vpc.subnet_id}"
    security_groups = ["${data.terraform_remote_state.sg.kubebox_master_id}","${data.terraform_remote_state.sg.kubebox_worker_id}"]
     private_ips     = ["10.0.0.97"]
}




output "network_interface_id" {
  value       = "${data.aws_network_interface.nic.private_ips}"
}