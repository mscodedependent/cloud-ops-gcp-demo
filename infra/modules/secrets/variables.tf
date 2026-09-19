variable "env" {
  type = string
}

variable "secrets" {
  type      = map(string)
  sensitive = true
}

variable "accessor_sa_email" {
  type = string
}
