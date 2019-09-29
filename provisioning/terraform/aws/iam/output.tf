output "instance_porflie_id" {
  value       = "${aws_iam_instance_profile.kubebox_iam.id}"
}

output "iam-role-name" {
  value = "${aws_iam_role.kubebox_iam.name}"
}
