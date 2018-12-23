output "cluster_sg_id" {
  value = "${aws_security_group.kubernetes-cluster-sg.id}"
  description = "Cluster Security Group ID"
}

output "name" {
  value = "${aws_security_group.kubernetes-cluster-sg.name}"
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