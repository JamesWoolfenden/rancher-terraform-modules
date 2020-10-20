terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "1.23.0"
    }
    template = {
      version = "2.2.0"
      source  = "hashicorp/template"
    }
  }
}
