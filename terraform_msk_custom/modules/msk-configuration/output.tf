output "arn" {
  description = "MSK設定のARN"
  value       = aws_msk_configuration.main.arn
}

output "latest_revision" {
  description = "MSK設定の最新リビジョン"
  value       = aws_msk_configuration.main.latest_revision
}
