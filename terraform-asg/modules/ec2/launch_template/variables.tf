variable "image_id" {
  description = "AWS AMI ID"
}

variable "security_group" {
  description = "Security Group name"
}

variable "security_group_id" {
  description = "Security Group name"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "key_name" {
  description = "ssh key to use"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.small"
}

variable "db_address" {
  description = "Mysql address"
}

variable "db_username" {
  description = "Database user"
}

variable "db_password" {
  description = "Database password"
}

variable "db_name" {
  description = "Database name"
}