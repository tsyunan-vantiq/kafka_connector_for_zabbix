# terraform {
#   backend "s3" {
#     bucket                  = "dev-vantiq-terraform"
#     key                     = "aws/msk/dev/msk.tfstate"
#     region                  = "ap-northeast-1"
#     shared_credentials_file = "~/.aws/credentials"
#     profile                 = "dev"
#     encrypt                 = true
#   }
# }

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
