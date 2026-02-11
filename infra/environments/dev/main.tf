terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name          = "enterprise-dev-vpc"
  cidr              = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  az                = "ap-south-1a"
}
