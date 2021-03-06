#
# Terraform Variables
#
variable "profile" {
  type = "string"
  default = "default"
}
variable "region" {
  type = "string"
  default = "us-west-2"
}
variable "ami_id" {
  type = "string"
  default = ""
}

variable "run_prefix" {
  type = "string"
}

variable "run_common_id" {
  type = "string"
}

variable "ec2_public_key" {
  type = "string"
  default = ""
}




