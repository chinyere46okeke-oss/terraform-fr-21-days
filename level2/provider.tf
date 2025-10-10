terraform {
backend "s3" {
  bucket         = "terraform-remote-state-abc0282"
  key            = "level2.tfstate"
  region         = "eu-central-1"
  use_lockfile   = true
}
}
provider "aws" {
  region = "eu-central-1"
}
