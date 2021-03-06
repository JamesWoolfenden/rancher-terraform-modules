variable "vpc_id" {}

variable "name" {}

variable "common_tags" {
  type = map(any)
}

resource "aws_security_group" "bastion_host" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-bastion-host"
  description = "Security group to allow external SSH access"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.data.cidr]
  }

  tags = var.common_tags
}

output "bastion_id" {
  value = aws_security_group.bastion_host.id
}

module "data" {
  source  = "jameswoolfenden/ip/http"
  version = "0.3.2"
}
