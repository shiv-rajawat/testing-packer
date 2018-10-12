resource "aws_security_group" "My_Security_Group" {
  vpc_id       = "${var.vpc_id}"
  name         = "${var.security_group_name}"
  description  = "${var.security_group_name}"
ingress {
    cidr_blocks = "${var.sg_ingress_source_cidr}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  tags {
    Name = "${var.security_group_name}"
  }

}
