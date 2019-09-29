
resource "aws_vpc" "kubebox" {
  cidr_block = "${local.aws_vpc_cider_block}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_internet_gateway" "kubebox" {
  vpc_id = "${aws_vpc.kubebox.id}"

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_route_table" "kubebox" {
  vpc_id = "${aws_vpc.kubebox.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kubebox.id}"
  }

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_subnet" "kubebox" {
  vpc_id     = "${aws_vpc.kubebox.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.run_prefix}-${var.run_common_id}"
    AutoPrune = "true"
  }
}

resource "aws_route_table_association" "kubebox" {
  subnet_id      = "${aws_subnet.kubebox.id}"
  route_table_id = "${aws_route_table.kubebox.id}"
}






