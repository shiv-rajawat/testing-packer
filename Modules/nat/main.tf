resource "aws_nat_gateway" "gw" {
  allocation_id = "${var.eipid}"
  subnet_id     = "${var.subnet_id}"

  tags {
      Name = "${var.natgw_name}"
  }
}
