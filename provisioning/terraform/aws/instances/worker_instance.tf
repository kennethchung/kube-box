resource "aws_instance" "worker_instance" {
  count         = "${var.worker_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address =true
  iam_instance_profile = "${data.terraform_remote_state.iam.instance_porflie_id}"
  key_name = "${data.terraform_remote_state.keypair.key_name}"
  subnet_id       = "${data.terraform_remote_state.vpc.subnet_id}"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.kubebox_master_id}","${data.terraform_remote_state.sg.kubebox_worker_id}"]
  tags {
    Name = "${format("%s-%s-%s-%d", var.run_prefix, var.run_common_id, "worker", count.index)}"
  } 
}

output "aws_instance_worker_instance_public_ip" {
  value = ["${aws_instance.worker_instance.*.public_ip}"]
}
output "aws_instance_worker_instance_private_ip" {
  value = ["${aws_instance.worker_instance.*.private_ip}"]
}


