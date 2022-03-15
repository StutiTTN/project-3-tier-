resource "aws_lb" "my_alb" {
  name = "My-ALB"
  internal = "false"
  load_balancer_type = "application"
  subnets         = [var.public_subnet_id_1, var.public_subnet_id_2]
  security_groups = [var.security_group_alb]

  tags = {
    "Name" = "My-ALB"
  }
}

resource "aws_lb_target_group" "Target_Group" {
  name     = "My-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.myvpc_id
}

resource "aws_lb_listener" "listen_rule" {
  load_balancer_arn = aws_lb.my_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.Target_Group.arn
  }
}

resource "aws_lb_target_group_attachment" "TG_attach" {
  target_group_arn = aws_lb_target_group.Target_Group.arn
  target_id        = var.ec2_id1
  port             = 80
}

resource "aws_lb_target_group_attachment" "TG_attach_1" {
  target_group_arn = aws_lb_target_group.Target_Group.arn
  target_id        = var.ec2_id2
  port             = 80
}

output "alb-dns" {
  value = aws_lb.my_alb.dns_name
}
