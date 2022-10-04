# Run tf init every time modules are updated
provider "aws" {
  region = "eu-west-2"
}

module "ec2module" {
  source = "./ec2"
  # define value of variable to be assigned from ec2 module
  ec2name = "Name from module"
}