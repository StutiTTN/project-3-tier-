resource "aws_lb" "my_alb" {
  name = "My-ALB"
  internal = "false"
  load_balancer_type = "application"
  subnets         = var.public_subnet_ids
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
