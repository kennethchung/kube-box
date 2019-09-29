resource "aws_key_pair" "kubebox" {
  key_name = "${var.run_prefix}-${var.run_common_id}"
  public_key = "${var.ec2_public_key}"
}

