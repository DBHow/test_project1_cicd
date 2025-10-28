output "instance_name" {
  description = "Name of the Cloud SQL instance"
  value       = module.postgresql_single_zone.instance_name
}
