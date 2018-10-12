output "vpc_peering" {
  value = "${aws_vpc_peering_connection.vpc_peering.id}"
}
