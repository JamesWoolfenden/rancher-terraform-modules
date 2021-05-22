
variable "name" {
  default = "vpc"
}

variable "cidr" {}

resource "aws_vpc" "vpc" {
  # checkov:skip=CKV2_AWS_11: ADD REASON
  # checkov:skip=CKV2_AWS_12: ADD REASON
  # checkov:skip=CKV2_AWS_1: ADD REASON
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = var.name
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
