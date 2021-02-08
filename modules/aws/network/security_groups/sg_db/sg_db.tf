variable "vpc_id" {}

variable "security_group_name" {}

variable "source_cidr_blocks" {
  type = list(any)
}

variable "common_tags" {
  type = map(any)
}
resource "aws_security_group" "db_security_group" {
  name        = var.security_group_name
  description = "Security Group ${var.security_group_name}"
  vpc_id      = var.vpc_id

  // allows traffic from the SG itself for tcp
  ingress {
    description = "All self tcp"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }

  // allows traffic from the SG itself for udp
  ingress {
    description = "All self udp"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    self        = true
  }

  // egress
  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.source_cidr_block]
  }

  // allow traffic for TCP 3306
  ingress {
    description = "Inbound 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.source_cidr_blocks]
  }
  tags = var.common_tags
}

output "security_group_id_database" {
  value = aws_security_group.db_security_group.id
}
