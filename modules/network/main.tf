module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 12.0"

  project_id              = var.project_id
  network_name            = var.network_name
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false
  subnets                 = var.subnets
}