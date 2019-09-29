resource "aws_security_group_rule" "kubebox_worker_id1" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  cidr_blocks     = ["${data.terraform_remote_state.vpc.vpc_cider_block}"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}

resource "aws_security_group_rule" "kubebox_worker_id2" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}

# Other example
resource "aws_security_group_rule" "kubebox_worker_id3" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}

resource "aws_security_group_rule" "kubebox_worker_id4" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}