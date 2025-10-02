terraform {
  backend "gcs" {
    bucket = "test-project-1-terraform-state"
    prefix = "test"
  }
}