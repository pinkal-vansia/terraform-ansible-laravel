output "nat_gateway_id" {
  value = "${aws_nat_gateway.nat.id}"
  description = "NAT Gateway iD"
}