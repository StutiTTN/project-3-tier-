resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_private_subnet_1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_private_subnet_2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
}
