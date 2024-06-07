variable "kafka_versions" {
  description = "当該設定を利用できるKafkaバージョンのリスト"
  type        = list(string)
}

variable "name" {
  description = "設定名称"
  type        = string
}

variable "auto_create_topics_enable" {
  description = "Kafka Topic の自動作成を許容する場合は true"
  type        = string
  default     = "true"
}

variable "delete_topic_enable" {
  description = "Kafka Topic の削除を許容する場合は true"
  type        = string
  default     = "true"
}

variable "log_retention_hours" {
  description = "ログファイル（トピックのデータ）を保持する時間数"
  type        = number
  default     = 168 # 24h * 7days = 168h
}
