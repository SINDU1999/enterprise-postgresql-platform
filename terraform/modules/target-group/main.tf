resource "aws_lb_target_group" "this" {
  name     = "${var.project}-${var.environment}-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.project}-${var.environment}-tg"
    Project     = var.project
    Environment = var.environment
  }
}
