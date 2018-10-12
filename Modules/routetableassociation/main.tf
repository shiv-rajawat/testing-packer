resource "aws_route_table_association" "rt_association" {
  count = "${var.count}"
  subnet_id      = "${element(var.subnet_id, (count.index))}"
  route_table_id = "${var.rt_id}"
}
