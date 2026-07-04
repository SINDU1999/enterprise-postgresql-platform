output "elastic_ip_id" {
  description = "Elastic IP Allocation ID"
  value       = aws_eip.nat.id
}

output "elastic_ip_public_ip" {
  description = "Elastic IP Address"
  value       = aws_eip.nat.public_ip
}
