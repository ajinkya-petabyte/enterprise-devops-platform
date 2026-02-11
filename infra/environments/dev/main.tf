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

  vpc_name           = "enterprise-dev-vpc"
  cidr               = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  az                 = "ap-south-1a"
}

module "security_group" {
  source = "../../modules/security-group"

  name             = "enterprise-dev-sg"
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = ["0.0.0.0/0"]
}

module "ec2" {
  source = "../../modules/ec2"

  name              = "enterprise-dev-server"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = "your-key-name"
}

