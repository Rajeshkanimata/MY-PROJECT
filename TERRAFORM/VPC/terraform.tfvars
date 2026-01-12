vpc_cidr = "10.0.0.0/16"
azs      = ["us-east-1a", "us-east-1b"]

# Public: [AZ1-Bastion, AZ2-Empty/LB]
public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]

# Private: [AZ1-Frontend, AZ2-Frontend, AZ1-Backend, AZ2-Backend]
# (We use 4 CIDRs here)
private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]

# Database: [AZ1-DB, AZ2-DB]
database_subnets = ["10.0.201.0/24", "10.0.202.0/24"]
