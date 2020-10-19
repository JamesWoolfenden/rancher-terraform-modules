variable "name" {}

variable "vpc_id" {}

variable "environment_cidrs" {}

resource "aws_security_group" "rancher_ip_sec" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  egress {
    description = "All out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "All in tcp"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "All in udp"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    self        = true
  }

  ingress {
    description = "Just 500 on udp"
    from_port   = 500
    to_port     = 500
    protocol    = "udp"
    cidr_blocks = [split(",", var.environment_cidrs)]
  }

  ingress {
    description = "Just 4500 on udp"
    from_port   = 4500
    to_port     = 4500
    protocol    = "udp"
    cidr_blocks = [split(",", var.environment_cidrs)]
  }
}

output "ipsec_id" {
  value = aws_security_group.rancher_ip_sec.id
}
