resource "aws_key_pair" "worker" {
  key_name = "${var.run_prefix}-${var.run_common_id}"
  public_key = "${var.ec2_public_key}"
}

