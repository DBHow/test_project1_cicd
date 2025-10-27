module "firewall" {
  source  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  version = "~> 12.0"

  project_id              = var.project_id
  network                 = var.network
  internal_ranges_enabled = true
  internal_ranges         = var.internal_ranges
  internal_allow          = var.internal_allow
  custom_rules            = var.custom_rules
}