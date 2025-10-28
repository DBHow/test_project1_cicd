data "google_secret_manager_secret_version" "db_password" {
  project = var.project_id
  secret  = "postgres-db-password"
  version = "latest"
}

module "postgresql_db" {
  source = "../../modules/database/postgresql"

  project_id           = var.project_id
  region               = var.region
  pg_db_name           = var.pg_db_name
  pg_user_name         = var.pg_db_name
  pg_user_password     = data.google_secret_manager_secret_version.db_password.secret_data
}