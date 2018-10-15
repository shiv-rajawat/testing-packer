terraform {
  backend "s3" {
    encrypt = true
    bucket = "cwt-terraform-remote-state-bucket"
    dynamodb_table = "cwt-terraform-state-lock"
    key    = "global/s3/iam-terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_iam_role" "packer" {
  name = "packer"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Principal": {"Service": "ec2.amazonaws.com"},
        "Action": "sts:AssumeRole",
        "Sid": ""
    }
}
EOF
}



resource "aws_iam_instance_profile" "packer" {
  name = "packer"
  role = "${aws_iam_role.packer_role.name}"
}
