module "network" {
  source      = "../../modules/network"
  env         = "dev"
  region      = "us-east4"
  subnet_cidr = "10.0.0.0/20"
  pods_cidr   = "10.4.0.0/14"
}

module "artifact_registry" {
  source = "../../modules/artifact-registry"
  env    = "dev"
  region = "us-east4"
}

module "run_service" {
  source         = "../../modules/run-service"
  env            = "dev"
  region         = "us-east4"
  service_name   = "app"
  network_id     = module.network.network_self_link
  connector_cidr = "10.8.0.0/28"
}

module "sql" {
  source       = "../../modules/sql"
  env          = "dev"
  region       = "us-east4"
  network_id   = module.network.network_id
  run_sa_email = module.run_service.service_account_email
}

module "secrets" {
  source            = "../../modules/secrets"
  env               = "dev"
  accessor_sa_email = module.run_service.service_account_email
  secrets           = { db-password = var.db_password }
}