module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "~> 12.0"

  region             = var.region
  project_id         = var.project_id
  subnetwork         = var.subnetwork
  subnetwork_project = var.subnetwork_project

  source_image_family  = var.source_image_family
  source_image_project = var.source_image_project

  machine_type = var.machine_type

  tags = var.tags

  disk_size_gb = var.disk_size_gb
  disk_type    = var.disk_type

  access_config = var.access_config

  service_account = var.service_account
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "~> 12.0"

  region              = var.region
  zone                = var.zone
  subnetwork          = var.subnetwork
  num_instances       = 1
  hostname            = var.vm_name
  add_hostname_suffix = false
  instance_template   = module.instance_template.self_link
}
