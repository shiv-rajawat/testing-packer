resource "aws_security_group_rule" "sg_rule" {
  type            = "${var.rule_type}"
  from_port       = "${var.from_port}"
  to_port         = "${var.to_port}"
  protocol        = "${var.protocol}"
  cidr_blocks     = "${var.source_cidr}"
  security_group_id = "${var.sg_id}"
}
