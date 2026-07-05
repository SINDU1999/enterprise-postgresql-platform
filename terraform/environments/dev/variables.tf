variable "aws_region" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}
variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}
variable "db_username" {
  description = "Database Username"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}
variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "db_storage_type" {
  type = string
}

variable "db_multi_az" {
  type = bool
}

variable "db_publicly_accessible" {
  type = bool
}

variable "db_skip_final_snapshot" {
  type = bool
}
variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}
