resource "aws_security_group" "kubebox_master" {
  name = "${var.run_prefix}-${var.run_common_id}-master"
  vpc_id = "${data.terraform_remote_state.vpc.vpcid}"
  tags {
    Name = "${var.run_prefix}-${var.run_common_id}-master"
  }
  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["${data.terraform_remote_state.vpc.vpc_cider_block}"]
    from_port             = 0
    to_port               = 65535
  }
  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
    from_port             = 22
    to_port               = 22
  }

  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
    from_port             = 80
    to_port               = 80
  }

  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["0.0.0.0/0"]
    from_port             = 443
    to_port               = 443
  }
}

# Empty Dynamic Rules
resource "aws_security_group" "kubebox_worker" {
  name = "${var.run_prefix}-${var.run_common_id}-worker"
  vpc_id = "${data.terraform_remote_state.vpc.vpcid}"
  tags {
    Name = "${var.run_prefix}-${var.run_common_id}-worker"
  }
}