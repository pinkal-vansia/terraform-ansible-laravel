variable "region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "profile" {
  description = "AWS profile to use for provisioning."
}

variable "key_name" {
  description = "ssh key to use"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.small"
}

variable "image_id" {
  description = "AWS AMI ID"
  default = "ami-0ac019f4fcb7cb7e6"
}

variable "instance_max_size" {
  description = "Maximum EC2 instance"
  default = 2
}

variable "instance_min_size" {
  description = "Minimum EC2 instance"
  default = 2
}