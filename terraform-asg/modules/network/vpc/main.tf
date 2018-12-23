resource "aws_vpc" "terrexa" {
  cidr_block = "${lookup(var.vpc_cidr_prefix,terraform.workspace)}.${lookup(var.vpc_cidr_suffix,terraform.workspace)}"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false
  enable_classiclink_dns_support = false

  tags {
    Name = "${terraform.workspace}-vpc"
    Environment = "${terraform.workspace}"
  }
}