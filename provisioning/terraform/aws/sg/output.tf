output "kubebox_master_id" {
  description = "Public IP address of the EC2 instance being tested"
  value       = "${aws_security_group.kubebox_master.id}"
}

output "kubebox_worker_id" {
  description = "Public IP address of the EC2 instance being tested"
  value       = "${aws_security_group.kubebox_worker.id}"
}