locals {
  secret_names = nonsensitive(keys(var.secrets))
}

resource "google_secret_manager_secret" "this" {
  for_each  = toset(local.secret_names)
  secret_id = "${var.env}-${each.key}"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "this" {
  for_each    = toset(local.secret_names)
  secret      = google_secret_manager_secret.this[each.key].id
  secret_data = var.secrets[each.key]
}

resource "google_secret_manager_secret_iam_member" "accessor" {
  for_each  = toset(local.secret_names)
  secret_id = google_secret_manager_secret.this[each.key].id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.accessor_sa_email}"
}
