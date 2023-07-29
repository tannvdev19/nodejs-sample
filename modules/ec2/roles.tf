resource "aws_iam_role" "ec2_role" {
  name = "ec2_role_${var.env}"

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

resource "aws_iam_policy" "ec2_policy" {
  name        = "ec2_policy_${var.env}"
  description = "Policy to access ecr with ec2"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecr:*",
        "cloudtrail:LookupEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${aws_iam_policy.ec2_policy.arn}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile_${var.env}"
  role = "${aws_iam_role.ec2_role.name}"
}