resource "google_sql_database_instance" "master" {
  name             = var.name
  region           = var.region
  database_version = "MYSQL_5_6"

  settings {
    backup_configuration {
      enabled = true
    }
    tier      = var.db_tier
    disk_size = var.disk_size
    disk_type = var.disk_type

    ip_configuration {
      ipv4_enabled = true
      require_ssl  = true
    }
  }
}
