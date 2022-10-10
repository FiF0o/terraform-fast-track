provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DB server"
  }
}

resource "aws_instance" "web" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.db
  ]
  tags = {
    "Name" = "Web server"
  }
}

data "aws_instance" "db_search" {
  filter {
    name = "tag:Name"
    values = ["DB server"]
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance
output "dbservers" {
  # returns ami for the data source as example
  value = data.aws_instance.db_search.availability_zone
}