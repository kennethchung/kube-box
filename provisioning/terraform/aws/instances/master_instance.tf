
resource "aws_instance" "kubebox_master" {
  count         = "${var.master_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address =true

  iam_instance_profile = "${data.terraform_remote_state.iam.instance_porflie_id}"
  key_name = "${data.terraform_remote_state.keypair.key_name}"
  subnet_id       = "${data.terraform_remote_state.vpc.subnet_id}"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.kubebox_master_id}"]
  tags {
    Name = "${format("%s-%s-%s-%d", var.run_prefix, var.run_common_id, "master", count.index)}"
  } 
}
output "aws_instance_kubebox_master_public_ip" {
  value = ["${aws_instance.kubebox_master.*.public_ip}"]
}
output "aws_instance_kubebox_master_private_ip" {
  value = ["${aws_instance.kubebox_master.*.private_ip}"]
}