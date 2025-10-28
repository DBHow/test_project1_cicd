variable "project_id" {
  description = "Project ID to deploy the VM instance"
  type        = string
}

variable "region" {
  description = "Region for the VM instance"
  type        = string
}

variable "zone" {
  description = "Zone for the VM instance"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the VM instance"
  type        = string
  default     = "e2-medium"
}

variable "network" {
  description = "Network name for the VM instance"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name for the VM instance"
  type        = string
}

variable "subnetwork_project" {
  description = "Project ID of the subnetwork"
  type        = string
}

variable "tags" {
  description = "Network tags for the VM instance"
  type        = list(string)
  default     = []
}

variable "source_image_family" {
  description = "Source image family for the boot disk"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "source_image_project" {
  description = "Project where the source image is hosted"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-standard"
}

variable "access_config" {
  description = "Access configurations for external IP"
  type = list(object({
    nat_ip       = string
    network_tier = string
  }))
  default = [{
    nat_ip       = ""
    network_tier = "PREMIUM"
  }]
}
