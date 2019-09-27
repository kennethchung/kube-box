resource "aws_security_group_rule" "kubebox_worker_id1" {
  type            = "ingress"
  from_port       = 8080
  to_port         = 8080
  protocol        = "tcp"
  cidr_blocks     = ["104.219.104.0/21",,"109.231.234.224/27"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}

resource "aws_security_group_rule" "kubebox_worker_id2" {
  type            = "ingress"
  from_port       = 9080
  to_port         = 9080
  protocol        = "tcp"
  cidr_blocks     = ["104.219.104.0/21","109.231.234.224/27"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}

resource "aws_security_group_rule" "kubebox_worker_id3" {
  type            = "ingress"
  from_port       = 10080
  to_port         = 10080
  protocol        = "tcp"
  cidr_blocks     = ["104.219.104.0/21","109.231.234.224/27"]

  security_group_id = "${aws_security_group.kubebox_worker.id}"
}