# infra/environments/dev/backend.tf
terraform {
  required_version = "~> 1.9"

  backend "gcs" {
    bucket = "zkgp-dev-tfstate"
    prefix = "terraform/state"
  }
}