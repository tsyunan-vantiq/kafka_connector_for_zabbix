resource "aws_msk_cluster" "main" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type = var.instance_type
    storage_info {
      ebs_storage_info {
        volume_size = var.ebs_volume_size
      }
    }
    client_subnets  = var.client_subnets
    security_groups = [aws_security_group.msk.id]
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }

  logging_info {
    broker_logs {
      s3 {
        enabled = true
        bucket  = aws_s3_bucket.bucket.id
        prefix  = "logs/msk-"
      }
    }
  }

  configuration_info {
    arn      = var.msk_config_arn
    revision = var.msk_config_revision
  }

  client_authentication {
    unauthenticated = true
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }
}
