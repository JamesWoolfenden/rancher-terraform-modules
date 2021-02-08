variable "name" {}

variable "project_template_id" {}

variable "aws_region" {}

variable "vpc_id" {}

variable "ipsec_node_cidrs" { type = list(any) }

variable "ssh_key_name" {}

variable "subnet_ids" {}

variable "aws_instance_type" {}

variable "cattle_agent_ip" {}

variable "rancher_api_url" {}

variable "subnet_cidrs" {
  type = list(any)
}

variable "common_tags" {
  type = map(any)
}
