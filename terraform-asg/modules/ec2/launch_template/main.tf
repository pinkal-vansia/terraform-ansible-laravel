data "template_file" "app_payload" {
  template = "${file("${path.module}/templates/user_data.tpl")}"

  vars {
    db_address = "${var.db_address}"
    db_username = "${var.db_username}"
    db_password = "${var.db_password}"
    db_name = "${var.db_name}"
  }
}


resource "aws_launch_template" "launch-template" {
  image_id = "${var.image_id}"
  key_name = "${var.key_name}"
  instance_type = "${var.instance_type}"

  user_data = "${base64encode(data.template_file.app_payload.rendered)}"

  network_interfaces {
    security_groups = ["${var.security_group_id}"]
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  monitoring {
    enabled = true
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
      volume_type = "gp2"
      delete_on_termination = true
    }
  }

  tags {
    Name = "${terraform.workspace}-launch-template"
    Environment = "${terraform.workspace}"
  }
}