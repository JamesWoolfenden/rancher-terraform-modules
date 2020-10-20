resource "aws_autoscaling_group" "alb" {
  name  = "${var.name}-asg"
  count = 1 - var.use_elb

  min_size         = var.scale_min_size
  max_size         = var.scale_max_size
  desired_capacity = var.scale_desired_size

  health_check_grace_period = 900
  health_check_type         = var.health_check_type
  force_delete              = false
  target_group_arns         = var.target_group_arn

  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.config.name

  tags = [
    {
      key                 = "Name"
      value               = var.name
      propagate_at_launch = true
    },
    {
      key                 = "spot-enabled"
      value               = var.spot_enabled
      propagate_at_launch = true
    },
    var.common_tags,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
