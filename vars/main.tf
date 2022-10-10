provider "aws" {
  region = "eu-west-2"
}

variable "number_of_servers" {
  type = number
}

# tf plan -var-file=test.tfvars
resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  count = var.number_of_servers
}
