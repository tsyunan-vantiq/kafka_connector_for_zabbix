data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket                   = "dev-vantiq-terraform"
    key                      = "aws/vpc/dev.tfstate"
    region                   = "ap-northeast-1"
    shared_credentials_files = ["~/.aws/credentials"]
    profile                  = "dev"
  }
}
