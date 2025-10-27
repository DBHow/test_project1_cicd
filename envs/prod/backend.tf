terraform {
  backend "gcs" {
    bucket = "cicd-project-terraform-1234"
    prefix = "state/test3"
  }
}