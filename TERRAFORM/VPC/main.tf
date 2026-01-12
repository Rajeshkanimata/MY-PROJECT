module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "my-project-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  
  # 2 Public Subnets (Bastion + Empty/Load Balancer)
  public_subnets  = var.public_subnets

  # 4 Private Subnets (2 for Frontend, 2 for Backend)
  private_subnets = var.private_subnets

  # 2 Database Subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true # This creates the group RDS needs

  enable_nat_gateway = true
  single_nat_gateway = false # Keeps High Availability for your Frontend/Backend
  
  public_subnet_tags = {
    "Name" = "public-tier"
  }
  
  private_subnet_tags = {
    "Name" = "app-tier"
  }

  database_subnet_tags = {
    "Name" = "db-tier"
  }
}
