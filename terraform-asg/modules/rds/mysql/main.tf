resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${var.private_subnet_1_id}", "${var.private_subnet_2_id}"]

  tags {
    Name = "${terraform.workspace}-db_subnet"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "${var.db_name}"
  username             = "${var.root_username}"
  password             = "${var.root_password}"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  final_snapshot_identifier = "final-snapsbhot"

  tags {
    Name = "${terraform.workspace}-mysql"
    Environment = "${terraform.workspace}"
  }
}