resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy_vpc
  enable_dns_hostnames = var.enable_dns_hostnames_vpc
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}


resource "aws_route" "route1" { 
  route_table_id         = aws_vpc.my_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
} 
