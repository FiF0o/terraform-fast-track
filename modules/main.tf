# Run tf init every time modules are updated

#####################################################################################################
# tf modules: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest?tab=readme #
#####################################################################################################

provider "aws" {
  region = "eu-west-2"
}

module "ec2module" {
  source = "./ec2"
  # define value of variable to be assigned from ec2 module
  ec2name = "Name from module"
}

output "module_output" {
  value = module.ec2module.instance_id
}
