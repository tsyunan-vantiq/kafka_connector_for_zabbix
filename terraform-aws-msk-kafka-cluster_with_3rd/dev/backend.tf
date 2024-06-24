terraform {
  backend "s3" {
    bucket                  = "dev-vantiq-terraform"
    key                     = "aws/msk/dev/msk.tfstate"
    region                  = "us-west-2"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "dev"
    encrypt                 = true
  }
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }
