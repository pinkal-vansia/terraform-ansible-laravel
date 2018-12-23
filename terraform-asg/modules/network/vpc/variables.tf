variable "vpc_cidr_prefix" {
  type = "map"

  default = {
    "dev" = "10.1"
    "prod" = "10.2"
  }
}

variable "vpc_cidr_suffix" {
  type = "map"

  default = {
    "dev" = "0.0/16"
    "prod" = "0.0/16"
  }
}