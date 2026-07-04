resource "aws_route_table_association" "public_subnet_1" {

  subnet_id = var.public_subnet_1_id

  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "public_subnet_2" {

  subnet_id = var.public_subnet_2_id

  route_table_id = var.public_route_table_id
}
