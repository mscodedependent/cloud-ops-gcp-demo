data "google_project" "current" {}

#checkov:skip=CKV_GCP_84:Google-managed encryption is sufficient for this project; CSEK adds KMS operational overhead not justified here.
resource "google_artifact_registry_repository" "docker" {
  location      = var.region
  repository_id = "${var.env}-app"
  format        = "DOCKER"

  cleanup_policies {
    id     = "keep-tagged"
    action = "KEEP"
    condition {
      tag_state = "TAGGED"
    }
  }

  cleanup_policies {
    id     = "delete-untagged"
    action = "DELETE"
    condition {
      tag_state  = "UNTAGGED"
      older_than = "1209600s"
    }
  }
}
