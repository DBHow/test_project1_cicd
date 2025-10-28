module "network" {
  source = "../../modules/network"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = "REGIONAL"
  subnets = var.subnets
}

module "firewall" {
  source = "../../modules/firewall"

  project_id      = var.project_id
  network         = module.network.network_name
  internal_ranges = module.network.subnets_ips
  internal_allow  = var.internal_allow
  custom_rules    = var.custom_rules

  depends_on = [google_project_service.enabled_apis]
}
