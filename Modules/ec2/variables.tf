variable "ec2_ami"{
  type = "string"
  default = "ami-0b59bfac6be064b78"
}

variable "ec2_az"{
  type = "string"
}

variable "ec2_instance_type"{
  type = "string"
}

variable "ec2_key_name"{
  type = "string"
}

variable "ec2_subnet_id"{
  type = "string"
}

variable "associate_public_ip"{
  type = "string"
}

variable "ec2_sg"{
  type = "list"
}

variable "count"{
  type = "string"
}