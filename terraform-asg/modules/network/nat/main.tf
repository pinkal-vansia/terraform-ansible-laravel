resource "aws_eip" "eip" {
  count = 1
  vpc = true
}


resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id = "${var.subnet_id}"
}

