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
module "database_security_group" {

  source = "../../modules/security-group"

  vpc_id = module.vpc.vpc_id

  security_group_name = "${var.project}-${var.environment}-db-sg"

  description = "Security Group for PostgreSQL Database"

  project = var.project

  environment = var.environment
}
module "application_security_group" {

  source = "../../modules/security-group"

  vpc_id = module.vpc.vpc_id

  security_group_name = "${var.project}-${var.environment}-app-sg"

  description = "Security Group for Application"

  project = var.project

  environment = var.environment
}
module "database_security_group_rule" {

  source = "../../modules/security-group-rule"

  type = "ingress"

  from_port = 5432
  to_port   = 5432

  protocol = "tcp"

  security_group_id = module.database_security_group.security_group_id

  source_security_group_id = module.application_security_group.security_group_id

  description = "Allow PostgreSQL access from Application Security Group"
}
module "application_security_group_rule" {

  source = "../../modules/security-group-rule"

  type = "ingress"

  from_port = 5000
  to_port   = 5000

  protocol = "tcp"

  security_group_id = module.application_security_group.security_group_id

  source_security_group_id = module.alb_security_group.security_group_id

  description = "Allow ALB to access Flask Application"
}
module "db_subnet_group" {

  source = "../../modules/db-subnet-group"

  db_subnet_group_name = "${lower(var.project)}-${var.environment}-db-subnet-group"

  subnet_ids = [
    module.private_subnets.private_subnet_1_id,
    module.private_subnets.private_subnet_2_id
  ]

  project     = var.project
  environment = var.environment
}
module "database_secret" {

  source = "../../modules/secrets-manager"

  secret_name = "${lower(var.project)}-${var.environment}-database-secret"

  username = var.db_username
  password = var.db_password

  project     = var.project
  environment = var.environment
}
module "rds" {

  source = "../../modules/rds"

  db_identifier = var.db_identifier
  db_name       = var.db_name

  engine         = var.db_engine
  engine_version = var.db_engine_version

  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type      = var.db_storage_type

  username = var.db_username
  password = var.db_password

  db_subnet_group_name = module.db_subnet_group.db_subnet_group_name

  vpc_security_group_ids = [
    module.database_security_group.security_group_id
  ]

  multi_az            = var.db_multi_az
  publicly_accessible = var.db_publicly_accessible
  skip_final_snapshot = var.db_skip_final_snapshot

  project     = var.project
  environment = var.environment
}
module "iam_role" {

  source = "../../modules/iam-role"

  project     = var.project
  environment = var.environment
}
module "application_ec2" {

  source = "../../modules/ec2"

  project     = var.project
  environment = var.environment

  ami_id        = var.ami_id
  instance_type = var.instance_type

  subnet_id = module.private_subnets.private_subnet_1_id

  security_group_id = module.application_security_group.security_group_id

  key_name = var.key_name

  iam_instance_profile = module.iam_role.instance_profile_name
}
module "alb_security_group" {

  source = "../../modules/alb-security-group"

  project     = var.project
  environment = var.environment

  vpc_id = module.vpc.vpc_id
}
module "alb" {

  source = "../../modules/alb"

  project     = var.project
  environment = var.environment

  security_group_id = module.alb_security_group.security_group_id

  public_subnet_1_id = module.public_subnets.public_subnet_1_id
  public_subnet_2_id = module.public_subnets.public_subnet_2_id
}
module "target_group" {

  source = "../../modules/target-group"

  project     = var.project
  environment = var.environment

  vpc_id = module.vpc.vpc_id
}
module "listener" {

  source = "../../modules/listener"

  alb_arn = module.alb.alb_arn

  target_group_arn = module.target_group.target_group_arn
}
module "target_group_attachment" {

  source = "../../modules/target-group-attachment"

  target_group_arn = module.target_group.target_group_arn

  instance_id = module.application_ec2.instance_id
}
