sh "aws s3 ls"
data "aws_availability_zones" "available" {}

locals {
  subnet_az_str = "${join(",", coalescelist(var.dmz_subnet_az, data.aws_availability_zones.available.names))}"
  subnet_az = ["${split(",", local.subnet_az_str)}"]
}

## Creates a VPC using the VPC module.
module "vpc" {
  source = "../Modules/vpc"
  cidr_block = "${var.vpc_cidr_block}"
  vpc_name = "${var.vpc_name}"
}


## Creates public subnet inside the vpc created.
module "dmz_subnets" {
  source = "../Modules/publicsubnet"
  env = "${var.env}"
  subnet_count = "${var.dmz_subnet_count}"
  cidr_block = "${var.dmz_subnet_cidr_block}"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_name = "${var.dmz_subnet_name}"
  subnet_az = "${local.subnet_az}"
  "map_public_ip_on_launch" = true
}

## Creates an internet gateway and attach it to the created vpc.
module "internetgateway" {
  source = "../Modules/internetgateway"
  vpc_id = "${module.vpc.vpc_id}"
  internet_gateway_name = "${var.ig_name}"
  }

## Creates a route table for the VPC created.
  module "dmz_routetable"{
    source = "../Modules/routetable"
    vpc_id = "${module.vpc.vpc_id}"
    route_table_name = "dmz-rt"
}

module "dmz_rt_route" {
  source = "../Modules/route"
  route_table_id = "${module.dmz_routetable.route_table_id}"
  rt_destination_cidr_block = "0.0.0.0/0"
  internet_gateway_id = "${module.internetgateway.internet_gateway_id}"
  }


module "public_rt_association" {
  source = "../Modules/routetableassociation"
  rt_id = "${module.dmz_routetable.route_table_id}"
  subnet_id = ["${module.dmz_subnets.subnet_id}"]
  count = "${module.dmz_subnets.subnet_id_count}"
}
