output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
  description = "The ID of the IGW"
}