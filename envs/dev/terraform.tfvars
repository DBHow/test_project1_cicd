network_name = "dev-vpc"

subnets = [
  {
    subnet_name           = "dev-subnet-01"
    subnet_ip             = "10.10.10.0/24"
    subnet_region         = "us-south1"
    subnet_private_access = false
    subnet_flow_logs      = true
  },
  {
    subnet_name           = "dev-subnet-02"
    subnet_ip             = "10.10.20.0/24"
    subnet_region         = "us-south1"
    subnet_private_access = true
    subnet_flow_logs      = true
  }
]

internal_allow = [
  { protocol = "icmp" }
]

custom_rules = {
  allow-web-traffic = {
    description          = "Allow SSH, HTTP, HTTPS to web servers"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["0.0.0.0/0"]
    use_service_accounts = false
    sources              = []
    targets              = ["web"]
    rules                = [{ protocol = "tcp", ports = ["22", "80", "443"] }]
    extra_attributes     = { priority = 1000 }
  }
  
  allow-mssql-from-web = {
    description          = "Allow SQL Server from web subnet to SQL Server VMs"
    direction            = "INGRESS"
    action               = "allow"
    ranges               = ["10.10.10.0/24"]  # dev-subnet-01
    use_service_accounts = false
    sources              = ["web"]
    targets              = ["mssql"]
    rules                = [{ protocol = "tcp", ports = ["1433"] }]
    extra_attributes     = { priority = 1000 }
  }
  
  allow-cloudsql-from-web = {
    description          = "Allow PostgreSQL from web subnet to Cloud SQL Private IP"
    direction            = "EGRESS"
    action               = "allow"
    ranges               = ["10.100.0.0/16"]  # Cloud SQL Private Service Connection range
    use_service_accounts = false
    sources              = ["web"]
    targets              = []
    rules                = [{ protocol = "tcp", ports = ["5432"] }]
    extra_attributes     = { priority = 1000 }
  }
}

pg_db_name = "pg-db-1"
pg_user_name = "dba_master"