variable "security_group_name"{
  type = "string"
}

variable "vpc_id"{
  type = "string"
}

variable "sg_ingress_source_cidr" {
  type = "list"
}
