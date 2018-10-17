## This files declares all the parameters used for setting up configurations for dev. The values are given through the *.tfvars file.


variable "env"{
  type = "string"
  
  description = "Environment. It can be dev,uat or prod."
}

variable "aws_region" {
  type = "string"
}

variable "vpc_cidr_block"{
  type = "string"
  description = "The CIDR block for the VPC."
}

variable "vpc_name"{
  type = "string"
  description = "The name of the VPC."
}

variable "dmz_subnet_cidr_block"{
  type = "list"
  description = "The CIDR block for the subnet. It must be a subset of VPC's CIDR block."
}

variable "dmz_subnet_name"{
  type = "string"
  description = "The name of the subnet."
}

variable "dmz_subnet_count" {
  default     = "4"
  description = "Number of subnets to be created."
}

variable "dmz_subnet_az" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}

variable "ig_name"{
  type = "string"
  description = "The name for the internet gateway."
}

variable "rt_name"{
  type = "string"
  description = "The name for the route table."
}

variable "rt_destination_cidr_block"{
  type = "string"
  description = "The destination CIDR block for creating a route."
}
