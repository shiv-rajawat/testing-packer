resource "aws_route" "route" {
  route_table_id            = "${var.route_table_id}"
  destination_cidr_block    = "${var.rt_destination_cidr_block}"
  gateway_id = "${var.internet_gateway_id}"

}
