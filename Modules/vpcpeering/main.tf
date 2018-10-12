resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id = "${var.vpc_id}"
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
  Name = "${var.vpc_name}.peering.connection"
  }
}