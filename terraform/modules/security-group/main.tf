resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = var.description
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all outbound traffic"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.security_group_name
    Project     = var.project
    Environment = var.environment
  }
}
