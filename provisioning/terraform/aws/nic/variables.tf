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

variable "build_version" {
  type = "string"
  default = "user_build"
}



