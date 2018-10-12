variable "route_table_id"{
  type = "string"
}

variable "rt_destination_cidr_block"{
  type = "string"
}

variable "nat_gateway_id"{
  default = ""
  type = "string"
}

variable "internet_gateway_id"{
  type = "string"
}
