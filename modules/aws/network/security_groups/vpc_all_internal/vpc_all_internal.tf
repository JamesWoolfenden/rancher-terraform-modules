variable "name" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

resource "aws_security_group" "vpc_all" {
  name   = "${var.name}-vpc-allow-all-internal-sg"
  vpc_id = var.vpc_id

  egress {
    description = "all out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "tcp me in"

    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  ingress {
    description = "udp me in"

    from_port = 0
    to_port   = 65535
    protocol  = "udp"
    self      = true
  }

  ingress {
    description = "tcp in"

    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "udp in"

    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = [var.vpc_cidr]
  }
}

output "vpc_all_id" {
  value = aws_security_group.vpc_all.id
}
