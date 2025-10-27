variable "project_id"      { type = string }
variable "network"         { type = string }
variable "internal_ranges" { 
    type = list(string) 
    default = [] 
}
variable "internal_allow" {
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}
variable "custom_rules" {
  type    = any
  default = {}
}
