variable "vpc_id" {
  description = "VPC ID where Internet Gateway will be attached"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
