terraform {
backend "s3" {
  bucket         = "terraform-remote-state-abc0282"
  key            = "level1.tfstate"
  region         = "eu-central-1"
  dynamodb_table = "terraform-remote-state"
}
}
provider "aws" {
  region = "eu-central-1"
}
