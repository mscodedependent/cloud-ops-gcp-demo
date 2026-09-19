variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "service_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "connector_cidr" {
  type = string
}

variable "image" {
  type    = string
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "min_instances" {
  type    = number
  default = 0
}

variable "max_instances" {
  type    = number
  default = 3
}
