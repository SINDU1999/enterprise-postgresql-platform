resource "aws_lb" "this" {
  name               = "${var.project}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.security_group_id]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  tags = {
    Name        = "${var.project}-${var.environment}-alb"
    Project     = var.project
    Environment = var.environment
  }
}
