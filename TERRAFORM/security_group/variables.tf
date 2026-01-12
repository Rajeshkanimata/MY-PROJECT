variable "vpc_id" {
  description = "The ID of the VPC (passed from root)"
  type        = string
}

variable "bastion_ingress_cidr" {
  description = "CIDR block allowed to SSH into Bastion"
  type        = string
}