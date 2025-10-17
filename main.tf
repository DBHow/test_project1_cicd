resource "google_storage_bucket" "main_bucket" {
  name          = "${var.project_id}-test-bucket"
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
    environment = "development"
    managed_by  = "terraform"
  }
}


