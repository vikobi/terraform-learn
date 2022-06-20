variable "subnet_cidr_block" {
    description = "subnet cidr block"
    default = "10.0.1.0/24"
    type = string
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
}
variable "environment" {
    description = "development environment"
}

resource "aws_vpc" "dev-vpc" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "dev test"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "eu-west-2a"

  tags = {
    Name = "dev subnet test 1"
  }
}

data "aws_vpc" "existing" {
  cidr_block        = "172.31.0.0/16"
  }

resource "aws_subnet" "dev-subnet-2" {
  vpc_id            = data.aws_vpc.existing.id
  availability_zone = "eu-west-2b"
  cidr_block        = "172.31.0.0/20"

  tags = {

      Name = "addon default subnet"
  }
}