resource "aws_security_group" "security_group_alb" {
  name = "alb_security_group"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "LoadBalancer-SG"
  }
}

resource "aws_security_group" "security_group_instance" {
  name        = "security_group_instance"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.security_group_alb.id]
    #cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [aws_security_group.security_group_instance2.id]
    #cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "AutoScaling-SG"
  }
}

resource "aws_security_group" "security_group_instance2" {
  name        = "security_group_instance2"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #security_groups = [aws_security_group.security_group_alb.id]
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #security_groups = [aws_security_group.security_group_alb.id]
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "BastionHost-SG"
  }
}

resource "aws_security_group" "security_group_rds" {
  name        = "security_group_rds"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.security_group_instance.id,aws_security_group.security_group_instance2.id]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "RDS-SG"
  }
}