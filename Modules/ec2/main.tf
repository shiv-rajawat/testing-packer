resource "aws_instance" "ec2" {
    count = "${var.count}"
    ami = "${var.ec2_ami}"
    availability_zone = "${var.ec2_az}"
    instance_type = "${var.ec2_instance_type}"
    key_name = "${var.ec2_key_name}"
    subnet_id = "${var.ec2_subnet_id}"
    associate_public_ip_address = "${var.associate_public_ip}"
    security_groups = "${var.ec2_sg}"

    tags {
        Name = "tf-instance"
    }
}
