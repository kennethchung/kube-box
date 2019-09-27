provider "aws" {
  profile                 = "${var.profile}"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.region}"
}
locals {
  aws_vpc_cider_block     = "10.0.0.0/16"
}