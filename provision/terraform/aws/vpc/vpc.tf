
resource "aws_vpc" "worker" {
  cidr_block = "${local.aws_vpc_cider_block}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_internet_gateway" "worker" {
  vpc_id = "${aws_vpc.worker.id}"

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_route_table" "worker" {
  vpc_id = "${aws_vpc.worker.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.worker.id}"
  }

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_subnet" "worker" {
  vpc_id     = "${aws_vpc.worker.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_route_table_association" "worker" {
  subnet_id      = "${aws_subnet.worker.id}"
  route_table_id = "${aws_route_table.worker.id}"
}






