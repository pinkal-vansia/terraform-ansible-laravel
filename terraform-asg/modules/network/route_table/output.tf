output "public_rt_id" {
  value = "${aws_route_table.public_rt.id}"
  description = "public route table id"
}

output "private_rt_id" {
  value = "${aws_route_table.private_rt.id}"
  description = "private route table id"
}