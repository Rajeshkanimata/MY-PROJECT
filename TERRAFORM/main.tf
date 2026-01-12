# 1. Call the VPC Module
module "vpc" {
  source = "./VPC"

  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets
}

# 2. Call the Security Group Module
module "security_groups" {
  source = "./security_group"

  # This is the "Bridge" line that fixes your error!
  vpc_id               = module.vpc.vpc_id
  bastion_ingress_cidr = var.bastion_ingress_cidr
}