provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2" {
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}
