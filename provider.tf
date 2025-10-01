terraform {
backend "s3" {
  bucket = "terraform-remote-state-abc0282"
  key    = "terraform.tfstate"
  region = "eu-central-1"
}
}
provider "aws" {
  region = "eu-central-1"
}
