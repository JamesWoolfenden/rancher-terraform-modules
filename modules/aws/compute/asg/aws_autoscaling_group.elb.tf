resource "aws_autoscaling_group" "elb" {
  name  = "${var.name}-compute-asg"
  count = var.use_elb

  min_size         = var.scale_min_size
  max_size         = var.scale_max_size
  desired_capacity = var.scale_desired_size

  vpc_zone_identifier  = [split(",", var.subnet_ids)]
  launch_configuration = aws_launch_configuration.config.name

  health_check_grace_period = 900
  health_check_type         = var.health_check_type
  force_delete              = false
  load_balancers            = [split(",", var.lb_ids)]

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
    var.tags,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
