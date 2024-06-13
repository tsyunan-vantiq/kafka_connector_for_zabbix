output "cluster" {
  description = "MSKクラスター"
  value       = aws_msk_cluster.main
}

output "msk_client_security_group_id" {
  description = "MSKのクライアントに付与するSecurity GroupのID"
  value       = aws_security_group.client.id
}
