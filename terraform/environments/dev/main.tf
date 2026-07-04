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
