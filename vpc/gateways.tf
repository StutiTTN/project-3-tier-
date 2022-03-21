resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name: "My-IGW"
  }
}

resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "My-NGW"
  }

  depends_on = [aws_internet_gateway.my_igw]
}