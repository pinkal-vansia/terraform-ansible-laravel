provider "aws" {
  region = "${var.region}"
  profile = "private-admin"
}

module "vpc_network" {
  source = "./modules/network/vpc"
}

module "igw_network" {
  source = "./modules/network/igw"

  vpc_id = "${module.vpc_network.vpc_id}"
}

module "route_table_network" {
  source = "./modules/network/route_table"

  vpc_id = "${module.vpc_network.vpc_id}"
  igw_id = "${module.igw_network.igw_id}"
  nat_gateway_id = "${module.nat_network.nat_gateway_id}"
}

module "subnet_network" {
  source = "./modules/network/subnet"

  vpc_id = "${module.vpc_network.vpc_id}"
  public_rt_id = "${module.route_table_network.public_rt_id}"
  private_rt_id = "${module.route_table_network.private_rt_id}"
  region = "${var.region}"
  vpc_cidr_prefix = "${module.vpc_network.vpc_cidr_prefix}"
}

module "nat_network" {
  source = "./modules/network/nat"

  subnet_id = "${module.subnet_network.public_subnet_1_id}"
}

module "security_group_network" {
  source = "./modules/network/security_group"

  vpc_id = "${module.vpc_network.vpc_id}"
}

module "launch_template_ec2"{
  source = "./modules/ec2/launch_template"

  security_group_id = "${module.security_group_network.cluster_sg_id}"
  security_group = "${module.security_group_network.name}"
  image_id = "ami-0ac019f4fcb7cb7e6"
  vpc_id = "${module.vpc_network.vpc_id}"
}

module "elb_ec2" {
  source = "./modules/ec2/elb"

  security_group = "${module.security_group_network.elb_sg_id}"
  public_subnet_id_1 = "${module.subnet_network.public_subnet_1_id}"
  public_subnet_id_2 = "${module.subnet_network.public_subnet_2_id}"
}

module "asg_ec2" {
  source = "./modules/ec2/auto_scaling_group"
  
  lt_id = "${module.launch_template_ec2.lt_id}"
  elb_id = "${module.elb_ec2.elb_id}"
  private_subnet_1_id = "${module.subnet_network.private_subnet_1_id}"
  private_subnet_2_id = "${module.subnet_network.private_subnet_2_id}"
}