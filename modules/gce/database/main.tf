// GCE Cloud SQL is a MySQL compatible persistence service


resource "google_sql_database" "master" {
  name     = "cattle"
  instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "rancher" {
  name     = var.db_user
  instance = google_sql_database_instance.master.name
  host     = "%"
  password = var.db_pass
}

output "name" {
  value = google_sql_database_instance.master.name
}
