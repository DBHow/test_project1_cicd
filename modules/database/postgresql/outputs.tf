output "instance_name" {
  description = "Name of the Cloud SQL instance"
  value       = module.postgresql.instance_name
}

output "connection_name" {
  description = "Connection string for the instance"
  value       = module.postgresql.connection_name
}

output "public_ip_address" {
  description = "Public IP address of the instance"
  value       = module.postgresql.public_ip_address
}