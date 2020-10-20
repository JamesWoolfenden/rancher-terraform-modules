module "compute" {
  source = "../../../modules/aws/compute/ha-mgmt"

  vpc_id          = var.vpc_id
  name            = "${var.aws_env_name}-management"
  ami_id          = var.aws_ami_id
  instance_type   = var.aws_instance_type
  ssh_key_name    = var.aws_key_pair
  security_groups = module.management_sgs.management_node_sgs
  lb_ids          = [module.management_elb.elb_id]
  spot_enabled    = var.spot_enabled

  subnet_ids                  = var.public_subnet_ids
  externally_defined_userdata = data.template_file.userdata.rendered
  health_check_type           = var.health_check_type
  common_tags                 = var.common_tags
}
