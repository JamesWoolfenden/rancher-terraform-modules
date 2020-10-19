

module "gce_compute" {
  source                                 = "../../../modules/gce/compute"
  name                                   = var.rancher_server
  gce_project                            = var.gce_project
  machine_type                           = var.machine_type
  zone                                   = var.zone
  server_count                           = var.server_count
  service_account_scopes                 = []
  database_endpoint                      = var.database_endpoint
  database_user                          = var.database_user
  database_password                      = var.database_password
  gce-cloud-sql-instance-connection-name = "${var.gce_project}:${var.gce_region}:${var.database_name}"
  rancher_version                        = "stable"
  ssh_pub_key                            = var.ssh_pub_key
}
