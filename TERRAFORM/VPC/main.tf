# This is a wrapper for the official AWS VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  # NAT Gateway Strategy (Matches your cost-optimized request)
  enable_nat_gateway     = true
  single_nat_gateway     = true 
  one_nat_gateway_per_az = false

  # DNS settings required for EKS and general connectivity
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}