variable "name" {}

variable "vpc_id" {}

variable "private_subnet_cidrs" {}

variable "common_tags" {
  type = map(any)
}

resource "aws_security_group" "management_ui_elb" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-management_ui_elb_sg"
  description = "Allow ports rancher "
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.common_tags
}

resource "aws_security_group" "management_allow_ui_elb" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-rancher_ha_allow_ui_elb"
  description = "Allow Connection from elb"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.management_ui_elb.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.management_ui_elb.id]
  }

  ingress {
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    security_groups = [aws_security_group.management_ui_elb.id]
  }

  ingress {
    from_port       = 8001
    to_port         = 8001
    protocol        = "tcp"
    security_groups = [aws_security_group.management_ui_elb.id]
  }
  tags = var.common_tags
}

resource "aws_security_group" "management_allow_ui_internal" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-rancher_ha_ui_allow_internal"
  description = "Allow Connection from internal"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = [split(",", var.private_subnet_cidrs)]
  }
  tags = var.common_tags
}

output "elb_sg_id" {
  value = aws_security_group.management_ui_elb.id
}

output "management_node_sgs" {
  value = join(",", list(aws_security_group.management_allow_ui_elb.id,
  aws_security_group.management_allow_ui_internal.id))
}
