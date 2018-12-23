resource "aws_subnet" "public-subnet-1" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr_prefix}.1.0/24"
  availability_zone = "${var.region}a"

  tags {
    Name = "${terraform.workspace}-public-subnet-1"
    Env =  "${terraform.workspace}"
    Type = "public"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr_prefix}.2.0/24"
  availability_zone = "${var.region}b"

  tags {
    Name = "${terraform.workspace}-public-subnet-2"
    Env =  "${terraform.workspace}"
    Type = "public"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr_prefix}.5.0/24"
  availability_zone = "${var.region}a"

  tags {
    Name = "${terraform.workspace}-private-subnet-1"
    Env =  "${terraform.workspace}"
    Type = "private"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.vpc_cidr_prefix}.6.0/24"
  availability_zone = "${var.region}b"

  tags {
    Name = "${terraform.workspace}-private-subnet-2"
    Env =  "${terraform.workspace}"
    Type = "private"
  }
}

resource "aws_route_table_association" "public-subnet" {
  route_table_id = "${var.public_rt_id}"
  subnet_id = "${aws_subnet.public-subnet-1.id}"
}

resource "aws_route_table_association" "public-subnet-2" {
  route_table_id = "${var.public_rt_id}"
  subnet_id = "${aws_subnet.public-subnet-2.id}"
}

resource "aws_route_table_association" "private-subnet-1" {
  route_table_id = "${var.private_rt_id}"
  subnet_id = "${aws_subnet.private-subnet-1.id}"
}

resource "aws_route_table_association" "private-subnet-2" {
  route_table_id = "${var.private_rt_id}"
  subnet_id = "${aws_subnet.private-subnet-2.id}"
}