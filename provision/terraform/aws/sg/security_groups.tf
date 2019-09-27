resource "aws_security_group" "kubebox_control" {
  name = "${var.run_prefix}-${var.run_common_id}-kubebox-control"
  vpc_id = "${data.terraform_remote_state.vpc.vpcid}"
  tags {
    Name = "${var.run_prefix}-${var.run_common_id}-kubebox-control"

  }
  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["${data.terraform_remote_state.vpc.vpc_cider_block}"]
    from_port             = 10250
    to_port               = 10250
  }
  ingress {
    protocol              = "tcp"
    cidr_blocks           = ["10.233.64.0/18"]
    from_port             = 30000
    to_port               = 32767
  }
}

# Empty Dynamic Rules
resource "aws_security_group" "kubebox_worker" {
  name = "${var.run_prefix}-${var.run_common_id}-kubebox-worker"
  vpc_id = "${data.terraform_remote_state.vpc.vpcid}"
  tags {
    name = "${var.run_prefix}-${var.run_common_id}-kubebox-worker"
  }
}