resource "google_service_account" "run_sa" {
  account_id   = "${var.env}-${var.service_name}-sa"
  display_name = "Cloud Run SA for ${var.service_name} (${var.env})"
}

resource "google_vpc_access_connector" "connector" {
  name          = "${var.env}-${var.service_name}-conn"
  region        = var.region
  network       = var.network_id
  ip_cidr_range = var.connector_cidr
  min_instances = 2
  max_instances = 3
}

resource "google_cloud_run_v2_service" "svc" {
  name     = "${var.env}-${var.service_name}"
  location = var.region

  template {
    service_account = google_service_account.run_sa.email

    scaling {
      min_instance_count = var.min_instances
      max_instance_count = var.max_instances
    }

    vpc_access {
      connector = google_vpc_access_connector.connector.id
      egress    = "PRIVATE_RANGES_ONLY"
    }

    containers {
      image = var.image
      resources {
        limits = { cpu = "1", memory = "512Mi" }
      }
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  name     = google_cloud_run_v2_service.svc.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}