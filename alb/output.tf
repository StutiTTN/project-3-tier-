output "alb_target_group_arn" {
    value = aws_lb_target_group.Target_Group.arn
}

output "alb-dns" {
  value = aws_lb.my_alb.dns_name
}