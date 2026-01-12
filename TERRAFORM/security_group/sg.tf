################################################################################
# 1. Bastion Security Group (Public)
################################################################################
module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "bastion-sg"
  description = "Allow SSH from the internet"
  vpc_id      = var.vpc_id # Using the variable here!

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH from everywhere"
      cidr_blocks = var.bastion_ingress_cidr
    }
  ]
  egress_rules = ["all-all"]
}

################################################################################
# 2. Frontend Security Group (Private)
################################################################################
module "frontend_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "frontend-sg"
  vpc_id      = var.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH from Bastion"
      source_security_group_id = module.bastion_sg.security_group_id
    }
  ]
  egress_rules = ["all-all"]
}

################################################################################
# 3. Backend Security Group (Private)
################################################################################
module "backend_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "backend-sg"
  vpc_id      = var.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "SSH from Frontend"
      source_security_group_id = module.frontend_sg.security_group_id
    }
  ]
  egress_rules = ["all-all"]
}

################################################################################
# 4. Database Security Group (Private)
################################################################################
module "database_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "database-sg"
  vpc_id      = var.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "MySQL from Backend"
      source_security_group_id = module.backend_sg.security_group_id
    }
  ]
  egress_rules = ["all-all"]
}