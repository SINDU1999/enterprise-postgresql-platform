variable "type" {
  description = "Ingress or Egress"
  type        = string
}

variable "from_port" {
  description = "Starting Port"
  type        = number
}

variable "to_port" {
  description = "Ending Port"
  type        = number
}

variable "protocol" {
  description = "Protocol"
  type        = string
}

variable "security_group_id" {
  description = "Destination Security Group ID"
  type        = string
}

variable "source_security_group_id" {
  description = "Source Security Group ID"
  type        = string
}

variable "description" {
  description = "Rule Description"
  type        = string
}
