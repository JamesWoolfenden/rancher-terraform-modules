variable "name" {}

variable "security_groups" {
  type = list(any)
}

variable "public_subnets" {
  type = list(any)
}

variable "ssl_certificate_arn" {}

variable "instance_http_port" {
  default = "81"
}

variable "instance_http_port_proto" {
  default = "tcp"
}

variable "instance_ssl_port_proto" {
  default = "tcp"
}

variable "instance_ssl_port" {
  default = "81"
}

variable "health_check_target" {
  default = "HTTP:80/ping"
}

variable "proxy_proto_port_string" {
  default = ["81", "444"]
}
