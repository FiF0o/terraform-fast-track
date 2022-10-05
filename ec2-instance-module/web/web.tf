resource "aws_instance" "web" {
  ami = "ami-00785f4835c6acf64"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  # boostrap script
  user_data = file("./web/server-script.sh")

  tags = {
    Name = "Web Server"
  }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
 source = "../eip"
 instance_id = aws_instance.web.id
}

module "sg" {
 source = "../sg"
}