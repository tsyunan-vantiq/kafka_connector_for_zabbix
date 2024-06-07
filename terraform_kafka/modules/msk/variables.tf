variable "cloudwatch_log_group" {
  description = "CloudWatchのロググループ"
  type        = string
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "CloudWatchのログの保持期間"
  type        = number
}

variable "cluster_name" {
  description = "MSKクラスター名"
  type        = string
}

variable "kafka_version" {
  description = "Kafkaのバージョン"
  type        = string
}

variable "number_of_broker_nodes" {
  description = "Kafkaクラスター内のブローカーノードの必要な合計数。指定したクライアントサブネットの数の倍数である必要があります。"
  type        = number
}

variable "instance_type" {
  description = "MSKのインスタンスタイプ"
  type        = string
}

variable "ebs_volume_size" {
  description = "各ブローカーノードのEBSのボリュームサイズ"
  type        = number
}

variable "client_subnets" {
  description = "使用するサブネット"
  type        = list(any)
}

variable "msk_config_arn" {
  description = "MSKのコンフィグのARN"
  type        = string
}

variable "msk_config_revision" {
  description = "MSKのコンフィグのリビジョン"
  type        = number
}

variable "create_timeout" {
  description = "MSK作成時のterraformのタイムアウト時間"
  type        = string
  default     = "120m"
}

variable "update_timeout" {
  description = "MSK更新時のterraformのタイムアウト時間"
  type        = string
  default     = "120m"
}

variable "delete_timeout" {
  description = "MSK削除時のterraformのタイムアウト時間"
  type        = string
  default     = "120m"
}

variable "msk_security_group_name" {
  description = "MSKに付与するセキュリティグループ名称"
  type        = string
}

variable "msk_security_group_description" {
  description = "MSKに付与するセキュリティグループの説明"
  type        = string
}

variable "client_security_group_name" {
  description = "MSKのクライアントに付与するセキュリティグループ名称"
  type        = string
}

variable "client_security_group_description" {
  description = "MSKのクライアントに付与するセキュリティグループの説明"
  type        = string
}

variable "client_cidr_blocks" {
  description = "MSKに付与するセキュリティグループのIngressで許可するCIDR"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "scaling_max_capacity" {
  description = "ストレージの最大容量(GiB)"
  type        = number
  default     = 1000
}

variable "scaling_target_value" {
  description = "ストレージのオートスケーリングが起動する閾値"
  type        = number
  default     = 50
}
