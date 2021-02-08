variable "name" {}
variable "gce_project" {}
variable "machine_type" {}
variable "zone" {}

variable "server_count" {
  default = "1"
}

variable "service_account_scopes" {
  type = list(any)
}

variable "instance_metadata" {
  type    = map(any)
  default = {}
}

variable "instance_zone" {
  default = "us-central1-a"
}

variable "instance_tags" {
  type    = list(any)
  default = []
}

variable "database_endpoint" {
  default = ""
}

variable "database_user" {
  default = ""
}

variable "database_password" {
  default = ""
}

variable "docker_version" {
  default = "docker-1.12.6"
}

variable "rancher_version" {
  default = "stable"
}

variable "gce-cloud-sql-instance-connection-name" {}

variable "ssh_pub_key" {}
