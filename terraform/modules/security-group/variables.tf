variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_group_name" {
  description = "Security Group Name"
  type        = string
}

variable "description" {
  description = "Security Group Description"
  type        = string
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}
