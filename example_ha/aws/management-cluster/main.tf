


data "template_file" "userdata" {
  template = file("${path.module}/files/userdata.template")

  vars = {
    database_endpoint = var.database_endpoint
    ip-addr           = "local-ipv4"
    database_name     = var.database
    database_user     = var.username
    database_password = var.password
    rancher_version   = var.rancher_version
    sysdig_key        = var.sysdig_key
    api_ui_version    = var.api_ui_version
  }
}

module "management_elb" {
  source = "../../../modules/aws/network/components/elb"

  name                    = "${var.aws_env_name}-api-mgmt"
  security_groups         = [module.management_sgs.elb_sg_id]
  public_subnets          = var.public_subnet_ids
  instance_ssl_port       = "8080"
  proxy_proto_port_string = "80,8080"
  instance_http_port      = "80"

  health_check_target = "HTTP:8080/v1/scripts/api.crt"

  ssl_certificate_arn = var.rancher_com_arn
}
