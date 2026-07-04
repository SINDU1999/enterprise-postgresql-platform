resource "aws_route_table" "private" {

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "${var.project}-${var.environment}-private-route-table"
  }
}
