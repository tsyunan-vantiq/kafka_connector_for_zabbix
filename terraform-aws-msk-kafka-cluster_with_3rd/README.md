# 3rd　Partyモジュールを利用する

- [terraform-aws-msk-kafka-cluster](https://github.com/terraform-aws-modules/terraform-aws-msk-kafka-cluster/tree/master/examples/basic)


# Outputs:

```
Outputs:

appautoscaling_policy_arn = "arn:aws:autoscaling:us-west-2:508174134249:scalingPolicy:8a2369f2-80e8-4fbf-99ad-d2354cad7cc2:resource/kafka/arn:aws:kafka:us-west-2:508174134249:cluster/ex-dev/8436c311-534d-444b-944b-ba81a1a216e2-6:policyName/ex-dev-broker-storage-scaling"
appautoscaling_policy_name = "ex-dev-broker-storage-scaling"
appautoscaling_policy_policy_type = "TargetTrackingScaling"
arn = "arn:aws:kafka:us-west-2:508174134249:cluster/ex-dev/8436c311-534d-444b-944b-ba81a1a216e2-6"
bootstrap_brokers = tolist([
  "b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092,b-2.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092",
])
bootstrap_brokers_plaintext = "b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092,b-2.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092"
bootstrap_brokers_sasl_iam = ""
bootstrap_brokers_sasl_scram = ""
bootstrap_brokers_tls = ""
cluster_uuid = "8436c311-534d-444b-944b-ba81a1a216e2-6"
configuration_arn = "arn:aws:kafka:us-west-2:508174134249:configuration/ex-dev-5685026736663298833/41262b7f-8faf-430e-b35e-dcd4143df5ac-6"
configuration_latest_revision = 1
connect_custom_plugins = {}
current_version = "K3AEGXETSR30VB"
log_group_arn = "arn:aws:logs:us-west-2:508174134249:log-group:/aws/msk/ex-dev"
schema_registries = {}
schemas = {}
zookeeper_connect_string = "z-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2181,z-2.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2181,z-3.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2181"
zookeeper_connect_string_tls = "z-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2182,z-2.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2182,z-3.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:2182"
```
