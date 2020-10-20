terraform {
  required_providers {
    rke = {
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

    rancher2 = {
      source = "rancher/rancher2"
      version = "1.10.3"
    }

    rancher = {
      source = "terraform-providers/rancher"
      version = "1.5.0"
    }

  }
}
