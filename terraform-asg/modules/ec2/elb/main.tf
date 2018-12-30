resource "aws_elb" "elb" {
  security_groups = ["${var.security_group}"]
  subnets = ["${var.public_subnet_id_1}", "${var.public_subnet_id_2}"]

  tags {
    Name = "${terraform.workspace}-elb"
    Environment = "${terraform.workspace}"
  }

  "listener" {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
}