variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  type        = string
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}
