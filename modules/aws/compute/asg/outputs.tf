output "name" {
  value = element(concat(aws_autoscaling_group.alb.*.name, aws_autoscaling_group.elb.*.name), var.use_elb)
}

output "id" {
  value = element(concat(aws_autoscaling_group.alb.*.id, aws_autoscaling_group.elb.*.id), var.use_elb)
}
