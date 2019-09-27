provider "aws" {
  profile                 = "${var.profile}"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.region}"
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config {
    path = "${path.module}/../vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "sg" {
  backend = "local"

  config {
    path = "${path.module}/../sg/terraform.tfstate"
  }
}

