
module "msk_cluster" {
  source = "terraform-aws-modules/msk-kafka-cluster/aws"

  create = true

  name                   = local.name
  kafka_version          = "3.5.1"
  number_of_broker_nodes = 2

  broker_node_client_subnets          = module.vpc.public_subnets
  broker_node_instance_type           = "kafka.t3.small"
  broker_node_security_groups         = [module.security_group_broker.security_group_id]
  encryption_in_transit_client_broker = "PLAINTEXT"
  encryption_in_transit_in_cluster    = false

  tags = local.tags
}

# module "msk_cluster_disabled" {
#   source = "terraform-aws-modules/msk-kafka-cluster/aws"
#   create = false
# }
