variable "rule_type"{
  type = "string"
  default = "ingress"
}

variable "from_port"{
  type = "string"
}

variable "to_port"{
  type = "string"
}

variable "protocol" {
  type = "string"
  default = "tcp"
}

variable "source_cidr" {
  type = "list"
  default = []
}

variable "source_sg_id" {
  type = "string"
  default = ""
}

variable "sg_id" {
  type = "string"
}
