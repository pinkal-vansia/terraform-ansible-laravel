output "public_subnet_1_id" {
  value = "${aws_subnet.public-subnet-1.id}"
  description = "Public Subnet 1 ID"
}

output "public_subnet_1_cidr_block" {
  value = "${aws_subnet.public-subnet-1.cidr_block}"
  description = "Public Subnet 1 CIDR Block"
}

output "public_subnet_2_id" {
  value = "${aws_subnet.public-subnet-2.id}"
  description = "Public Subnet 2 ID"
}

output "public_subnet_2_cidr_block" {
  value = "${aws_subnet.public-subnet-2.cidr_block}"
  description = "Public Subnet 2 CIDR Block"
}

output "private_subnet_1_id" {
  value = "${aws_subnet.private-subnet-1.id}"
  description = "Private Subnet 1 ID"
}

output "private_subnet_1_cidr_block" {
  value = "${aws_subnet.private-subnet-1.cidr_block}"
  description = "Private Subnet 1 CIDR Block"
}

output "private_subnet_2_id" {
  value = "${aws_subnet.private-subnet-2.id}"
  description = "Private Subnet 2 ID"
}

output "private_subnet_2_cidr_block" {
  value = "${aws_subnet.private-subnet-1.cidr_block}"
  description = "Private Subnet 2 CIDR Block"
}