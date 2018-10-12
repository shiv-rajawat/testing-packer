variable "environment"{
  type = "string"
  default = "dev"
}

variable "cidr_block"{
  type = "list"
}

variable "subnet_name"{
  type = "string"
}

variable "vpc_id"{
  type = "string"
}

variable "subnet_az" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}

variable "subnet_count" {
  default     = "2"
  description = "Number of private subnets to be created."
}

variable "map_public_ip_on_launch" {
  default     = false
  description = "Flag for assiging public ip to the instances launched in the subnet."
}
