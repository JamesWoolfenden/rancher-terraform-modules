terraform {
  required_providers {
    rancher = {
      source  = "rancher/rke"
      version = "1.1.3"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "3.11"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}
