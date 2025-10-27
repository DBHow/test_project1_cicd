variable "project_id"    { type = string }
variable "network_name"  { type = string }
variable "routing_mode"  { 
    type = string 
    default = "REGIONAL" 
}
variable "subnets" {
  type = list(object({
    subnet_name           = string
    subnet_ip             = string
    subnet_region         = string
    subnet_private_access = optional(bool)
    subnet_flow_logs      = optional(bool)
  }))
}