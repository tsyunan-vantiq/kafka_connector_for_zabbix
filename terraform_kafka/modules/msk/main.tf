resource "aws_cloudwatch_log_group" "main" {
  name              = var.cloudwatch_log_group
  retention_in_days = var.cloudwatch_log_group_retention_in_days
}

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
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.main.name
      }
    }
  }

  configuration_info {
    arn      = var.msk_config_arn
    revision = var.msk_config_revision
  }

  client_authentication {
    unauthenticated = false
    sasl {
      iam = true
    }
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = false
      }
      node_exporter {
        enabled_in_broker = false
      }
    }
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }

  # volumeはオートスケールするためignore
  lifecycle {
    ignore_changes = [
      broker_node_group_info[0].storage_info[0].ebs_storage_info[0].volume_size
    ]
  }
}

resource "aws_appautoscaling_target" "kafka_storage" {
  max_capacity       = var.scaling_max_capacity
  min_capacity       = 1 # MSKの場合は固定値
  resource_id        = aws_msk_cluster.main.arn
  scalable_dimension = "kafka:broker-storage:VolumeSize"
  service_namespace  = "kafka"
}

resource "aws_appautoscaling_policy" "kafka_broker_scaling_policy" {
  name               = "${var.cluster_name}-broker-scaling-policy"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_msk_cluster.main.arn
  scalable_dimension = aws_appautoscaling_target.kafka_storage.scalable_dimension
  service_namespace  = aws_appautoscaling_target.kafka_storage.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "KafkaBrokerStorageUtilization"
    }

    target_value = var.scaling_target_value
  }
}
