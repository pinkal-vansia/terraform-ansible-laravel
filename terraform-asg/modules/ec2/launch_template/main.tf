data "template_file" "app_payload" {
  template = "${file("${path.module}/templates/user_data.tpl")}"
}


resource "aws_launch_template" "launch-template" {
  image_id = "${var.image_id}"
  key_name = "id_rsa_mac"
  instance_type = "t2.micro"

  user_data = "${base64encode(data.template_file.app_payload.rendered)}"

  network_interfaces {
    security_groups = ["${var.security_group_id}"]
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}