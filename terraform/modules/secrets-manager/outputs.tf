output "secret_arn" {
  description = "Secret ARN"
  value       = aws_secretsmanager_secret.this.arn
}

output "secret_name" {
  description = "Secret Name"
  value       = aws_secretsmanager_secret.this.name
}
