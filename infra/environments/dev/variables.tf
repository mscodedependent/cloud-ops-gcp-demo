variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type    = string
  default = "us-east4"
}

variable "db_password" {
  type      = string
  sensitive = true
}
