terraform {
  backend "s3" {
    bucket = "terraform-state-tannv"
    key    = "state-dev/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = var.region
}

module "prod_ecr" {
  source = "../modules/ecr"

  ecr_name = var.repo_name
}

