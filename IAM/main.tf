terraform {
  backend "s3" {
    encrypt = true
    bucket = "shiv-terraform-remote-state-bucket"
    dynamodb_table = "shiv-terraform-state-lock"
    key    = "global/s3/iam-terraform.tfstate"
  }
}

provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_iam_role" "packer" {
  name = "${var.iam_role_name}"
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
  name = "${var.iam_instance_profile_name}"
  role = "${aws_iam_role.packer.name}"
}
