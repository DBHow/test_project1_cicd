# data "google_secret_manager_secret_version" "db_password" {
#   project = var.project_id
#   secret  = "postgres-db-password"
#   version = "latest"
# }

# # Reserve IP range for Private Service Connection
# resource "google_compute_global_address" "private_ip_address" {
#   name          = "dev-postgres-private-ip"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   address       = "10.100.0.0"
#   prefix_length = 16
#   network       = module.network.network_self_link
#   project       = var.project_id
# }

# # Create Private Service Connection
# resource "google_service_networking_connection" "private_vpc_connection" {
#   network                 = module.network.network_self_link
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
# }

# module "postgresql_db" {
#   source = "../../modules/database/postgresql"

#   project_id           = var.project_id
#   region               = var.region
#   pg_db_name           = var.pg_db_name
#   pg_user_name         = var.pg_user_name
#   pg_user_password     = data.google_secret_manager_secret_version.db_password.secret_data
#   private_network      = module.network.network_self_link

#   depends_on = [
#     google_service_networking_connection.private_vpc_connection,
#     google_project_service.enabled_apis
#   ]
# }
