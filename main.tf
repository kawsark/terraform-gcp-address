provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
}

# Primary cluster static IPs
resource "google_compute_address" "consul-static-ip" {
  name   = "consul-static-ip-${count.index}"
  count  = var.address_count
  region = var.gcp_region
}

output "consul-static-ip-addr" {
  value = google_compute_address.consul-static-ip.*.address
}

output "consul-static-ip-name" {
  value = google_compute_address.consul-static-ip.*.name
}

# Secondary cluster static IPs
resource "google_compute_address" "consul-secondary-static-ip" {
  name   = "consul-secondary-static-ip-${count.index}"
  count  = var.secondary_address_count
  region = var.gcp_region_secondary
}

output "consul-secondary-static-ip-addr" {
  value = google_compute_address.consul-secondary-static-ip.*.address
}

output "consul-secondary-static-ip-name" {
  value = google_compute_address.consul-secondary-static-ip.*.name
}

