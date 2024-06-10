data "template_file" "msk-custom-configuration" {
  template = file("${path.module}/msk-custom-configuration.json.tpl")
  # 
  vars = {
    auto_create_topics_enable = var.auto_create_topics_enable
    delete_topic_enable       = var.delete_topic_enable
    log_retention_hours       = var.log_retention_hours
  }
}

resource "aws_msk_configuration" "main" {
  kafka_versions = var.kafka_versions
  name           = var.name

  server_properties = data.template_file.msk-custom-configuration.rendered
}
