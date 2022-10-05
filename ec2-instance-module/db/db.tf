resource "aws_instance" "db" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
