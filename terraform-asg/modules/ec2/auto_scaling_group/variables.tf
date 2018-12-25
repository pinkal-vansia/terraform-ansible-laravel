variable "lt_id" {
  description = "Launch template ID"
}
variable "elb_id" {
  description = "ELB id"
}
variable "private_subnet_1_id" {
  description = "private subnet 1 id"
}

variable "private_subnet_2_id" {
  description = "private subnet 2 id"
}

variable "instance_max_size" {
  description = "Maximum count of instances"
  default = 2
}

variable "instance_min_size" {
  description = "Minimum count of instances"
  default = 2
}