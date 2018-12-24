resource "aws_autoscaling_group" "asg" {
  max_size = 2
  min_size = 2
  load_balancers = ["${var.elb_id}"]
  vpc_zone_identifier = ["${var.private_subnet_1_id}", "${var.private_subnet_2_id}"]

  launch_template {
    id = "${var.lt_id}"
    version = "$$Latest"
  }

}