data "template_file" "usd_data" {
    template = file("/home/stuti/Documents/workshop-project/autoscaling/files/usd.sh")
    vars = {
      endpoint = var.endpoint
    }
}

resource "aws_launch_configuration" "launch_config" {
  name_prefix   = "wordpress"
  image_id      = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  security_groups = var.security_group_instance_id
  user_data = data.template_file.usd_data.rendered
  key_name = var.key_file
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  name                 = "wordpress_asg"
  launch_configuration = aws_launch_configuration.launch_config.name
  desired_capacity     = 2
  min_size             = 1
  max_size             = 4
  vpc_zone_identifier  = var.vpc_zone_identifier
#   lifecycle {
#     create_before_destroy = true
#   }
}

resource "aws_autoscaling_policy" "asg_policy" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
  name                   = "cpu_util_policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
  lb_target_group_arn   = var.alb_target_group_arn
}