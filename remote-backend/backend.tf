terraform {
  # stores states in remote backend
  backend "s3" {
    region = "eu-west-2"
    key = "terraform/tfstate.tfstate"
    bucket = "tf-remote-backend-jon-aws-admin"
  }
}