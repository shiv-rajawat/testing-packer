resource "aws_subnet" "private_subnet" {
  count = "${var.subnet_count}"
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${element(var.cidr_block,count.index)}"
  availability_zone = "${element(var.subnet_az, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  #cidr_block        = "${cidrsubnet(var.cidr_block, ceil(log(var.max_subnets, 2)), count.index)}"
  
  tags {
    Name = "${var.environment}-private-${var.subnet_name}-${element(var.subnet_az, count.index)}"
  }
}
