# Create service account for web VM
# resource "google_service_account" "web_vm_sa" {
#   account_id   = "web-vm-sa"
#   display_name = "Web VM Service Account"
#   description  = "Service account for web server VM"
#   project      = var.project_id

#   depends_on = [google_project_service.enabled_apis]
# }

# # Grant necessary roles to the service account
# resource "google_project_iam_member" "web_vm_sa_log_writer" {
#   project = var.project_id
#   role    = "roles/logging.logWriter"
#   member  = "serviceAccount:${google_service_account.web_vm_sa.email}"

#   depends_on = [google_service_account.web_vm_sa]
# }

# resource "google_project_iam_member" "web_vm_sa_metric_writer" {
#   project = var.project_id
#   role    = "roles/monitoring.metricWriter"
#   member  = "serviceAccount:${google_service_account.web_vm_sa.email}"

#   depends_on = [google_service_account.web_vm_sa]
# }

data "google_compute_default_service_account" "default" {
  project = var.project_id
}

module "web_vm" {
  source = "../../modules/vm"

  project_id         = var.project_id
  region             = var.region
  zone               = "${var.region}-a"
  vm_name            = "web-server"
  machine_type       = "e2-micro"
  network            = module.network.network_name
  subnetwork         = "dev-subnet-01"
  subnetwork_project = var.project_id
  tags               = ["web"]

  source_image_family  = "ubuntu-2204-lts"
  source_image_project = "ubuntu-os-cloud"

  disk_size_gb = 10
  disk_type    = "pd-standard"

  # Enable public IP
  access_config = [{
    nat_ip       = ""
    network_tier = "PREMIUM"
  }]

  # Use custom service account
  # service_account = {
  #   email  = google_service_account.web_vm_sa.email
  #   scopes = ["cloud-platform"]
  # }

  service_account = {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }

  depends_on = [google_project_service.enabled_apis]
}
