variable "vpc_id" {}

variable "name" {}

variable "common_tags" {
  type = map(any)
}

resource "aws_security_group" "bastion_host" {
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
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

output "bastion_id" {
  value = aws_security_group.bastion_host.id
}
