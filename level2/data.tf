data "terraform_remote_state" "level1" {
backend = "s3"

config = {
bucket = "terraform-remote-state-abc0282"
key = "level1.tfstate"
region = "eu-central-1"
}
}
