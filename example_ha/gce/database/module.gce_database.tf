
module "gce_database" {
  source = "../../../modules/gce/database"

  name      = var.database_name
  region    = "us-central"
  db_tier   = "db-n1-standard-1"
  disk_size = 20
  disk_type = "PD_SSD"
  db_user   = var.db_user
  db_pass   = var.db_pass
}

output "name" {
  value = module.gce_database.name
}
