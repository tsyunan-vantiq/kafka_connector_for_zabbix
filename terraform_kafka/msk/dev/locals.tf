locals {
  env_name     = "dev"
  cluster_name = "${local.env_name}-msk"
  subnets = [
    # data.terraform_remote_state.vpc.outputs.private-subnet.psb-1a.id,
    # data.terraform_remote_state.vpc.outputs.private-subnet.psb-1c.id
  ]
  kafka_version                          = "2.6.2"
  instance_type                          = "kafka.t3.small"
  ebs_volume_size                        = 10
  cloudwatch_log_group_retention_in_days = 14
  msk_security_group_name                = "${local.cluster_name}-sg"
  msk_security_group_description         = "Access control for ${local.cluster_name}"
  client_security_group_name             = "${local.cluster_name}-client-sg"
  client_security_group_description      = "Access control for client application of ${local.cluster_name}"
  log_retention_hours                    = 336 # 24h * 14days = 336h
}
