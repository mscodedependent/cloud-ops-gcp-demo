output "network_id" { value = google_compute_network.vpc.id }
output "network_self_link" { value = google_compute_network.vpc.self_link }
output "subnet_self_link" { value = google_compute_subnetwork.primary.self_link }