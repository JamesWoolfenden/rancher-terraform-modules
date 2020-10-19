// Configure the Google Cloud provider
provider "google" {
  project = var.gce_project
  region  = var.gce_region
}
