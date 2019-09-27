resource "aws_iam_instance_profile" "worker_iam" {
  name = "${var.run_prefix}-${var.run_common_id}"
  role = "${aws_iam_role.worker_iam.name}"
}

resource "aws_iam_role" "worker_iam" {
  name = "${var.run_prefix}-${var.run_common_id}"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "worker_iam" {
  name        = "${var.run_prefix}-${var.run_common_id}"
  path        = "/"
  description = "worker iam"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_policy_attachment" "worker_iam" {
  name       = "${var.run_prefix}-${var.run_common_id}"
  roles      = ["${aws_iam_role.worker_iam.name}"]
  policy_arn = "${aws_iam_policy.worker_iam.arn}"
}