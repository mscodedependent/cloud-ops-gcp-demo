variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "network_id" {
  type = string
}

variable "tier" {
  type    = string
  default = "db-f1-micro"
}

variable "run_sa_email" {
  type = string
}
