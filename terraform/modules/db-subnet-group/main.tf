resource "aws_db_subnet_group" "this" {

  name       = var.db_subnet_group_name

  subnet_ids = var.subnet_ids

  tags = {
    Name        = var.db_subnet_group_name
    Project     = var.project
    Environment = var.environment
  }
}
