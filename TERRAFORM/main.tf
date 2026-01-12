# 1. VPC Module
module "vpc" {
  source           = "./VPC"
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets
}

# 2. Security Group Module
module "security_groups" {
  source               = "./security_group"
  vpc_id               = module.vpc.vpc_id
  bastion_ingress_cidr = var.bastion_ingress_cidr
}

# 3. RDS Module 
module "rds" {
  source = "./rds"

  # Data from Root Variables
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  
  # Data passed from other Modules (The Bridge)
  vpc_id                     = module.vpc.vpc_id
  db_subnet_group_name       = module.vpc.database_subnet_group_name
  database_security_group_id = module.security_groups.database_security_group_id
}