module "ec2_instance_zabbix_server_with_connector" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "ec2_instance_zabbix_server_with_connector"

  instance_type               = "c5.xlarge"
  key_name                    = aws_key_pair.user1-key.key_name
  monitoring                  = true
  user_data                   = data.template_file.bastion.rendered
  associate_public_ip_address = true

  vpc_security_group_ids = [module.security_group_ec2_client.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  ami                    = data.aws_ami.ubuntu.image_id

  tags = {
    Purpose     = "For zabbix kafka-connector"
    Environment = "dev"
  }
}

module "ec2_instance_zabbix_agent" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "ec2_instance_zabbix_agent"

  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.user2-key.key_name
  monitoring                  = true
  user_data                   = data.template_file.bastion.rendered
  associate_public_ip_address = true

  vpc_security_group_ids = [module.security_group_ec2_zabbix_agent.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 1)
  ami                    = data.aws_ami.ubuntu.image_id

  tags = {
    Purpose     = "For zabbix agent"
    Environment = "dev"
  }
}

resource "aws_key_pair" "user1-key" {
  key_name_prefix = "dev-user1-key-"
  public_key      = file("./id_rsa_eks_bastion.pub")
  tags = {
    Purpose     = "For zabbix agent"
    Environment = "dev"
  }
}

resource "aws_key_pair" "user2-key" {
  key_name_prefix = "dev-user2-key-"
  public_key      = file("./id_rsa_eks_bastion.pub")
  tags = {
    Purpose     = "For zabbix agent"
    Environment = "dev"
  }
}

data "template_file" "bastion" {
  template = file("${path.module}/bastion-userdata.sh.tpl")
  vars = {
    worker_access_private_key = file("./id_rsa_eks_bastion")
  }
}
