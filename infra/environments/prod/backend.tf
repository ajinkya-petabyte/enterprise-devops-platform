terraform {
  backend "s3" {
    bucket         = "enterprise-devops-terraform-state-ajinkya"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
