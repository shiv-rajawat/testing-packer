##This file supplies values to the parameters used in dev's main file. Their declaration and descriptions are given in dev's variables.tf file. Refer it for more info.

#environment parameters
env = "elk"

#vpc parameters
vpc_cidr_block = "149.10.0.0/16"
vpc_name = "cpv-vpc"

#public subnet 1 parameters
dmz_subnet_name = "subnet"
dmz_subnet_count = 3
dmz_subnet_cidr_block = ["149.10.0.0/24","149.10.1.0/24","149.10.2.0/24"]
dmz_subnet_az = ["us-east-2a","us-east-2b","us-east-2c"]

#internet gateway parameters
ig_name = "elk-vpc-ig"

#route table gateway parameters
rt_name = "elk-vpc-route"
rt_destination_cidr_block = "0.0.0.0/0"


#associate_public_ip = true
