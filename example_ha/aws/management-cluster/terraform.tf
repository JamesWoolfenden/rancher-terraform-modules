terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.11.0"
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
