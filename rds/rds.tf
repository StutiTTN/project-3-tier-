resource "aws_db_instance" "db_instance" {
  identifier = "wordpress"
  allocated_storage    = 20
  max_allocated_storage = 100
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "wordpress"
  username             = "admin"
  password             = "wordpressadmin"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.security_group_rds]
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "main"
  subnet_ids = var.private_subnet_ids
  
  tags = {
    Name = "My DB subnet group"
  }
}
