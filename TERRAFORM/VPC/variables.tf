# ... (previous variables for vpc_cidr, azs, etc.)

variable "database_subnets" {
  description = "A list of database subnets"
  type        = list(string)
}
