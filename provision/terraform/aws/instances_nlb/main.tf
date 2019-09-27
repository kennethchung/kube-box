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

data "terraform_remote_state" "keypair" {
  backend = "local"

  config {
    path = "${path.module}/../keypair/terraform.tfstate"
  }
}


data "terraform_remote_state" "iam" {
  backend = "local"

  config {
    path = "${path.module}/../iam/terraform.tfstate"
  }
}

