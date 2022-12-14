provider "aws" {
  region = "eu-west-2"
}

module "db" {
  source = "./db"
  server_names = ["mariadb", "mysql"]
}

resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  count = 2
}
