output "subnet_id" {
  description = "List of IDs of private subnets"
  value       = ["${aws_subnet.public_subnet.*.id}"]
}

output "subnet_id_map" {
  value = "${zipmap(aws_subnet.public_subnet.*.id, var.subnet_az)}"
}

output "subnet_id_count" {
  description = "count of public subnets"
  value       = "${aws_subnet.public_subnet.count}"
}