resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
}

