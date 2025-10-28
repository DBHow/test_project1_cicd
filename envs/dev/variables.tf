# -------------------------
# Core project information
# -------------------------
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
}

variable "environment" {
  description = "Target environment"
  type        = string
}

# -------------------------
# Network configuration
# -------------------------
variable "network_name" {
  description = "Name of the VPC network to create"
  type        = string
  default     = "dev-vpc"
}

variable "subnets" {
  description = "List of subnet configurations for this environment"
  type = list(object({
    subnet_name           = string
    subnet_ip             = string
    subnet_region         = string
    subnet_private_access = optional(bool)
    subnet_flow_logs      = optional(bool)
  }))
}

# -------------------------
# Firewall configuration
# -------------------------
variable "internal_allow" {
  description = "Internal allow rules (protocols and ports) for communication inside the VPC"
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}

variable "custom_rules" {
  description = "Custom firewall rules for environment-specific policies"
  type        = any
  default     = {}
}


# -------------------------
# PostgreSQL DB configuration
# -------------------------
variable "pg_db_name" {
  description = "Database name"
  type        = string
  default     = "dev-postgres"
}

variable "pg_user_name" {
  description = "Database name"
  type        = string
}