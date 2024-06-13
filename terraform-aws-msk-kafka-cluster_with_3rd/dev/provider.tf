terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.66"
    }
  }
}

provider "aws" {
  region                   = "us-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "dev"
}
