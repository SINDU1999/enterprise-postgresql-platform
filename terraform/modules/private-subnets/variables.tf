variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 CIDR"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 CIDR"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone 1"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone 2"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}
