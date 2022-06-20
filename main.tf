provider "aws" {
    region = "eu-west-2"
}


resource "aws_vpc" "dev-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "dev test"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "dev subnet test 1"
  }
}