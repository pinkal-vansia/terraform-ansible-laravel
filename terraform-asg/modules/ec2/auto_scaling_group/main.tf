resource "aws_autoscaling_group" "asg" {
  max_size = "${var.instance_max_size}"
  min_size = "${var.instance_min_size}"
  load_balancers = ["${var.elb_id}"]
  vpc_zone_identifier = ["${var.private_subnet_1_id}", "${var.private_subnet_2_id}"]

  launch_template {
    id = "${var.lt_id}"
    version = "$$Latest"
  }

  tags {
    Name = "${terraform.workspace}-asg"
    Environment = "${terraform.workspace}"
  }
}