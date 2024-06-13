locals {
  name   = "ex-${basename(path.cwd)}"
  region = "us-west-2"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    Example = local.name
    Purpose = "For zabbix kafka-connector"
  }
}
