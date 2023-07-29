terraform {
  backend "s3" {
    bucket = "terraform-state-tannv"
    key    = "state-prod/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = var.region
}

module "prod_ec2" {
  source = "../modules/ec2"

  ec2_name="ec2-nodejs-sample-prod"
  ec2_key_name= var.key_name
  ec2_public_key = var.public_key
  env = "prod"
}

module "prod_ecr" {
  source = "../modules/ecr"

  ecr_name = var.repo_name
}

