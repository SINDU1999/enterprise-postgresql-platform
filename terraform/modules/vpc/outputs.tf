####################################################
# VPC ID
####################################################

output "vpc_id" {

  description = "ID of the Enterprise VPC"

  value = aws_vpc.this.id

}

####################################################
# VPC ARN
####################################################

output "vpc_arn" {

  description = "ARN of the Enterprise VPC"

  value = aws_vpc.this.arn

}

####################################################
# VPC CIDR
####################################################

output "vpc_cidr" {

  description = "CIDR block of Enterprise VPC"

  value = aws_vpc.this.cidr_block

}
