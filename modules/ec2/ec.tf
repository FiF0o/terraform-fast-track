variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}