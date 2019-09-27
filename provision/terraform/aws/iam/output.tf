output "instance_porflie_id" {
  value       = "${aws_iam_instance_profile.worker_iam.id}"
}

output "iam-role-name" {
  value = "${aws_iam_role.worker_iam.name}"
}
