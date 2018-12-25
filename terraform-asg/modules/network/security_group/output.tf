output "ec2_sg_id" {
  value = "${aws_security_group.ec2-security-group.id}"
  description = "Cluster Security Group ID"
}

output "ec2_sg_name" {
  value = "${aws_security_group.ec2-security-group.name}"
  description = "Cluster Security Group name"
}

output "elb_sg_id" {
  value = "${aws_security_group.elb-sg.id}"
  description = "ELB Security Group ID"
}

output "elb_sg_name" {
  value = "${aws_security_group.elb-sg.name}"
  description = "ELB Security Group ID"
}