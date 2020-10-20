variable "rancher_hostname" {}

variable "domain_name" {}

variable "aws_region" {}

variable "aws_ami_id" {}

variable "aws_env_name" {}

variable "aws_instance_type" {}

variable "rancher_version" {}

variable "api_ui_version" {}

variable "spot_enabled" {}

variable "health_check_type" {
  default = "EC2"
}

variable "sysdig_key" {}

variable "cloudflare_token" {
  default = ""
}

variable "cloudflare_email" {
  default = ""
}

variable "aws_key_pair" {
  type    = string
  default = "value"
}

variable "common_tags" {}

variable "vpc_id" {}

variable "rancher_com_arn" {}

variable "public_subnet_cidrs" {}

variable "public_subnet_ids" {}

variable "username" {}
variable "password" {}
variable "database_endpoint" {}
variable "database" {}
