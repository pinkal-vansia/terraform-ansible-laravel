output "vpc_id" {
  description = "The ID of the VPC"
  value = "${aws_vpc.terrexa.id}"
}

output "vpc_cidr_prefix" {
  description = "The first 2 sections of VPC CIDR"
  value = "${lookup(var.vpc_cidr_prefix,terraform.workspace)}"
}