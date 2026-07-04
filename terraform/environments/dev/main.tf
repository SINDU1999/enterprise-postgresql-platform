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
module "elastic_ip" {

  source = "../../modules/elastic-ip"

  project     = var.project
  environment = var.environment
}
module "nat_gateway" {

  source = "../../modules/nat-gateway"

  allocation_id = module.elastic_ip.elastic_ip_id

  subnet_id = module.public_subnets.public_subnet_1_id

  project = var.project

  environment = var.environment
}
module "private_subnets" {

  source = "../../modules/private-subnets"

  vpc_id = module.vpc.vpc_id

  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

  project     = var.project
  environment = var.environment
}
module "private_route_table" {

  source = "../../modules/private-route-table"

  vpc_id = module.vpc.vpc_id

  nat_gateway_id = module.nat_gateway.nat_gateway_id

  project = var.project

  environment = var.environment
}
module "private_route_table_association" {

  source = "../../modules/private-route-table-association"

  private_route_table_id = module.private_route_table.private_route_table_id

  private_subnet_1_id = module.private_subnets.private_subnet_1_id

  private_subnet_2_id = module.private_subnets.private_subnet_2_id
}
