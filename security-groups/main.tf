provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group"  "webtraffic"{
  name = "Allow HTTPS"

  # Stateful
  ingress {
    # single port - https (inbound)
    from_port = 443
    to_port = 443
    protocol = "TCP"
    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound
  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]

  }
}