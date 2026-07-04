variable "allocation_id" {
  description = "Elastic IP Allocation ID"
  type        = string
}

variable "subnet_id" {
  description = "Public Subnet ID where NAT Gateway will be created"
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
