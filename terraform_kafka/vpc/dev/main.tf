resource "aws_vpc" "vpc" {
  cidr_block = "172.20.0.0/22"
  tags = {
    Name = "dev-msk-test-vpc"
  }
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.azs.names[0]
  cidr_block        = "172.20.0.0/24"
  vpc_id            = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.azs.names[1]
  cidr_block        = "172.20.1.0/24"
  vpc_id            = aws_vpc.vpc.id
}
