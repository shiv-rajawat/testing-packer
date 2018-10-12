resource "aws_internet_gateway" "My_VPC_GW" {
  vpc_id       = "${var.vpc_id}"
tags {
        Name = "${var.internet_gateway_name}"
    }
}
