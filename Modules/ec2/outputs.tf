output "ec2_id" {
  value = "${join("", aws_instance.ec2.*.id)}"
}
