# module "web_vm" {
#   source = "../../modules/vm"

#   project_id          = var.project_id
#   region              = var.region
#   zone                = "${var.region}-a"
#   vm_name             = "web-server"
#   machine_type        = "e2-micro"
#   network             = module.network.network_name
#   subnetwork          = "dev-subnet-01"
#   subnetwork_project  = var.project_id
#   tags                = ["web"]
  
#   source_image_family  = "ubuntu-2204-lts"
#   source_image_project = "ubuntu-os-cloud"
  
#   disk_size_gb = 10
#   disk_type    = "pd-standard"

#   # Enable public IP
#   access_config = [{
#     nat_ip       = ""
#     network_tier = "PREMIUM"
#   }]

#   depends_on = [google_project_service.enabled_apis]
# }
