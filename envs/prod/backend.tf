terraform {
  backend "gcs" {
    bucket = "cicd-project-terraform"
    prefix = "state/prod"
  }
}
