output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP Address"
  value       = aws_instance.this.private_ip
}
