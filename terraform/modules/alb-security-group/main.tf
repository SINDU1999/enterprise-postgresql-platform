resource "aws_security_group" "this" {
  name        = "${var.project}-${var.environment}-alb-sg"
  description = "Security Group for Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-${var.environment}-alb-sg"
    Project     = var.project
    Environment = var.environment
  }
}
