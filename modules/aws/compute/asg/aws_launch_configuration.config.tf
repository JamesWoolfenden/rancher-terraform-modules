resource "aws_launch_configuration" "config" {
  name_prefix = "Launch-Config-${var.name}"
  image_id    = var.ami_id

  security_groups = [split(",", var.security_groups)]

  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  associate_public_ip_address = false
  ebs_optimized               = false
  user_data                   = var.userdata
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }

}
