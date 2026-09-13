# infra/environments/staging/backend.tf
terraform {
  required_version = "~> 1.9"

  backend "gcs" {
    bucket = "zkgp-staging-tfstate"
    prefix = "terraform/state"
  }
}