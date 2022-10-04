resource "aws_instance" "db" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

resource "aws_instance" "web" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

variable "ingress" {
 type = list(number)
 default = [ 80, 443 ]
}

variable "egress" {
 type = list(number)
 default = [ 80, 443 ]
}


resource "aws_security_group" "web_traffic" {
  name = "Allow Web traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}