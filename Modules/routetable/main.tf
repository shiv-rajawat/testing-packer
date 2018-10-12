resource "aws_route_table" "My_VPC_route_table" {
      vpc_id = "${var.vpc_id}"

tags {
        Name = "${var.route_table_name}"
    }
}
