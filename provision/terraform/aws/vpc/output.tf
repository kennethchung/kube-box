output "vpcid" {
  description = "Public IP address of the EC2 instance being tested"
  value       = "${aws_vpc.worker.id}"
}

output "vpc_cider_block" {
  description = "Public IP address of the EC2 instance being tested"
  value       = "${local.aws_vpc_cider_block}"
}

output "subnet_id" {
  description = "Public IP address of the EC2 instance being tested"
  value       = "${aws_subnet.worker.id}"
}