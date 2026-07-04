####################################################
# AWS REGION
####################################################

variable "aws_region" {

  description = "AWS Region where infrastructure will be deployed"

  type = string

}

####################################################
# PROJECT NAME
####################################################

variable "project" {

  description = "Project name"

  type = string

}

####################################################
# ENVIRONMENT
####################################################

variable "environment" {

  description = "Deployment environment"

  type = string

}

####################################################
# VPC CIDR
####################################################

variable "vpc_cidr" {

  description = "CIDR block for VPC"

  type = string

}

####################################################
# DNS SUPPORT
####################################################

variable "enable_dns_support" {

  description = "Enable DNS Support"

  type = bool

  default = true

}

####################################################
# DNS HOSTNAMES
####################################################

variable "enable_dns_hostnames" {

  description = "Enable DNS Hostnames"

  type = bool

  default = true

}
