# infra/environments/prod/backend.tf
terraform {
  required_version = "~> 1.9"

  backend "gcs" {
    bucket = "zkgp-prod-tfstate"
    prefix = "terraform/state"
  }
}