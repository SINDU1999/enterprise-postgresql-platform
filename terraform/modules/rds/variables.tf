variable "db_identifier" {
  description = "RDS Instance Identifier"
  type        = string
}

variable "db_name" {
  description = "Initial Database Name"
  type        = string
}

variable "engine" {
  description = "Database Engine"
  type        = string
}

variable "engine_version" {
  description = "Database Engine Version"
  type        = string
}

variable "instance_class" {
  description = "RDS Instance Class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated Storage (GB)"
  type        = number
}

variable "storage_type" {
  description = "Storage Type"
  type        = string
}

variable "username" {
  description = "Database Username"
  type        = string
}

variable "password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Database Security Groups"
  type        = list(string)
}

variable "multi_az" {
  description = "Enable Multi-AZ"
  type        = bool
}

variable "publicly_accessible" {
  description = "Public Accessibility"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip Final Snapshot"
  type        = bool
}

variable "project" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}
