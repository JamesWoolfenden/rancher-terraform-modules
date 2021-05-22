variable "name" {}

variable "vpc_id" {}

variable "public_subnet_cidrs" {}

variable "common_tags" {
  type = map(any)
}

resource "aws_security_group" "vpc_allow_from_public_subnets" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name   = "${var.name}-vpc-allow-all-public-subnets-sg"
  vpc_id = var.vpc_id

  egress {
    description = "All out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "All in for me tcp"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "All in for me udp"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    self        = true
  }

  ingress {
    description = "All in for tcp"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = split(",", var.public_subnet_cidrs)
  }

  ingress {
    description = "All in for udp"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = split(",", var.public_subnet_cidrs)
  }
  tags = var.common_tags
}

output "id" {
  value = aws_security_group.vpc_allow_from_public_subnets.id
}
