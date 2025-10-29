module "postgresql_single_zone" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "~> 26.0"

  name                 = var.pg_db_name
  random_instance_name = true
  database_version     = "POSTGRES_16"
  project_id           = var.project_id
  region               = var.region
  availability_type    = "ZONAL"
  edition              = "ENTERPRISE"
  tier                 = "db-custom-2-8192"

  deletion_protection = false

  ip_configuration = {
    ipv4_enabled        = var.private_network == null ? true : false
    private_network     = var.private_network
    ssl_mode            = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    allocated_ip_range  = null
    authorized_networks = []
  }

  user_name     = var.pg_user_name
  user_password = var.pg_user_password
}
