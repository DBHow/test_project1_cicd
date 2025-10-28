network_name = "dev-vpc"

subnets = [
  {
    subnet_name           = "dev-subnet-01"
    subnet_ip             = "10.10.10.0/24"
    subnet_region         = "us-south1"
    subnet_private_access = true
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
  { protocol = "icmp" },
  { protocol = "tcp", ports = ["22", "80", "443"] }
]

custom_rules = {
  allow-health-checks = {
    description = "Allow Google HC ingress"
    direction   = "INGRESS"
    action      = "allow"
    ranges      = ["130.211.0.0/22", "35.191.0.0/16"]
    use_service_accounts = false
    sources              = []   # empty list means no source tags or SAs
    targets              = []   # empty list means all targets (depends on direction)
    rules = [{ protocol = "tcp", ports = ["80", "443"] }]
    extra_attributes = { priority = 100 }
  }
}

pg_db_name = "pg_db_1"
pg_user_name = "dba_master"