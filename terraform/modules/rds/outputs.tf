output "db_instance_id" {
  description = "RDS Instance ID"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_address" {
  description = "RDS Address"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "RDS Port"
  value       = aws_db_instance.this.port
}
