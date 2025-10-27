locals {
  apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}
resource "google_project_service" "enabled_apis" {
  for_each = toset(local.apis)

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}


resource "google_storage_bucket" "main_bucket" {
  name          = "${var.project_id}-${var.environment}-bucket"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}