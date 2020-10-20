terraform {
  required_providers {
    aws = {
      version = "3.44.0"
      source  = "hashicorp/google"
    }
    template = {
      version = "2.2.0"
      source  = "hashicorp/template"
    }
  }
}
