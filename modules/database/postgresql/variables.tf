variable "project_id" {
  description = "Project ID to deploy the Cloud SQL instance"
  type        = string
}

variable "pg_db_name" {
  description = "Name of the PostgreSQL instance"
  type        = string
}

variable "region" {
  description = "Region for the Cloud SQL instance"
  type        = string
}

variable "pg_user_name" {
  description = "Database name"
  type        = string
}

variable "pg_user_password" {
  description = "Database password"
  type        = string
}