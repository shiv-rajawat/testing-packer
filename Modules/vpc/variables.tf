variable "cidr_block"{
  type = "string"
  description = "The first 16 bits of the desired cidr block/s. Note: The number of elements in the list should not be less than the specified count of VPCs."
  #default = ["172.16.0.0/16", "10.0.0.0/16", "143.14.0.0/16", "100.10.0.0/16"]
}

variable "vpc_name"{
  type = "string"
}
