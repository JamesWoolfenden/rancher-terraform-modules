
module "compute_asg" {
  source = "../../../modules/aws/compute/asg"
  name                = "${var.name}-compute"
  userdata            = data.template_file.compute_userdata.rendered
  health_check_type   = "EC2"
  ssh_key_name        = var.ssh_key_name
  security_groups     = module.ipsec_sg.ipsec_id
  lb_ids              = ""
  health_check_target = "HTTP:1620/ping"
  ami_id              = "ami-5c5a3f4a"
  subnet_ids          = var.subnet_ids
  vpc_id              = var.vpc_id
  instance_type       = var.aws_instance_type
  common_tags=var.common_tags
}
