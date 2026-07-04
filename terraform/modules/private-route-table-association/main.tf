resource "aws_route_table_association" "private_subnet_1" {

  subnet_id = var.private_subnet_1_id

  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "private_subnet_2" {

  subnet_id = var.private_subnet_2_id

  route_table_id = var.private_route_table_id
}
