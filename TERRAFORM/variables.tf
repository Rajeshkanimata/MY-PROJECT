# VPC Variables
variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "database_subnets" { type = list(string) }

# Security Group Variables
variable "bastion_ingress_cidr" {
  type        = string
  description = "CIDR allowed to SSH into the Bastion"
}