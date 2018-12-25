resource "aws_security_group" "elb-sg" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-elb-sg"

  tags {
    Name = "${terraform.workspace}-elb-sg"
    Env = "${terraform.workspace}"
    Type = "public"
  }
}

resource "aws_security_group_rule" "elb_allow_80_inbound" {
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = "${aws_security_group.elb-sg.id}"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elb_allow_all_outboud" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = "${aws_security_group.elb-sg.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group" "ec2-security-group" {
  vpc_id = "${var.vpc_id}"
  name = "${terraform.workspace}-ec2-security-group"

  tags {
    Name = "${terraform.workspace}-ec2-security-group"
    Env = "${terraform.workspace}"
    Type = "private"
  }
}

resource "aws_security_group_rule" "allow_all_self" {
  to_port = 0
  from_port = 0
  protocol = "-1"
  security_group_id = "${aws_security_group.ec2-security-group.id}"
  type = "ingress"
  self = true
}

resource "aws_security_group_rule" "allow_80_elb" {
  to_port = 80
  from_port = 80
  protocol = "tcp"
  security_group_id = "${aws_security_group.ec2-security-group.id}"
  type = "ingress"
  source_security_group_id = "${aws_security_group.elb-sg.id}"
}

resource "aws_security_group_rule" "allow_all_outboud" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = "${aws_security_group.ec2-security-group.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}