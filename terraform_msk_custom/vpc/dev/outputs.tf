output "vpc" {
  value = {
    id         = aws_vpc.vpc.id
    cidr_block = aws_vpc.vpc.cidr_block
    subnet_az1 = aws_subnet.subnet_az1
    subnet_az2 = aws_subnet.subnet_az2
  }
}
