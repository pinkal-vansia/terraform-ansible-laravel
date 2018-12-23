resource "aws_route_table" "public_rt" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }

  tags {
    Name = "${terraform.workspace}-public-rt"
    Env = "${terraform.workspace}"
    Type = "public"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.nat_gateway_id}"
  }

  tags {
    Name = "${terraform.workspace}-private-rt"
    Env = "${terraform.workspace}"
    Type = "private"
  }
}