module "msk" {
  source                            = "../../modules/msk"
  cluster_name                      = local.cluster_name
  kafka_version                     = local.kafka_version
  number_of_broker_nodes            = length(local.subnets)
  instance_type                     = local.instance_type
  ebs_volume_size                   = local.ebs_volume_size
  client_subnets                    = local.subnets
  msk_config_arn                    = module.msk_configuration.arn
  msk_config_revision               = module.msk_configuration.latest_revision
  msk_security_group_name           = local.msk_security_group_name
  msk_security_group_description    = local.msk_security_group_description
  client_security_group_name        = local.client_security_group_name
  client_security_group_description = local.client_security_group_description
  #
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc.id
  vpc_cidr = data.terraform_remote_state.vpc.outputs.vpc.cidr_block

  # このCIDR内からは、クライアント用SGを付与せずともMSKにアクセス可能となる
  client_cidr_blocks = [
    data.terraform_remote_state.vpc.outputs.vpc.cidr_block
  ]

  depends_on = [
    module.msk_configuration
  ]
}

module "msk_configuration" {
  source              = "../../modules/msk-configuration"
  kafka_versions      = [local.kafka_version]
  name                = "${local.cluster_name}-config"
  log_retention_hours = local.log_retention_hours
}
