variable "aws_region" {}

variable "aws_env_name" {}

variable "database_password" {}

variable "aws_rds_instance_class" {}

variable "common_tags" {
  type = map(any)
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(any)
}

variable "private_subnet_cidrs" {
  type = list(any)
}
