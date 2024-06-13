output "arn" {
  description = "MSKのARN"
  value       = module.msk.cluster.arn
}

output "name" {
  description = "MSKのクラスタ名称"
  value       = module.msk.cluster.cluster_name
}

output "number_of_broker_nodes" {
  description = "Brokerの数"
  value       = module.msk.cluster.number_of_broker_nodes
}

output "bootstrap_brokers_sasl_iam" {
  description = "MSKのIAM認証用Bootstrap-String"
  value       = module.msk.cluster.bootstrap_brokers_sasl_iam
}

output "msk_client_security_group_id" {
  description = "MSKのクライアントに付与するSecurity GroupのID"
  value       = module.msk.msk_client_security_group_id
}
