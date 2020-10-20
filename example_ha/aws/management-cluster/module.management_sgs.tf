
module "management_sgs" {
  source = "../../../modules/aws/network/security_groups/mgmt/ha"

  name                 = var.aws_env_name
  vpc_id               = var.vpc_id
  private_subnet_cidrs = var.public_subnet_cidrs
  common_tags          = var.common_tags
}
