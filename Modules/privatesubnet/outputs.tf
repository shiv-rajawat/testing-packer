output "subnet_id" {
  description = "List of IDs of private subnets"
  value       = ["${aws_subnet.private_subnet.*.id}"]
}

output "subnet_id_map" {
  value = "${zipmap(aws_subnet.private_subnet.*.id, var.subnet_az)}"
}

output "private_subnets_ids" {
  value = "${join(",", aws_subnet.private_subnet.*.id)}"
}

output "subnet_id_count" {
  description = "Count of private subnets"
  value       = "${aws_subnet.private_subnet.count}"
}