variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string)
  default = ["one", "two"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "one"
    key2 = "two"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of the vpc"
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["foo", 1, "bar"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Foo"
    port = [22, 25, 80]
  }
}

output "vpcid" {
  value = aws_vpc.my_vpc.id
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}