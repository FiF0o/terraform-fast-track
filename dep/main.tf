provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.db
  ]
}
