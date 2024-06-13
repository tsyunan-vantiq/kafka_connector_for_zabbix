module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]

  create_database_subnet_group = false
  enable_nat_gateway           = true
  single_nat_gateway           = true

  tags = local.tags
}

module "security_group_broker" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "security_group_broker"
  description = "Security group for ${local.name}"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
  ingress_rules = [
    # named ingress rules, ref: https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf
    "kafka-broker-tcp",
    "kafka-broker-tls-tcp"
  ]

  tags = local.tags
}

module "security_group_ec2_client" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "security_group_ec2_client"
  description = "Security group for ${local.name}"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
  ingress_rules = [
    # named ingress rules, ref: https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf
    "zabbix-server",
    "zabbix-agent"
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    },

    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "https"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "kafka_connector"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]

  tags = local.tags
}

module "security_group_ec2_zabbix_agent" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "security_group_ec2_zabbix_agent"
  description = "Security group for ${local.name}"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
  ingress_rules = [
    # named ingress rules, ref: https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf
    "zabbix-agent"
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]

  tags = local.tags
}
