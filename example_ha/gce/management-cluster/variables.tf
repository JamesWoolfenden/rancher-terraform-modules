// Expected to be set at runtime by user
variable "gce_project" {}
variable "gce_region" {}
variable "database_endpoint" {}
variable "database_user" {}
variable "database_password" {}
variable "ssh_pub_key" {}
variable "database_name" {
}
variable "rancher_server" {

}

variable "zone" {
  type        = string
  description = ""
  default     = "us-central1-f"
}

variable "machine_type" {
  type        = string
  description = ""
  default     = "n1-standard-2"
}

variable "server_count" {
  type        = number
  description = ""
  default     = 1
}
