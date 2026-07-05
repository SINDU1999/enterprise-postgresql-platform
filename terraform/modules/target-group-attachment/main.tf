resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = var.target_group_arn
  target_id        = var.instance_id
  port             = 5000
}
