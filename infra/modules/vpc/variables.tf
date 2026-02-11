variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}

variable "az" {
  type        = string
  description = "Availability zone"
}
