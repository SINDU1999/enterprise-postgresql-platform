aws_region = "ap-south-1"

project = "EnterpriseCloudPlatform"

environment = "dev"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = true

enable_dns_hostnames = true

public_subnet_1_cidr = "10.0.1.0/24"

public_subnet_2_cidr = "10.0.2.0/24"

availability_zone_1 = "ap-south-1a"

availability_zone_2 = "ap-south-1b"

private_subnet_1_cidr = "10.0.3.0/24"

private_subnet_2_cidr = "10.0.4.0/24"

db_username = "postgres"

db_password = "Hanuman1999"

db_identifier          = "enterprisecloudplatform-dev-postgresql"

db_name                = "enterprise_db"

db_engine              = "postgres"

db_engine_version      = "17.10"

db_instance_class      = "db.t3.micro"

db_allocated_storage   = 20

db_storage_type        = "gp3"

db_multi_az            = false

db_publicly_accessible = false

db_skip_final_snapshot = true

ami_id        = "ami-0f9235932f10668d4"

instance_type = "t3.micro"

key_name      = "postgre"
