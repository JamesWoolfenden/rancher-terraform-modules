variable "vpc_id" {}

variable "name" {}

variable "common_tags" {
  type = map(any)
}

resource "aws_security_group" "web_elb_front" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-web-elb-world"
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

resource "aws_security_group" "web_elb_back" {
  # checkov:skip=CKV2_AWS_5: ADD REASON
  name        = "${var.name}-web-elb-hosts"
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
    security_groups = ["${aws_security_group.web_elb_front.id}"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web_elb_front.id}"]
  }
  tags = var.common_tags
}

output "web_elb_sg_ids" {
  value = join(",", list(aws_security_group.web_elb_front.id,
  aws_security_group.web_elb_back.id))
}

output "web_elb_backend_sg_id" {
  value = aws_security_group.web_elb_back.id
}
