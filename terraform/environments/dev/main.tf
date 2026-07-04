module "vpc" {

  source = "../../modules/vpc"

  aws_region = var.aws_region

  project = var.project

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  enable_dns_support = var.enable_dns_support

  enable_dns_hostnames = var.enable_dns_hostnames

}
module "internet_gateway" {

  source = "../../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id

  project = var.project

  environment = var.environment

}
module "public_subnets" {

  source = "../../modules/public-subnets"

  vpc_id = module.vpc.vpc_id

  project = var.project

  environment = var.environment

  public_subnet_1_cidr = var.public_subnet_1_cidr

  public_subnet_2_cidr = var.public_subnet_2_cidr

  availability_zone_1 = var.availability_zone_1

  availability_zone_2 = var.availability_zone_2
}
module "route_table" {

  source = "../../modules/route-table"

  vpc_id = module.vpc.vpc_id

  internet_gateway_id = module.internet_gateway.internet_gateway_id

  project = var.project

  environment = var.environment

}
module "route_table_association" {

  source = "../../modules/route-table-association"

  public_route_table_id = module.route_table.public_route_table_id

  public_subnet_1_id = module.public_subnets.public_subnet_1_id

  public_subnet_2_id = module.public_subnets.public_subnet_2_id
}
