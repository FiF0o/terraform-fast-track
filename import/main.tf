provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

# tf import aws_vpc.myvpc2 <vpc_id> to bring it under tf control
# e.g resource in the console for deletion
resource "aws_vpc" "myvpc2" {
  cidr_block = "192.168.0.0/24"
}
